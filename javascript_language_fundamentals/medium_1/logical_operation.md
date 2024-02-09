# Logical Operation
What will each line of the following code return? Don't run the code until after you have tried to answer.

```js
(false && undefined);
(false || undefined);
((false && undefined) || (false || undefined));
((false || undefined) || (false && undefined));
((false && undefined) && (false || undefined));
((false || undefined) && (false && undefined));
('a' || (false && undefined) || '');
((false && undefined) || 'a' || '');
('a' && (false || undefined) && '');
((false || undefined) && 'a' && '');
```

## Solution
```js
false
undefined
undefined
false
false
undefined
'a'
'a'
undefined
undefined
```

**Reminder**
The return value of a logical expression can be determined by iteratively evaluating the expression from left to right until it results in a single value. 
Example:
```js
((false && undefined) || 'a' || '');
(false || 'a' || '');
('a' || '');
('a');

------

('a' && (false || undefined) && '');
('a' && undefined && '');
(undefined && '');
(undefined);

------

((false || undefined) || (false && undefined));
(undefined || false);
(false);
```