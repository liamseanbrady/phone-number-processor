#### Summary

We want to write a class that deals with phone numbers in the US. Think of how to approach this, write some tests, then implement it.

An example US phone number: 1 (123) 456-7820

#### Detailed Specifications

- If phone number contains non-numeric, return false.
- If phone number is 10 digit numeric, assume it's valid
- If phone number is 11 digit numeric, strip the 1. If it doesn't start with 1, return false.
- If phone number is greater than 11 digits, return false.
- If phone number is less than 10 digits, return false.
- If a number is valid, you should be able to retrieve the Numbering Plan Area Code (NPA), exchange code (NXX), and the Subscriber Number individually.
- If the NPA, NXX or Subscriber Number is invalid then the whole number is invalid.
- Number constituents for reference: NPA-NXX-xxxx
- A valid NPA is first number is [2-9] and second and third numbers are [0-9] 
- A valid NXX is first number is [2-9] and second and third numbers are [0-9]. If second number is 1 then the third number cannot be 1, otherwise it's invalid.
- A valid Subscriber Number is all four numbers [0-9]
- If number passes all validations, return clean number (all numeric)
