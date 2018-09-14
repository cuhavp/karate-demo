Feature: validate schema
  * def oddSchema = { price: '#string', status: '#?_ <3', ck: '#number', name: '#regex[0=9X]'}
  * def isValidTime =  read('time-validator.js')