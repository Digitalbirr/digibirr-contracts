// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./token/BEP20/BEP20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

/**
 * @dev {BEP20} token, including:
 *
 *  - Preminted initial supply
 *  - Ability for holders to burn (destroy) their tokens
 *  - No access control mechanism (for minting/pausing) and hence no governance
 *
 *
 * _Available since v3.4._
 */
contract DigiBirr is Initializable, BEP20Upgradeable, UUPSUpgradeable, AccessControlUpgradeable {

    bytes32 public constant WHITELISTER_ROLE = keccak256("WHITELISTER_ROLE");
    function initialize(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) public virtual initializer {
        address _owner = _msgSender();
        __DigiBirr_init(_name, _symbol, _decimals, _initialSupply, _owner);
    }
    /**
     * @dev Mints `initialSupply` amount of token and transfers them to `owner`.
     *
     * See {BEP20-constructor}.
     */
    function __DigiBirr_init(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply,
        address _owner
    ) internal initializer {
        __Context_init();
        __UUPSUpgradeable_init();
        __AccessControl_init();
        __BEP20_init(_name, _symbol);        
        _setupRole(DEFAULT_ADMIN_ROLE, _owner);
        _setupRole(WHITELISTER_ROLE, _owner);   
        _initialSupply = _initialSupply * (10 ** _decimals);
        _mint(_owner, _initialSupply);
    }
    
    

    function _authorizeUpgrade(address) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}

    uint256[50] private __gap;
}