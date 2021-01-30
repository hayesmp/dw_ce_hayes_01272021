## Primary Task
Context on Exercise: This project is structured in a way that allows you to focus on completing the primary task solely, then determine if you have the remaining time or skill set to look at the Advanced API interactions with minimal impact to your project. But if you’re considering implementing the additional API interactions, it may be helpful to read all descriptions first as it may impact how you design or implement your project.
Expectation: You must complete the Primary Task portion of this exercise and any of the optional Advanced API interactions you wish to tackle.
Implement an API using the primary.yml OpenAPI specification file.
If you're unfamiliar with OpenAPI, navigate to https://editor.swagger.io/#edit and use File -> Import File to import Primary.yml
Primary.yml
OpenAPI specification for primary task
Advanced.yml
OpenAPI specification for advanced API task


## Primary expected API interactions are:

User can create a new Customer (POST /customers)
User can view a list of Products (GET /products)
User can create a Customer Order (POST /customers/:id/orders)
User can view a Customer’s Order History (GET /customers/:id/orders)

﻿## Advanced API
In addition to the primary API interactions please also implement the following additional API interactions.
Refer to the advanced.yml OpenAPI specification file for API contracts.


## Advanced API interactions:

Add the concept of Inventory or Quantity to Products, such that if a customer submits an Order for a sold out Product, they receive an error message that the product is unavailable.
Add quantity to your Product seed data.
When an Order is submitted for a Product, decrement the quantity appropriately.
Add to README: Be sure to keep your README up to date if you decide to take on the Advanced API portion of this exercise.


## Clarifications
For the sake of the problem, persistence or other service dependencies are not required.
You can use a database, in-memory store, or file storage.
Any Customer, Product, or Order data used for interacting with the project or testing can come from a seeded database, in-memory store, or file storage (e.g. you can make up any fake products or customers to help seed your project).
You can choose any library or framework to use (e.g. Rails or Sinatra for Ruby, Flask or Django for Python).
You should optimize for both readability of your code and performance.
You should show some level of test coverage.
Include a README that describes how to use your project.
Avoid using real names or emails in project data.
For any questions you may have while implementing, you can state any assumptions you made in your code.
Assume these requirements came from a collaboration of product and engineering teams that you will meet with to discuss your solution with if you move onto the next stage of the interview process.

## Errors
The OpenAPI specs only show successful responses. You can handle http response codes and what errors to raise at your own discretion, but any errors returned by the API should be application/json with a “message” attribute, such as:


```
{
  “message”: “Description of error message”
}
```
