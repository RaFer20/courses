# Offset Properties
(`top`, `bottom`, `left`, `right`)
Offeset properties work in conjunction with position to determine what direction you want to move an element and how far. Each offset measures the inward distance from the side of the container named by the offset property. Negative offsets shift elements in the opposite direction. That is, they cause the browser to push the edges outward from the container.

# `Position` Property

The position property tells the browser how to position the selected elements.

## `position: static`
Static positioning is the default. While floated, grid, flex, as well as elements with absolute and fixed positioning get removed from the page flow, statically positioned items are part of the page flow. They appear in the same order they appear in the markup. The offset properties do not affect static elements.

## `position: relative`
Relative positioning moves an element to a new position relative to where the browser would otherwise put it.
*Relative positioning does not remove an item from the document flow. The browser positions the next element as though the previous one still occupied its pre-offset location.*

When using relative positioning, you should typically provide at most one vertical offset (top or bottom) and at most one horizontal offset (left or right). However, the CSS standard does permit using both vertical or both horizontal offsets at the same time:

- left overrides right for left-to-right languages.
- right overrides left for right-to-left languages.
- top overrides bottom at all times.


## `position: absolute`
Absolute positioning causes the browser to move the element to a new position within a container element. By default, the container is the nearest ancestor element that has a fixed, relative, absolute, or sticky position. If no such ancestor is present, the browser uses the initial containing block (the body); that is, the browser positions the element at an absolute position on the page.
*Absolute positioning removes elements from the normal document flow. No matter where you position it, the browser won't treat that space as occupied space.*

## `position: fixed`
Fixed positioning behaves as it sounds: it sets an element to a fixed position within the window. The element **does not move** if the user scrolls the page.