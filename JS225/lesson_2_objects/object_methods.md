# Example Object
Every function has a context assigned at execution time. JavaScript assigns the context automatically when a function call uses the `()` syntax. We can access the context with the `this` keyword within the method.
```js
let me = {
  firstName: 'Jane',
  lastName: 'Doe',
};

let friend = {
  firstName: 'John',
  lastName: 'Smith',
};

let mother = {
  firstName: 'Amber',
  lastName: 'Doe',
};

let father = {
  firstName: 'Shane',
  lastName: 'Doe',
};

let people = {
  collection: [me, friend, mother, father],
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(people.fullName);
  },

  getIndex: function(person) {
    let index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName &&
          comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    return this.collection[this.getIndex(person)];
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    this.collection.push(person);
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },

  remove: function(person) {
    let index;
    if (this.isInvalidPerson(person)) {
      return;
    }

    index = this.getIndex(person);
    if (index === -1) {
      return;
    }

    this.collection.splice(index, 1);
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    let existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },
};
```