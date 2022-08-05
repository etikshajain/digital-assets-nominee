# digital-assets-nominee

## How a user registers?
A user gives input the nominee address and the  time interval between his visits to prove he's active.
As the user inputs the nominee address, we maintain a mapping between ( User_adr <= Nominee_adr ) which will return false if a different
address tries to claim the assets.

The user will be given a random number(id) which he will need to pass onto the nominee. This adds an additional check when a nominee claims assets.
This passing of a random number is inspired from how tornado.cash works. (https://tornado.cash/).

A mapping between his id and User struct will be maintained and a mapping between his address and User. 
(Maybe we need another way to store this id against user id)?

## How to figure how whether user is active/alive?
The user will come to the app using his registered account and will click a button to prove that he is active.
This action will update his last transaction timestamp in our database.


## How claiming works?
When the nominee comes to claim:
He will enter the id.
We will verify that he is legit.        

We will verify that the user is inactive
We will transfer the funds 

Things to be added:
Multiple nominees
Multiple wallets on different chains
Support for different assets -- currently only ether
How would the claiming process look like?
Condition x for person to be dead
How to make sure that account has activity?: one way is to ask the user to regularly send us eth
