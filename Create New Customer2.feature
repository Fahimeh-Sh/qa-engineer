Feature: Create New Customer2 

CreateNewCustomer for adding new customer with all required fields 

read Customer for reading customer with email adrress
@mytag_combination_of_wrong_format_emailaddress_and_wrong_format_bank_accNumber_and_wrongformat_mobilenumber
Scenario: create new customer with wrong format emailaddress and wrong format bank account number and wrong format mobile number
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | AB9352000821      | fahimeh.shafiee@gmail    | 1234!@34$#$%         | 100.50    |
When all fields entered with valid information,expect email address nad bank account
Then the customer should not created successfully 
And creation failed because 3 values 'AB9352000821','fahimeh.shafiee@gmail.com', '1234!@34$#$%' are in wrong fromat
@mytag_combination_of_wrong_format_emailaddress_and_wrong_format_bank_accNumber_and_wrongformat_mobilenumber
Scenario Outline: create new customer with wrong format emailaddress and wrong format bank account number
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | AB9352000821      | fahimeh.shafiee@gmail    | 1234!@34$#$%         | 100.50    |
Then the customer should not created successfully
And creation failed because 3 values 'AB9352000821','fahimeh.shafiee@gmail.com', '1234!@34$#$%' are in wrong fromat
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| sara             | smith         | 19998-01-01  | AB9352000821      | fahimeh.shafiee@gmail   | 1234!@34$#$%         | 188.50    |creation failed because 3 values 'AB9352000821','fahimeh.shafiee@gmail.com', '1234!@34$#$%' are in wrong fromat|
@mytag_duplicate_firstname_lastname_dateofbirth
Scenario: create new customer with duplicate email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
And I enter below following attributes to create another new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000828      | fahimeh.sh@gmail.com    | 123456888         | 188.50    |
When all fields entered with valid information,i mean if some data is manadory it is filled above
Then the customer should not created successfully 
And creation failed because 'Fahimeh','Shafiei','19990-01-01' exist in database
@mytag_duplicate_firstname_lastname_dateofbirth
Scenario Outline: create new customer with duplicate email address
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.sh@gmail.com   | 123456789         | 100.50    |
When I press Create New Customer for customer | Fahimeh             | Shafiei         | 19990-01-01  | 009352000828      | fahimeh.sh@gmail.com  | 123456888         | 188.50    |
Then the customer should not created successfully
And creation failed because 'Fahimeh','Shafiei','19990-01-01' exist in database
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000828      | fahimeh.sh@gmail.com  | 123456888         | 188.50    |creation failed because 'Fahimeh','Shafiei','19990-01-01' exist in database
