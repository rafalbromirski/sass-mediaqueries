![Media Queries Mixins for Sass](http://paranoida.github.com/sass-mediaqueries/images/logo.jpg)

---

### View it online: <http://paranoida.github.com/sass-mediaqueries>


Do you like Responsive Web Design? Everyone does!
Here you can find a collection of useful **media queries mixins** (including iOS devices like iPhones and iPads) for **Sass**.

### Who did it?

Just me - [Rafal Bromirski](http://paranoida.com) - if you want you can follow me on [twitter](https://twitter.com/paranoida) or check my works on [dribbble](http://dribbble.com/paranoida).

### Browser support

Only modern browsers that support media queries.

## How to install

### Manually

Download it or use `curl`:

```
curl -O https://raw.githubusercontent.com/paranoida/sass-mediaqueries/master/_media-queries.scss
```

### Or as a [gem](http://github.com/paranoida/sass-mediaqueries-rails) in your Gemfile (inside assets group):

```
group :assets do
	...
	gem 'sass-mediaqueries-rails'
end
```


Inside your sass/scss file (ie. `application.scss`) add:

```
@import "media-queries";
```


##What you can find inside?

```
Requirements:
  Sass 3.2.0+

Version:
  1.3                                      // developed on 14/11/2013

Mixins:
  @ min-screen(width)                      // shortcut for @media screen and (min-width ...)
  @ max-screen(width)                      // shortcut for @media screen and (max-width ...)
  @ screen(min-width, max-width)           // shortcut for @media screen and (min-width ...) and (max-width ...)
  ---
  @ min-screen-height(height)              // shortcut for @media screen and (min-height ...)
  @ max-screen-height(height)              // shortcut for @media screen and (max-height ...)
  @ screen-height(min-height, max-height)  // shortcut for @media screen and (min-height ...) and (max-height ...)
  ---
  @ iphone3                                // only iPhone (2, 3G, 3GS) landscape & portrait
  @ iphone3(landscape)                     // only iPhone (2, 3G, 3GS) only landscape
  @ iphone3(portrait)                      // only iPhone (2, 3G, 3GS) only portrait
  ---
  @ iphone4                                // only iPhone (4, 4S) landscape & portrait
  @ iphone4(landscape)                     // only iPhone (4, 4S) only landscape
  @ iphone4(portrait)                      // only iPhone (4, 4S) only portrait
  ---
  @ iphone5                                // only iPhone (5) landscape & portrait
  @ iphone5(landscape)                     // only iPhone (5) only landscape
  @ iphone5(portrait)                      // only iPhone (5) only portrait
  ---
  @ ipad                                   // all iPads (1, 2, 3, 4, Mini) landscape & portrait
  @ ipad(landscape)                        // all iPads (1, 2, 3, 4, Mini) only landscape
  @ ipad(portrait)                         // all iPads (1, 2, 3, 4, Mini) only portrait
  ---
  @ ipad-retina                            // only iPad (3, 4) landscape & portrait
  @ ipad-retina(landscape)                 // only iPad (3, 4) only landscape
  @ ipad-retina(portrait)                  // only iPad (3, 4) only portrait
  ---
  @ hdpi(ratio)                            // devices with hidpi displays (default ratio: 1.3)
```

##How does it work?

**Important**: Whenever you use screen mixins (min-screen, max-screen, screen, etc) you must use units!

## Example 1
### min-screen(min-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)
It's a shortcut for **@media screen and (min-width ... ) { ... }**. Works great with [mobile first](http://www.lukew.com/ff/entry.asp?933) philosophy

```
@include min-screen(320px)  { ... }
@include min-screen(480px)  { ... }
@include min-screen(768px)  { ... }
@include min-screen(1024px) { ... }
```
It will be compiled to:

```
@media screen and (min-width: 320px)
{
  ...
}
@media screen and (min-width: 480px)
{
  ...
}
@media screen and (min-width: 768px)
{
  ...
}
@media screen and (min-width: 1024px)
{
  ...
}
```

## Example 2
### max-screen(max-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

It's a shortcut for **@media screen and (max-width ... ) { ... }**.

**How to use it properly?** You should start from the widest screen resolution and proceed to the narrowest one (styles are inherited from previous conditions).

```
@include max-screen(1024px) { ... }
@include max-screen(768px)  { ... }
@include max-screen(640px)  { ... }
```
It will be compiled to:

```
@media screen and (max-width: 1024px)
{
  ...
}

@media screen and (max-width: 768px)
{
  ...
}

@media screen and (max-width: 640px)
{
  ...
}
```

## Example 3
### screen(min-width, max-width) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

You can add style rules for ranges. It could be really helpful if you want to target **group of devices** or just **one** with particular screen resolution.

```
@include screen(768px, 1280px) { ... }
@include screen(320px, 640px)  { ... }
```
It will be compiled to:

```
@media screen and (min-width: 768px) and (max-width: 1280px)
{
  ...
}

@media screen and (min-width: 320px) and (max-width: 640px)
{
  ...
}
```

## Example 4
### iOS devices - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

You can easily manage styles for particular iOS devices:

```
@include ipad { ... }                     // all iPads
@include ipad-retina { ... }              // only iPad with retina

@include iphone5 { ... }                  // only iPhone 5
@include iphone4 { ... }                  // only iPhone 4/4S
@include iphone3 { ... }                  // only iPhone 2/3G/3GS
```

## Example 5
### device orientation - landscape and portrait - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

Want to add extra stuff only in landscape / portrait mode? Piece of cake:

```
@include ipad-retina { ... }              // common part only for iPad (3, 4) - landscape & portrait
@include ipad-retina(landscape) { ... }
@include ipad-retina(portrait)  { ... }

@include iphone5 { ... }                  // common part only for iPhone 5 - landscape & portrait
@include iphone5(landscape) { ... }
@include iphone5(portrait)  { ... }

@include iphone4 { ... }                  // common part only for iPhone 4/4S - landscape & portrait
@include iphone4(landscape) { ... }
@include iphone4(portrait)  { ... }
```

another one:

```
@include ipad(landscape) { ... }          // all iPads - landscape
@include ipad-retina(landscape) { ... }   // only iPad (3, 4) - landscape

@include iphone3(landscape) { ... }       // only iPhone 2/3G/3GS - landscape
@include iphone4(landscape) { ... }       // only iPhone 4/4S - landscape
@include iphone5(landscape) { ... }       // only iPhone 5 - landscape
```

## Example 6
### hdpi(ratio) - [demo](http://paranoida.github.com/sass-mediaqueries/demo)

```
.example
{
  ...

  @include hdpi { ... }                   // only devices with hidpi displays (including retina)
}
```

or to narrow down:


```
.example
{
  ...

  @include hdpi(2) { ... }                // only devices with retina
}
```
---
### License:

The MIT license

Copyright &copy; 2013 [Rafal Bromirski](http://paranoida.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
