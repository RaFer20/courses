# Guessing The Password
Write a password guessing program that tracks how many times the user enters the wrong password. If the user enters the password wrong three times, log `'You have been denied access.'` and terminate the program. If the password is correct, log `'You have successfully logged in.'` and end the program.

Example
```js
// password = 'password'

// The program displays a dialog that asks the user to enter a password.
// If the user enters the wrong password, keep asking up to three times. After
// three failures, log the access denied.

What is the password: 123
What is the password: opensesame
What is the password: letmein

// message on the console
You have been denied access.

// If the user enters the right password, report login success.
What is the password: password

// message on the console
You have successfully logged in.
```

## Solution
See `guessing_the_password.html`
```js
let password = 'password'

for (let tries = 0; tries < 3; tries++) {
  attempt = prompt('What is the password:')
  if (password === attempt) {
    console.log('You have successfully logged in.')
    break
  } else if (tries === 2 && attempt !== password) {
    console.log('You have been denied access.')
  }
}
```

## Alternative Solutions
```js
const PASSWORD = 'password';
let failedAttempts = 0;

while (true) {
  let guess = prompt('What is the password:');

  if (guess === PASSWORD) {
    console.log('You have successfully logged in.');
    break;
  }

  failedAttempts += 1;

  if (failedAttempts === 3) {
    console.log('You have been denied access.');
    break;
  }
}
```

```js
const PASSWORD = 'password';
let failedAttempts = 0;

do {
  let guess = prompt('What is the password:');

  if (guess === PASSWORD) {
    break;
  }

  failedAttempts += 1;
} while (failedAttempts < 3);

if (failedAttempts === 3) {
  console.log('You have been denied access.');
} else {
  console.log('You have successfully logged in.');
}
```