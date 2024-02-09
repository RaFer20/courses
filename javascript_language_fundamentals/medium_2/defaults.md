# Defaults
The `processOrder` function shown below accepts the following arguments: `price`, `quantity`, `discount`, `serviceCharge` and `tax`. Any arguments other than `price` may be omitted when calling the function, in which case, default values will be assigned.

```js
function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

processOrder(100);      // 126.5
```
This function uses conditional statements to test whether arguments have been omitted. When an argument is omitted, JavaScript automatically initializes it to a value of `undefined`. The function takes advantage of this behavior by setting `undefined` arguments to a default value.

The following variation of the `processOrder` function has the same behavior as the first:
```js
function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}
```
However, both of these solutions have a limitation that can lead to an incorrect result for certain inputs. What is this limitation and how does it affect the result?

## Solution
In both cases if a value is `0` it will get reassigned because `0` is a falsy value.

Possible solution:
```js
function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (quantity === undefined) {
    quantity = 1;
  }

  if (discount === undefined) {
    discount = 0;
  }

  if (serviceCharge === undefined) {
    serviceCharge = 0.1;
  }

  if (tax === undefined) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}
```