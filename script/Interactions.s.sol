// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentDeployedBasicNft = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentDeployedBasicNft);
    }
    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }

}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentDeployedMoodNft = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintMoodNftOnContract(mostRecentDeployedMoodNft);
    }
    function mintMoodNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    uint256 public constant tokenId = 0;
    function run() external {
        address mostRecentDeployedMoodNft = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMoodNft(mostRecentDeployedMoodNft);
    }
    function flipMoodNft(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).flipMood(tokenId);
        vm.stopBroadcast();
    }
}
