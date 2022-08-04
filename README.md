# digital-assets-nominee

A user gives input the nominee address and the active time interval.

He will be given a random number as id which he will need to pass onto the nominee. User struct is created.

A mapping between his id and User struct will be maintained and a mapping between his address and User.

The user will come to the app using his registered account and will click a button to prove that he is alive.

This action will update his last transaction timestamp in our database.

When the nominee comes to claim:

he will enter the id

we will verify that he is legit

we will verify that the user is inactive

we will transfer the funds 

things to be decided:

multiple nominees

multiple wallets on different chains

support for different assest -- only ether

condition x for person to be dead

how to make sure that account has activity: one way is to ask the user to regularly send us eth
