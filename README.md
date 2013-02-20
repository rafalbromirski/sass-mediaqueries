![Media Queries Mixins for Sass](http://paranoida.github.com/sass-mediaqueries/images/logo.jpg)

---

### View it online: <http://paranoida.github.com/sass-mediaqueries>


Do you like Responsive Web Design? Everyone does!
Here you can find a collection of useful **media queries mixins** (including iOS devices like iPhones and iPads) for **Sass 3.2.0+**.

### Who did it?

Just me - [Rafal Bromirski](http://paranoida.com) - if you want you can follow me on [twitter](https://twitter.com/paranoida) or check my works on [dribbble](http://dribbble.com/paranoida).

### Browser support

Only modern browsers that support media queries.

## How to install

Download it manually or use the terminal:

```
curl -O https://raw.github.com/paranoida/sass-mediaqueries/master/_media-queries.scss
```
Inside your sass/scss file (ie. `application.scss`) add:

```
@import "media_queries";           // remember about a correct path
```


##What you can find inside?

```
Requirements:
  Sass 3.2.0+

Version:
  2.1                              // developed on 16/02/2013

Variables:
  $units: 1px;                     // default units for 'screen' mixins - it must include a digit!

Mixins:
  @ min-screen(width)              // shortcut for @media screen and (min-width ...)
  @ max-screen(width)              // shortcut for @media screen and (max-width ...)
  @ screen(min-width, max-width)   // shortcut for @media screen and (min-width ...) and (max-width ...)
  ---
  @ iphone3                        // only iPhone (2, 3G, 3GS) landscape & portrait
  @ iphone3-landscape              // only iPhone (2, 3G, 3GS) only landscape
  @ iphone3-portrait               // only iPhone (2, 3G, 3GS) only portrait
  ---
  @ iphone4                        // only iPhone (4, 4S) landscape & portrait
  @ iphone4-landscape              // only iPhone (4, 4S) only landscape
  @ iphone4-portrait               // only iPhone (4, 4S) only portrait
  ---
  @ iphone5                        // only iPhone (5) landscape & portrait
  @ iphone5-landscape              // only iPhone (5) only landscape
  @ iphone5-portrait               // only iPhone (5) only portrait
  ---
  @ ipad                           // only iPad (1, 2, Mini) landscape & portrait
  @ ipad-landscape                 // only iPad (1, 2, Mini) only landscape
  @ ipad-portrait                  // only iPad (1, 2, Mini) only portrait
  ---
  @ ipad-retina                    // only iPad (3, 4) landscape & portrait
  @ ipad-retina-landscape          // only iPad (3, 4) only landscape
  @ ipad-retina-portrait           // only iPad (3, 4) only portrait
  ---
  @ retina                         // devices with retina
```
##How does it work?

**Important**: Whenever you use screen mixins (min-screen, screen, ...) there is no need for using units. However, if you want to use units different than 'px' remember about overriding them inside your scss / sass file.

## Example 1
### min-screen(min-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)
It's a shortcut for **@media screen and (min-width ... ) { ... }**. Works great with [mobile first](http://www.lukew.com/ff/entry.asp?933) philosophy

```
@include min-screen(320)  { ... }
@include min-screen(480)  { ... }
@include min-screen(768)  { ... }
@include min-screen(1024) { ... }
```
It will be compiled to:

```
@media screen and ( min-width: 320px) )
{
  ...
}
@media screen and ( min-width: 480px )
{
  ...
}
@media screen and ( min-width: 768px )
{
  ...
}
@media screen and ( min-width: 1024px )
{
  ...
}
```

## Example 2
### max-screen(max-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

It's a shortcut for **@media screen and (max-width ... ) { ... }**.

**How to use it properly?** You should start from the widest screen resolution and proceed to the narrowest one (styles are inherited from previous conditions).

```
@include max-screen(1024) { ... }
@include max-screen(768)  { ... }
@include max-screen(640)  { ... }
```
It will be compiled to:

```
@media screen and ( max-width: 1024px )
{
  ...
}

@media screen and ( max-width: 768px )
{
  ...
}

@media screen and ( max-width: 640px )
{
  ...
}
```

## Example 3
### screen(min-width, max-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

You can add style rules for ranges. It could be really helpful if you want to target **group of devices** or just **one** with particular screen resolution.

```
@include screen(768, 1280) { ... }
@include screen(320, 640)  { ... }
```
It will be compiled to:

```
@media screen and ( min-width: 768px ) and ( max-width: 1280px )
{
  ...
}

@media screen and ( min-width: 320px ) and ( max-width: 640px )
{
  ...
}
```

## Example 4
### iOS devices - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

You can easily manage styles for particular iOS devices:

```
@include ipad-retina { ... }              // only iPad with retina
@include ipad { ... }                     // only iPad with retina (1, 2, Mini)

@include iphone5 { ... }                  // only iPhone 5
@include iphone4 { ... }                  // only iPhone 4/4S
@include iphone3 { ... }                  // only iPhone 2/3G/3GS
```

## Example 5
### device orientation - landscape and portrait - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

Want to add extra stuff only in landscape / portrait mode? Piece of cake:

```
@include ipad-retina { ... }              // common part only for iPad (3, 4) - landscape & portrait
@include ipad-retina-landscape { ... }
@include ipad-retina-portrait  { ... }

@include iphone5 { ... }                  // common part only for iPhone 5 - landscape & portrait
@include iphone5-landscape { ... }
@include iphone5-portrait  { ... }

@include iphone4 { ... }                  // common part only for iPhone 4/4S - landscape & portrait
@include iphone4-landscape { ... }
@include iphone4-portrait  { ... }
```

another one:

```
@include ipad-landscape { ... }           // only iPad (1, 2, Mini) - landscape
@include ipad-retina-landscape { ... }    // only iPad (3, 4) - landscape

@include iphone3-landscape { ... }        // only iPhone 2/3G/3GS - landscape
@include iphone4-landscape { ... }        // only iPhone 4/4S - landscape
@include iphone5-landscape { ... }        // only iPhone 5 - landscape
```

## Example 6
### retina - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

```
.example
{
  ...

  @include retina { ... }                  // only devices with retina
}
```
---
### License:

The MIT license

Copyright &copy; 2013 [Rafal Bromirski](http://paranoida.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
