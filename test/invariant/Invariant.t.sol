 // SPDX-License-Identifier: GNU General Public License v3.0
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {PoolFactory} from "../../src/PoolFactory.sol";
import {TSwapPool} from "../../src/PoolFactory.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";


contract Invariant is  StdInvariant, Test {
 //these pools have 2 assets 
    ERC20Mock poolToken;
    ERC20Mock weth;
//contracts
PoolFactory factory;
TSwapPool pool;
//Defining the intials (x and y )
int256 constant STARTING_X=100e18;//starting ERC20 /POOL TOKEN
int256 constant STARTING_Y=50e18; //Startung WETH

    function setUp() public {
     weth=new ERC20Mock();
     poolToken=new ERC20Mock();
     factory= new PoolFactory(address(weth));
     pool=TSwapPool(factory.createPool(address(poolToken)));

     //create those initial x&y balanaces
     poolToken.mint(address(pool),uint256(STARTING_X));
     weth.mint(address(pool),uint256(STARTING_Y));
    }
}
