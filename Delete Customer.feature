Feature: Delete Customer 

Delete Customer with customer email adrress

@mytag
Scenario: Delete customer by Email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I delete customer with email address {'fahimeh.shafiee@gmail.com'}
Then the response should customer deleted 
And the not retrieval by deleted email address 

@mytag
Scenario Outline: Delete customer by Email address
Given I have entered | fahimeh.shafiee@gmail.com|
When I press delete customer
Then the result should be delete customer successfully 
And the requested customer details must not retrieval in the database 
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
Examples:
  | email  | Result |
  | fahimeh.shafiee@gmail.com  | delete from database    |

@mytag
Scenario: Delete cusomer by unique value {FirstName, LastName and DateOfBirth}
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I Delete customer details for customer with FirstName, LastName and DateOfBirth  {'Fahimeh','Shafiei','fahimeh.shafiee@gmail.com'}
Then the result should be delete customer successfully 
And the requested customer details must not retrieval in the database 

@mytag
Scenario Outline: Delete cusomer by unique value {FirstName, LastName and DateOfBirth}
Given I have entered | Fahimeh             | Shafiei         | fahimeh.shafiee@gmail.com|
When I press delete customer by 3 unique value
Then the result should be delete customer successfully 
And the deleted customer details must not retrieval from the database 
Examples:
  | firstName | lastName | email  | Result |
  | Fahimeh   | Shafiei  | fahimeh.shafiee@gmail.com  | not found in database    |


@mytag
Scenario: Delete customer by wrong Email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I delete customer with email address {'fahime.shafie'}
Then the response should no customer found and not deleted  

@mytag
Scenario Outline: Delete customer by Email address
Given I have entered | 'fahime.shafie'|
When I press delete customer
Then the result should be no customer found and not deleted  

Examples:
  | email  | Result |
  | fahime.shafie  | not found in database and no delete action happend    |


@mytag_firstname
Scenario: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while firstname was wrong
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I Delete customer details for customer with FirstName, LastName and DateOfBirth  {'Fahim','Shafiei','fahimeh.shafiee@gmail.com'}
Then the result should be no customer found and not deleted 

@mytag_firstname
Scenario Outline: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while firstname was wrong
Given I have entered | Fahim             | Shafiei         | fahimeh.shafiee@gmail.com|
When I press delete customer by 3 unique value
Then the result should be no customer found and not deleted  

Examples:
  | firstName | lastName | email  | Result |
  | Fahim  | Shafiei  | fahimeh.shafiee@gmail.com  | not found in database for delete   |

@mytag_lastname
Scenario: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while lastname was wrong
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I Delete customer details for customer with FirstName, LastName and DateOfBirth  {'Fahimeh','Shafi','fahimeh.shafiee@gmail.com'}
Then the result should be no customer found and not deleted 

@mytag_firstname
Scenario Outline: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while lastname was wrong
Given I have entered | Fahimeh             | Shafi         | fahimeh.shafiee@gmail.com|
When I press delete customer by 3 unique value
Then the result should be no customer found and not deleted  

Examples:
  | firstName | lastName | email  | Result |
  | Fahimeh  | Shafi  | fahimeh.shafiee@gmail.com  | not found in database for delete   |  

@mytag_emailadd
Scenario: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while emailaddress was wrong
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I Delete customer details for customer with FirstName, LastName and DateOfBirth  {'Fahimeh','Shafi','fahimeh.shafiee@gmail'}
Then the result should be no customer found and not deleted 

@mytag_emailadd
Scenario Outline: Delete cusomer by unique value {FirstName, LastName and DateOfBirth} while emailaddress was wrong
Given I have entered | Fahimeh             | Shafiei         | fahimeh.shafiee@gmail|
When I press delete customer by 3 unique value
Then the result should be no customer found and not deleted  

Examples:
  | firstName | lastName | email  | Result |
  | Fahimeh  | Shafiei  | fahimeh.shafiee@gmail  | not found in database for delete   |  
