// SPDX-License-Identifier: MIT
// File: openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/IERC20MetadataUpgradeable.sol
// Altered: IERC20 to IBEP20 for DBIRR on Binance Smart Chain

pragma solidity ^0.8.0;

import "../IBEP20Upgradeable.sol";

/**
 * @dev Interface for the optional metadata functions from the BEP20 standard.
 *
 * _Available since v4.1._
 */
interface IBEP20MetadataUpgradeable is IBEP20Upgradeable {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}