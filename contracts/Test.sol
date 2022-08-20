// // SPDX-License-Identifier: MIT
// pragma solidity >=0.4.22 <0.9.0;

// contract Test{

//     function test(uint testNum) external pure returns(uint data){

//     assembly{
//         let _num :=4
//         let _fmp := mload(0x40)
//     }
//     assembly{
//        mstore(0x40,0x90)
//     }

//     uint8[3] memory items = [1,2,3];

//     assembly{
//         // first item=1
//         data := mload(0x90) 
//     }
//      assembly{
//         // 2nd item position add ox20-> (32bytes) 
//         data := mload(add(0x90,0x20)) 
//     }
    
//     // return testNum;
//     }

// function test2() external pure returns(uint data){


//     assembly{
//         // 2nd item position add ox20-> (32bytes) 
//         let fmp := mload(0x40)
//         mstore(fmp,0x00) 
//     }
    
//     // return testNum;
//     }

// }