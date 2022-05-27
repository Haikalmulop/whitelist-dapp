//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract whitelist {

    //Max number contract whitelist address allowed
    uint8 public maxWhitelistedAddresses;

    //Create mapping of whitelistedaddresses
    //if an address is whitelisted, set it true, it is false by default
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep trackof how many addresess have been whitelisted
    //Note: DO NOT CHANGE THIS VARIABLE NAME
    uint8 public numAddresessWhitelisted;

    //setting the max number of whitelisted addresess
    //user will put the value at the time of deployment
    constructor (uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

     /*
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */

     function addAddressToWhitelist() public {

         //check if user has already been whitelisted
         require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

         //check if numAddressesWhitelisted < maxWhitelistedAddresses, if not throw error
         require(numAddresessWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");

         //add the address which called the functionto the whitelistedAddress array
         whitelistedAddresses[msg.sender] = true;

         //increase the number of whitelisted addresses
         numAddresessWhitelisted += 1;

     }
}