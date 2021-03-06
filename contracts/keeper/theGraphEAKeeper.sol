// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

interface KeeperCompatibleInterface {
    function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
    function performUpkeep(bytes calldata performData) external;
}


interface ITheGraphDataKovan {
    function requesTheGraphData(address _oracle,  string calldata  _jobId) external;
}

contract TheGraphEAKeeper is KeeperCompatibleInterface {
    /**
    * Public counter variable
    */
    uint public counter;
    


    /**
    * Use an interval in seconds and a timestamp to slow execution of Upkeep
    */
    uint public immutable interval;
    uint public lastTimeStamp;
    
    
    // address private  ITheGraphDataKovan;

    
    constructor(uint updateInterval) public {
      interval = updateInterval;
      lastTimeStamp = block.timestamp;

      counter = 0;
    }


    function checkUpkeep(bytes calldata checkData) external override returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;

        // We don't use the checkData in this example
        // checkData was defined when the Upkeep was registered
        performData = checkData;
    }

    function performUpkeep(bytes calldata performData) external override {
        lastTimeStamp = block.timestamp;
        counter = counter + 1;
        
        //address(0x462c35E1459E4DE7f34059607789C9C1F1Db04Af).call(bytes32(keccak256("requesTheGraphData()")),0xf6980958cc650Be283EbF3d1386b2870c87C30dC,"58f57eb0265b40c7b01f28f137e857e2"); //通过bytes32(keccak256("eat()"指定方法，后面的是参数
       // ITheGraphDataKovan().requesTheGraphData(0xf6980958cc650Be283EbF3d1386b2870c87C30dC,"58f57eb0265b40c7b01f28f137e857e2");
        

        // We don't use the performData in this example
        // performData is generated by the Keeper's call to your `checkUpkeep` function
        /**
        *  call ITheGraphDataEA requesTheGraphData
        *
        *
        *       
        */
        
        ITheGraphDataEA(address(0x462c35E1459E4DE7f34059607789C9C1F1Db04Af)).requesTheGraphData(address(0xf6980958cc650Be283EbF3d1386b2870c87C30dC),"58f57eb0265b40c7b01f28f137e857e2");
    
        // address(0x462c35E1459E4DE7f34059607789C9C1F1Db04Af).call(abi.encodeWithSignature("transfer(address,uint256)", address(0xf6980958cc650Be283EbF3d1386b2870c87C30dC), 123));
       
        performData;
        
    }
    
}