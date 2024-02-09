Write a Function named `processReleaseData` that processes the following movie release data:
```js
let newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];
```

The Function should generate an Array of Objects that contain only the `id` and `title` key/value pairs. You may assume that `id` and `title`, when existing, is an integer greater than 0 and non-empty string respectively. Here are the rules:

Keep only releases that have both `id` and `title` property present.
Keep only the `id` and `title` data for each release.

```js
function processReleaseData(data) {
  // ...
}

processReleaseData(newReleases);

// should return:
[{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];
```


## Solution:
```js
function processReleaseData(data) {
  return data.filter(release => release.id && release.title)
             .map(release => {
               return {
                 id: release.id,
                 title: release.title,
               };
             });
}
```


## Further Exploration
The current solution assumes that the value of id will be an integer value greater than 0. If it was possible to have a value of 0 for id, what would the implications be to the current solution? What changes, if any, would need to be made in order to handle the 0 value?

If an id had a value of `0` our `filter` wouldnt select it because `release.id` would evaluate to `false`. Adding a check for if the value is `0` would fix the issue.
```js
function processReleaseData(data) {
  return data.filter(release => (release.id || release.id === 0) && release.title)
             .map(release => {
               return {
                 id: release.id,
                 title: release.title,
               };
             });
}
```