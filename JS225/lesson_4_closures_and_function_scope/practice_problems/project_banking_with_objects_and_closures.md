# Project - Banking with Objects and Closures
We'll build a small banking application and look at how we can use closures to control access to the application's data.

## 1. Create an object named `account` that represents a bank account. It should contain a balance property that stores the account's current balance.

### Solution:
```js
let account = {
  balance: 0,
}
```

## 2. Add a `deposit` method to the `account` object that takes a single argument, the value of the deposit. The deposit method adds the value of the argument passed to it to the account's balance, and then returns the deposit amount.
```js
console.log(account.balance);
// 0
console.log(account.deposit(12));
// 12
console.log(account.balance);
// 12
console.log(account.deposit(10));
// 10
console.log(account.balance);
// 22
```

### Solution:
```js
let account = {
  balance: 0,
  deposit(amount) {
    this.balance += amount;
    return amount;
  },
}
```

## 3. Add a `withdraw` method to the `account` object that takes a single argument, the amount to withdraw. It should subtract the amount from the account's balance and return the amount subtracted.
```js
console.log(account.balance);
// 100
console.log(account.withdraw(19));
// 19
console.log(account.balance);
// 81
```
If the account contains less than the withdrawal amount, the method should limit the withdrawal to the amount available, and return the actual amount withdrawn. This should leave the account with a balance of 0.
```js
console.log(account.balance);
// 81
console.log(account.withdraw(91));
// 81
console.log(account.balance);
// 0
```

### Solution:
```js
let account = {
  balance: 0,
  deposit(amount) {
    this.balance += amount;
    return amount;
  },
  withdraw(amount) {
    if (amount > this.balance) {
      amount = this.balance;
    }

    this.balance -= amount;
    return amount;
  },
}
```

## 4. Each account should have a record of every deposit and withdrawal applied to it. To do this, add a property named `transactions` to account that contains an array of transactions, each of which is an object with `type` and `amount` properties.
```js
console.log(account.deposit(23));
// 23
console.log(account.transactions);
// [{...}]
console.log(account.transactions[0]);
// {type: "deposit", amount: 23}
```

### Solution:
```js
let acount = {
  balance: 0,
  transactions: [],
  deposit(amount) {
    this.balance += amount;
    this.transactions.push({type: 'deposit', amount})
    return amount;
  },
  withdraw(amount) {
    if (amount > this.balance) {
      amount = this.balance;
    }

    this.balance -= amount;
    this.transactions.push({type: 'withdraw', amount})
    return amount;
  },
}
```

## 5. We want to create more than one account. Move the account creation code to a function named `makeAccount` that returns a new account object.
```js
let account = makeAccount();
console.log(account.deposit(15));
// 15
console.log(account.balance);
// 15
let otherAccount = makeAccount();
console.log(otherAccount.balance);
// 0
```


### Solution:
```js
function makeAccount() {
  return {
    balance: 0,
    deposit(amount) {
      this.balance += amount;
      this.transactions.push({type: 'deposit', amount})
      return amount;
    },

    withdraw(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: 'withdraw', amount})
      return amount;
    },
    transactions: [],
  }
}
```

## 6. We also need an object to manage accounts: a bank. Create a function that returns an object that represents a bank. The bank should have a property named `accounts` that represents a list of accounts.
```js
let bank = makeBank();
console.log(bank.accounts);
// []
```

### Solution:
```js
function makeBank() {
  return {
    accounts: [],
  }
}
```

## 7. Add a new method named `openAccount` to the object returned by `makeBank`. It should create a new account, add it to the bank's accounts collection, and return the new account. Each new account should have a unique account number, starting at 101; each account number should be one greater than the previous account created.
```js
let bank = makeBank();
let account = bank.openAccount();
console.log(account.number);
// 101
console.log(bank.accounts);
// [{...}]
console.log(bank.accounts[0]);
// {
//  number: 101,
//  balance: 0,
//  transactions: [],
//  deposit: [Function: deposit],
//  withdraw: [Function: withdraw]
// }
let secondAccount = bank.openAccount();
console.log(secondAccount.number);
// 102
```

### Solution:
```js
function makeAccount(number) {
  return {
    number,
    balance: 0,
    deposit(amount) {
      this.balance += amount;
      this.transactions.push({type: 'deposit', amount})
      return amount;
    },
    withdraw(amount) {
      if (amount > this.balance) {
        amount = this.balance;
      }

      this.balance -= amount;
      this.transactions.push({type: 'withdraw', amount})
      return amount;
    },
    transactions: [],
  }
}

function makeBank() {
  return {
    accounts: [],
    openAccount() {
      let number = this.accounts.length + 101;
      let account = makeAccount(number);
      this.accounts.push(account);
      return account;
    },
  }
}
```

## 8. Add a new method to the bank object that transfers money from one account to another.
```js
let bank = makeBank();
let source = bank.openAccount();
console.log(source.deposit(10));
// 10
let destination = bank.openAccount();
console.log(bank.transfer(source, destination, 7));
// 7
console.log(source.balance);
// 3
console.log(destination.balance);
// 7
```

### Solution:
```js
function makeBank() {
  return {
    accounts: [],
    openAccount() {
      let number = this.accounts.length + 101;
      let account = makeAccount(number);
      this.accounts.push(account);
      return account;
    },
    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  }
}
```

## 9. Change the code so that users can access the account balance, account number, and transactions list by calling methods, but not by directly accessing those properties.
```js
let bank = makeBank();
let account = bank.openAccount();
console.log(account.balance());
// 0
console.log(account.deposit(17));
// 17
let secondAccount = bank.openAccount();
console.log(secondAccount.number());
// 102
console.log(account.transactions());
// [{...}]
```

### Solution:
```js
function makeBank() {
  function makeAccount(number) {
    let balance = 0;
    let transactions = [];

    return {
      deposit(amount) {
        balance += amount;
        transactions.push({type: 'deposit', amount})
        return amount;
      },
      withdraw(amount) {
        if (amount > balance) {
          amount = balance;
        }
  
        balance -= amount;
        transactions.push({type: 'withdraw', amount})
        return amount;
      },
      number() {
        return number;
      },
      balance() {
        return balance;
      },
      transactions() {
        return transactions;
      },
    }
  }

  return {
    accounts: [],
    openAccount() {
      let number = this.accounts.length + 101;
      let account = makeAccount(number);
      this.accounts.push(account);
      return account;
    },

    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  }
}
```

## 10. Change the code so that users can no longer access the list of accounts.
```js
let bank = makeBank();
console.log(bank.accounts);
// undefined
```

### Solution:
```js
function makeBank() {
  let accounts = [];
  
  function makeAccount(number) {
    let balance = 0;
    let transactions = [];

    return {
      deposit(amount) {
        balance += amount;
        transactions.push({type: 'deposit', amount})
        return amount;
      },
      withdraw(amount) {
        if (amount > balance) {
          amount = balance;
        }
  
        balance -= amount;
        transactions.push({type: 'withdraw', amount})
        return amount;
      },
      number() {
        return number;
      },
      balance() {
        return balance;
      },
      transactions() {
        return transactions;
      },
    }
  }

  return {
    openAccount() {
      let number = accounts.length + 101;
      let account = makeAccount(number);
      accounts.push(account);
      return account;
    },

    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  }
}
```