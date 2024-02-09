# Invoice
The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items". How can you refactor the function so that it will work with invoices containing any number of line items?
```js
function invoiceTotal(amount1, amount2, amount3, amount4) {
  return amount1 + amount2 + amount3 + amount4;
}

invoiceTotal(20, 30, 40, 50);          // works as expected
invoiceTotal(20, 30, 40, 50, 40, 40);  // does not work; how can you make it work?
```

## Solution
```js
function invoiceTotal(...args) {
  let total = 0;

  for (i = 0; i < args.length; i++) {
    total += args[i];
  }
  
  return total;
}

invoiceTotal(20, 30, 40, 50);          // 140
invoiceTotal(20, 30, 40, 50, 40, 40);  // 220
```