Feature: Read Customer 

read Customer for reading customer with email adrress

@mytag
Scenario: Get customer by Email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I retrieve customer details for customer with email address {'fahimeh.shafiee@gmail.com'}
Then the response should contain the following details:
And the requested customer details in the database should be shown as below
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |

@mytag
Scenario Outline: Get customer by Email address
Given I have entered | fahimeh.shafiee@gmail.com|
When I press Find customer
Then the result should be find customer successfully 
And the requested customer details in the database should be shown as below
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
Examples:
  | email  | Result |
  | fahimeh.shafiee@gmail.com  | found in database    |


@mytag
Scenario: Get cusomer by unique value {FirstName, LastName and DateOfBirth}
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I retrieve customer details for customer with FirstName, LastName and DateOfBirth  {'Fahimeh','Shafiei','fahimeh.shafiee@gmail.com'}
Then the response should contain the following details:
And the requested customer details in the database should be shown as below
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |

@mytag
Scenario Outline: Get cusomer by unique value {FirstName, LastName and DateOfBirth}
Given I have entered | Fahimeh             | Shafiei         | fahimeh.shafiee@gmail.com|
When I press Find customer by 3 unique value
Then the result should be find customer successfully 
And the requested customer details in the database should be shown as below
| Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
Examples:
  | firstName | lastName | email  | Result |
  | Fahimeh             | Shafiei         | fahimeh.shafiee@gmail.com  | found in database    |

  @mytag
Scenario: Get customer by not exist Email address
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
When I retrieve customer details for customer with email address {'fahi.shafie@gmail.com'}
Then the response should be no customer founded, please check enetered value and check again

@mytag
Scenario Outline: Get customer by not exist Email address
Given I have entered | fahi.shafie@gmail.com|
When I press Find customer
Then the response should be no customer founded, please check enetered value and check again

Examples:
  | email  | Result |
  | fahi.shafie@gmail.com  | not found in database or entered email address is not correct   |

