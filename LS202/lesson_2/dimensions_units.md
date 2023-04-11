# When to Use the Different Units

Trying to decide which dimensional units you should use is sometimes difficult. Here are some general guidelines - none of these are absolute, and you will almost certainly find developers that disagree:

## Use absolute units sparingly, and stick with pixels. Pixels work well for:
- the root font size
- image widths and heights
- top and bottom margins and padding, sometimes useful with left and right margins and padding
- width or height of fixed-width/fixed-height containers such as navigation sidebars
- border widths

## Use relative units liberally:
- Use rems for fonts, possibly with a fallback to ems or pixels. The root font should use pixels.
- If you must use ems instead of rems, try to avoid compounding font sizes.
- Use rems, ems, or pixels for left and right margins and padding.
- Use % for measurements that are proportional to the container element's width or height. Percentages work best for container dimensions and - come in handy when you want certain areas of the page to grow and shrink as the width of the browser window changes.
- Use auto with width and height to let the browser calculate an appropriate value.
- Use auto with left and right margins to left, center, or right justify a block element within its container.

*You can ignore or break any of these rules when appropriate.*