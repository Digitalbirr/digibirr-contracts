// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./token/BEP20/BEP20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

contract DigiBirr is Initializable, BEP20Upgradeable, UUPSUpgradeable, AccessControlUpgradeable {

    function initialize(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) public virtual initializer {
        address _owner = _msgSender();
        __DigiBirr_init(_name, _symbol, _decimals, _initialSupply, _owner);
    }
    
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
        _initialSupply = _initialSupply * (10 ** _decimals);
        _mint(_owner, _initialSupply);
    }   
    
    function _authorizeUpgrade(address) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}

    uint256[50] private __gap;
}
