Feature: Create New Customer1 
CreateNewCustomer for adding new customer with all required fields 
@mytag
Scenario: create new customer
Given I enter below following attributes to create new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When all fields entered with valid information,i mean if some data is manadory it is filled above
Then the customer should be successfully created
And the customer details in the database should match the given details
@mytag
Scenario Outline: Create New Customer
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I press CreateNewCustomer
Then the result should be cutomer successfully created on the screen
Examples:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
@mytag_duplicate_email_address
Scenario: create new customer with duplicate email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
And I enter below following attributes to create another new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Sara             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
When all fields entered with valid information,i mean if some data is manadory it is filled above
Then the customer should not created successfully 
And creation failed because 'fahimeh.shafiee@gmail.com' exist in database

@mytamytag_duplicate_email_addressg
Scenario Outline: create new customer with duplicate email address
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I press Create New Customer for sustomer | Sara             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
Then the customer should not created successfully
And creation failed because 'fahimeh.shafiee@gmail.com' exist in database
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Sara             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |creation failed because 'fahimeh.shafiee@gmail.com' exist in database|
@mytag_unique_value_fileds
Scenario: create new customer with duplicate unique values
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
And I enter below following attributes to create another new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
When all fields entered with valid information,i mean if some data is manadory it is filled above
Then the customer should not created successfully 
And creation failed because 3 unique values 'Fahimeh','Shafiei','fahimeh.shafiee@gmail.com' exist in database
@mytag_unique_value_fileds
Scenario Outline: create new customer with duplicate email address
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I press Create New Customer for sustomer | Fahimeh             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
Then the customer should not created successfully
And creation failed because 3 unique values 'Fahimeh','Shafiei','fahimeh.shafiee@gmail.com' exist in database
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Fahimeh             | Shafiei         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |creation failed because 3 unique values 'Fahimeh','Shafiei','fahimeh.shafiee@gmail.com' exist in database|
@mytag_create_customer_with_wrong_mobile_number
Scenario: create new customer with wrong mobile number
Given Given I enter below following attributes to create new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | ABCD9352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When all fields entered with valid information, expect mobile number
Then the customer should not created successfully 
And creation failed because wrong format of mobile number
@mytag_create_customer_with_wrong_mobile_number
Scenario Outline: create new customer with wrong mobile number
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | ABCD9352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I press Create New Customer for sustomer | Fahimeh             | Shafiei         | 19998-01-01  | ABCD9352000821      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
Then the customer should not created successfully
And creation failed because of wrong format of mobile number
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Fahimeh             | Shafiei         | 19998-01-01  | ABCD9352000821      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |creation failed because of wrong format of mobile number|
@mytag_create_customer_with_invalid_emailaddress
Scenario: create new customer with invalid email address
Given Given I enter below following attributes to create new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@.com    | 123456789         | 100.50    |
When all fields entered with valid information, expect emailaddress
Then the customer should not created successfully 
And creation failed because of invalid format of mobile number
@mytag_create_customer_with_invalid_emailaddress
Scenario Outline: create new customer with invalid email address
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@.com    | 123456789         | 100.50    |
When I press Create New Customer for sustomer | Fahimeh             | Shafiei         | 19998-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | #$%^^&**(*         | 188.50    |
Then the customer should not created successfully
And creation failed because of invalid format of mobile number
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Fahimeh             | Shafiei         | 19998-01-01  | 009352000821      | fahimeh.shafiee@.com    | #$%^^&**(*         | 188.50    |creation failed because of invalid format of bank account number|
@mytag_create_customer_with_invalid_bank_acc_number
Scenario: create new customer with invalid bank accountnumber
Given Given I enter below following attributes to create new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@.com    | #$%^^&**(*         | 100.50    |
When all fields entered with valid information, expect emailaddress
Then the customer should not created successfully 
And creation failed because of invalid format of bank accountnumber
@mytag_create_customer_with_invalid_bank_acc_number
Scenario Outline: create new customer with invalid bank accountnumber
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@.com    | #$%^^&**(*         | 100.50    |
When I press Create New Customer for sustomer | Fahimeh             | Shafiei         | 19998-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | #$%^^&**(*         | 188.50    |
Then the customer should not created successfully
And creation failed because of invalid format of bank accountnumber
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| Fahimeh             | Shafiei         | 19998-01-01  | 009352000821      | fahimeh.shafiee@.com    | 123456888         | 188.50    |creation failed because of invalid format of bank account number|
@mytag_combination_of_emailaddress_and_bank_accNumber
Scenario: create new customer with duplicate emailaddress and bank account number
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
And I enter below following attributes to create another new cutomer
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | sara             | smith         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456789         | 188.50    |
When all fields entered with valid information,i mean if some data is manadory it is filled above
Then the customer should not created successfully 
And creation failed because 2 unique values '123456789','fahimeh.shafiee@gmail.com' exist in database
@mytag_combination_of_emailaddress_and_bank_accNumber
Scenario Outline: create new customer with duplicate emailaddress and bank account number
Given I have entered | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I press Create New Customer for sustomer | sara             | smith         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |
Then the customer should not created successfully
And creation failed because 2 unique values '123456789','fahimeh.shafiee@gmail.com' exist in database
Examples:
| firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |Result| 
| sara             | smith         | 19998-01-01  | 009352000828      | fahimeh.shafiee@gmail.com    | 123456888         | 188.50    |creation failed because 2 unique values '123456789','fahimeh.shafiee@gmail.com' exist in database exist in database|
