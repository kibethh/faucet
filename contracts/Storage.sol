// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {

  uint8 public a = 7; // 1 byte
  uint16 public b = 10; // 2bytes
  address public c = 0x20906965DF9a4041C1A199b86D6936cDF7ae1ECC; // 20bytes
  bool d = true; // 1 byte
  uint64 public e = 15; // 8bytes
  // 32 bytes, all values will be stored in slot 0
  // 0x 0f 01 20906965df9a4041c1a199b86d6936cdf7ae1ecc 000a 07


  uint256 public f = 200; // 32bytes -> slot 1

  uint8 public g = 40; // 1byte -> slot 2

  uint256 public h = 789; // 32bytes -> slot 3

}
 // const instance= await Storage.deployed()