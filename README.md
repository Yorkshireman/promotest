To clone:  
`git clone git@github.com:Yorkshireman/promotest.git`  
  
How to run:  
- open irb
- `load './lib/checkout.rb'`
- `co = Checkout.new`

The Product Range is represented as a hash inside the ProductRange module, as so:
```
    { 
    001 => { product: "Lavender Heart", price: 9.25 }, 
    002 => { product: "Personalised cufflinks", price: 45.00 },
    003 => { product: "Kids T-Shirt", price: 19.95 } 
    }
```

To 'scan' an item, use its product code:
- `co.scan(001)`  
This can be done multiple times.

Promotions:  
Two promotions are currently built in - one is the 'Lavender Heart' promotion: when two or more are bought, their price drops to £8.50. The second promotion is a 10% discount when the purchase total is over £60. Note that the purchase only qualifies for the 10% discount if the total is over £60 AFTER any Lavender Heart promotion is applied.  
  
Promotions are easily modified because they are kept separately in the `PromotionalRules` class which is injected into the `Checkout` class.  

To view your current basket:
- `co.basket`  

To get the total price:
- `co.total`
  
Testing:  
To run the rspec tests:  
- `bundle`  
- `rspec`  