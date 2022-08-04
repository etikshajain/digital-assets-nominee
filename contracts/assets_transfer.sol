pragma solidity 0.8.10;

import "./ownable.sol"; // will be used if we deploy another smart contract for decentralised registration

contract Asset_transfer_to_nominee is Ownable{
    //events
    event new_user_added(
    );
    event active_transaction_completed(
    );
    event send_warning(
    );
    event transfer_assets(
    );

    //variables and structs
    struct User {
        uint id,
        address wallet;
        address nominee; 
        uint time_interval; // in seconds
        uint last_transaction_timestamp; //in seconds
    }
    mapping (uint=>User) id_to_user;
    mapping (address=>User) address_to_user;
    mapping (address=>bool) is_active;

    function generate_user_id() public returns (uint) {
        uint id = 0;
        return id;
    }
    
    function add_new_user(address _nominee, uint _time_interval) public {
        uint _id = generate_user_id();
        User new_user = User(_id, msg.sender, _nominee, _time_interavl, now);
        id_to_user[_id] = new_user;
        address_to_user[msg.sender] = new_user;
        exists[msg.sender] = true;
        emit new_user_added();
    }

    function active_transaction() external  {
        require(exists[msg.sender]==true);
        address_to_user[msg.sender].last_transaction_timestamp =  now;
        emit active_transaction_completed();
    }

    function nominee_claim(uint _id) public {
        User user = id_to_user[_id];
        require(user[_id].nominee == msg.sender);
        if(user.last_transaction_timestamp + user.time_interval < now) { //check whether user is active
            is_active[user.wallet] = false;
        }
        require(is_active[user.wallet]==false);
        //transfer assets:
        transfer_assets_to_nominee(uint _id);
        emit transfer_assets();
    }

    function transfer_assets_to_nominee(uint _id) external payable {
        //tbd
    }

}
