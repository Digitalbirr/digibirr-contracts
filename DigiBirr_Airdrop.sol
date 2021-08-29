// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./crowdsale/Crowdsale.sol";
import "./crowdsale/WhitelistCrowdsale.sol";
import "./crowdsale/IndividuallyCappedCrowdsale.sol";
import "./token/BEP20/BEP20Upgradeable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DigiBirr_Airdrop is Crowdsale, Ownable, WhitelistCrowdsale, IndividuallyCappedCrowdsale {
    constructor(
        uint256 rate,
        address wallet,
        BEP20Upgradeable token
    ) Crowdsale(rate, wallet, token)
    {
    }

    function getOwner() external view returns(address) {
      return owner();
    }
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal virtual override (Crowdsale, WhitelistCrowdsale, IndividuallyCappedCrowdsale) isWhitelisted(_beneficiary) {
        super._preValidatePurchase(_beneficiary, _weiAmount);
      }
    function _updatePurchasingState(
        address _beneficiary,
        uint256 _weiAmount
      )
        internal virtual override (Crowdsale, IndividuallyCappedCrowdsale)
      {
        super._updatePurchasingState(_beneficiary, _weiAmount);
      }
}