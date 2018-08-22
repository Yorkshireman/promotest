[![Build Status](https://travis-ci.org/Yorkshireman/promotest.svg?branch=master)](https://travis-ci.org/Yorkshireman/promotest)  

[![Coverage Status](https://coveralls.io/repos/Yorkshireman/promotest/badge.svg?branch=master&service=github)](https://coveralls.io/github/Yorkshireman/promotest?branch=master)   
  
#### How to run:  
- open irb
- `load './lib/checkout.rb'`
- `co = Checkout.new`

The Product Range is represented as a hash inside the ProductRange module, as so:
```
    { 
      001 => { product: "Lavender Heart", price: 9.25 }, 
      002 => { product: "Personalised cufflinks", price: 45.00 },
      003 => { product: "Kids T-Shirt", price: 19.95 },
      004 => { product: "Cinnamon Shampoo", price: 8.99 } 
    }
```

To 'scan' an item, use its product code:
- `co.scan(001)`  
This can be done multiple times.

#### Promotions:  
Three promotions are currently built in - one is the 'Lavender Heart' promotion: when two or more are bought, their price drops to £8.50.  

The second promotion is a 20% discount if at least two Lavenders Hearts and at least one Cinnamon Shampoo have been bought. 

The third promotion is a 10% discount when the purchase total is over £60. Note that the purchase only qualifies for the 10% discount if the total is over £60 AFTER the other promotions have (if applicable) been applied.    
  
Promotions have been split into two different categories (see lib/services/apply_promotions.rb): 'item_promotions' and 'basket_discounts'. Item promotions are discounts that affect individual items or item types. Basket discounts are discounts that affect the grand total. Basket discounts are applied after item discounts at the moment.

Promotions are easily added or deleted by just adding/removing a class and adding/removing that Promotion to/from the ApplyPromotions' relevant array.  

To view your current basket:
- `co.basket`  

To get the total price:
- `co.total`
  
#### Testing:  
To run the rspec tests:  
- `bundle`  
- `rspec`  

Travis builds using Ruby version 2.2.0.
