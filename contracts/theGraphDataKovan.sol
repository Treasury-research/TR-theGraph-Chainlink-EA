// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract TheGraphDataKovan is ChainlinkClient {
    // address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    bytes32 public data;

    constructor() public {
        setPublicChainlinkToken();
        // 	oracle = 0xf6980958cc650Be283EbF3d1386b2870c87C30dC; // oracle address
        // 	jobId = "58f57eb0265b40c7b01f28f137e857e2"; //job id
        fee = 0.1 * 10**18; // 0.1 LINK
    }

    /**
     * Make TheGraph request
     */
    function requesTheGraphData(address _oracle, string memory _jobId) public {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(_jobId),
            address(this),
            this.fulfillEthereumData.selector
        );
        // 	req.add("function", "GLOBAL_QUOTE");
        // 	req.add("symbol", "TSLA");
        //	string[] memory copyPath = new string[](1);
        //     copyPath[0] = "USD";
        // //     copyPath[1] = "05. price";
        //     req.addStringArray("copyPath", copyPath);
        // req.addInt("times", 100000000);
        req.add("copyPath", "USD");
        sendChainlinkRequestTo(_oracle, req, fee);
    }

    /**
     * Callback function
     */
    function fulfillEthereumData(bytes32 _requestId, bytes32 _data)
        public
        recordChainlinkFulfillment(_requestId)
    {
        data = _data;
    }

    /**
     * stringToBytes32
     *
     */
    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyString = bytes(source);
        if (tempEmptyString.length == 0) {
            return 0x0;
        }

        assembly {
            // solhint-disable-line no-inline-assembly
            result := mload(add(source, 32))
        }
    }
}
