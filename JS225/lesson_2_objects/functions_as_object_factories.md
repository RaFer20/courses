# Functions as Object Factories
If we want multiple instances of a similar object we can duplicate and change the code:
```js
let sedan = {
  speed: 0,
  rate: 8,
  accelerate() {
    this.speed += this.rate;
  },
};

let coupe = {
  speed: 0,
  rate: 12,
  accelerate() {
    this.speed += this.rate;
  },
};
```
This way we can interact with both cars separately.

The issue here is that it's difficult to see which attributes define the identities of `sedan` and `coupe`, in other words, how are they similar and how are they unique?

One way to solve this issue is to create a function that takes care of handling the similarities and takes arguments to handle the differences.

We can create a function that takes acceleration rate and breaking rate as arguments and use it to create similar objects with specific differences:
```js
function makeCar(accelRate, breakRate) {
  return {speed: 0, 
          accelRate,
          breakRate,
          accelerate() {
            this.speed += this.accelRate;
          },
          break() {
            this.speed -= this.breakRate;
            if (this.speed < 0) this.speed = 0;
          },
        }
}
//////////////////////////////////////////
> let sedan = makeCar(8, 6);
> sedan.accelerate();
> sedan.speed;
= 8
> sedan.brake();
> sedan.speed;
= 2
> sedan.brake();
> sedan.speed;
= 0
```