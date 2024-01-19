Feature: Update Customer 

update Customer for existing customer 

@mytag
Scenario Outline:  <testCase> <expectedResult>
Given cutomser with following attributes exist in database:
 | firstName | lastName | dateOfBirth | email                   | phoneNumber | bankAccountNumber | amoutnDue |
 | Fahimeh             | Shafiei         | 19990-01-01  | 009352000821      | fahimeh.shafiee@gmail.com    | 123456789         | 100.50    |
 | Sara             | Been         | 19998-01-01  | 009352000827      | sara.been@gmail.com    | 123454455         | 158.50    |
When user saves the Customer '<testCase>'
    Then the save '<expectedResult>'

    Examples:
      | testCase                 | expectedResult | firstName | lastName | dateOfBirth | email                | AmountDue |
      | WITHOUT FIRST NAME       | FAILS          |           | Shafiei    | 1990-01-01  | fahimeh.shafiee@gmail.com  | 100.5     |
      | WITHOUT LAST NAME        | FAILS          | Fahimeh    |          | 1990-01-01  | fahimeh.shafiee@gmail.com  | 100.50       |
      | WITHOUT DATE OF BIRTH    | FAILS          | Fahimeh    | Shafiei    |             | fahimeh.shafiee@gmail.com  | 1500      |
      | WITHOUT EMAIL            | FAILS          | Fahimeh    | Shafiei    | 1990-01-01  |                      | 37000     |
      | WITH DUPLICATED EMAIL    | FAILS          | Fahimeh    | Shafiei    | 1990-01-01  | fahimeh.shafiee@gmail.com | 1000      |
      | WITH ALL REQUIRED FIELDS | IS SUCCESSFUL  | Fahimeh    | Shafiei    | 1990-01-01  | fahimeh.shafiee@gmail.com  | 100.50    |


Scenario: Update Customer Information with Valid Email

    Given  customer with the following details exists:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email              | BankAccountNumber | AmountDue |
      | Fahimeh      | Shafiei      | 1990-01-01  | 1234567890 | fahimeh.shafiee@gmail.com | 123454455  | 150.50    |

    When customeris updated with the following details:
      | FirstName | LastName | DateOfBirth | PhoneNumber  | Email            | BankAccountNumber | AmountDue |
      | Fahimeh      | Shafiei      | 1990-01-01  | 1234567890 | maryam.ebrahimi@gmail.com | 123454455  | 150.50    |

    Then the update done sucessfully


  Scenario: Update Customer Information with Valid Bank Account Number

    Given a customer with the following details exists:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Fahimeh    | Shafiei    | 1990-01-01  | 1234567890 | maryam.ebrahimi@gmail.com | 123456789  | 150.00    |

    When customeris updated with the following details:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | NewBankAccountNumber | AmountDue |
      | Fahimeh    | Shafiei    | 1990-01-01  | 1234567890 | maryam.ebrahimi@gmail.com | 123456799     | 150.00    |

    Then if bank account number format is valid
    And sucessfully update happend


  Scenario Outline: Update Customer Information with first Name, last name, and Date of Birth

    Given customer with the following details exists:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Fahimeh    | Shafiei    | 1990-01-01  | 1234567890 | maryam.ebrahimi@gmail.com | 123456799  | 150.00    |

    When  the customer is updated with the following details:
      | firstName | lastName | dateOfBirth | PhoneNumber  | Email               | BankAccountNumber | AmountDue |
      | Fahimeh    | Shafieimoghadam    | 1990-01-01  | 1234567890 | maryam.ebrahimi@gmail.com | 123456799  | 150.00    |
    Then update didn't happend and proper error message must be shown 