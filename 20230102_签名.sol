// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//创造一个函数包含了其余函数.其中有输入信息为:1 签名者地址; 2 加密信息; 3 链下签名数据bytes
//函数内包含对加密信息2次哈希加密
//函数内包含一个recover函数,可以将加密信息和链下签名数据还原成地址,还原地址应该等于singer,返回布尔值
//创建第一个加密函数
//创建第二个加密函数,并且添加字符串"\x19Ethereum Signed Message:\n32"
//创建recover恢复函数,创建三个局部变量,r s v,等于_split(_sig),通过2次加密信息和rsv值恢复出地址
//首选需求签名长度为65位,否则失败;其次通过内联汇编,得到r s v的值(_sig的不同范围取值)

contract SignCtr{
    function verify(address _signer,string memory _message,bytes memory _sig) public pure returns (bool) {
        bytes32 messageHash1 = MessageHash1(_message);
        bytes32 messageHash2 = MessageHash2(messageHash1);

        return recover(messageHash2,_sig) == _signer;
    }

    function MessageHash1(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function MessageHash2(bytes32 _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _message));
    }

    function recover(bytes32 _message,bytes memory _sig) public pure returns (address){
        (bytes32 r,bytes32 s, uint8 v) = split(_sig);
        return ecrecover(_message,v,r,s);
    }

    function split(bytes memory _sig) public pure returns(bytes32 r,bytes32 s,uint8 v) {
        require (_sig.length == 65,"invaild signature length");

        assembly {
            r := mload (add(_sig, 32))
            s := mload (add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
            //内联汇编照抄,不理解
        }
    }

}