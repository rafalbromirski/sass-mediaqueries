![Media Queries Mixins for Sass](http://paranoida.github.com/sass-mediaqueries/images/logo.jpg)

##Online version
<a href="http://paranoida.github.com/sass-mediaqueries">http://paranoida.github.com/sass-mediaqueries</a>

##What is it?

Do you like Responsive Web Design? Everyone does!
Here you can find a collection of useful <strong>media queries mixins</strong> for <strong>Sass 3.2.0+</strong> (from this version Sass started supporting <a href="http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#mixin-content">@content</a>).

##Who did it?

Just me - <a href="http://paranoida.com">Rafal Bromirski</a> - if you want you can follow me on <a href="https://twitter.com/paranoida">twitter</a> or check my works on <a href="http://dribbble.com/paranoida">dribbble</a>.

##Browser support

Only modern browsers that support media queries.

##Bug tracking & features

"Woohoo! I've found a bug!" - that's cool, you can go <a href="https://github.com/paranoida/sass-mediaqueries/issues">here</a> and describe your story.<br/>"That might be cool..." - use pull request or create an issue - I will review your code.

##What you can find inside?

```
Requirements:
  Sass 3.2.0+

Version:
  1.0 ß                         // developed on 22/08/2012

Config:
  $units: 1px;                  // default units for 'screen' & 'min-screen' mixin

Mixins:
  @ min-screen(min-width)        // 'Mobile First' approach
  @ screen(max-width)            // 'Mobile Last' approach
  @ screen(min-width, max-width) // extra stuff
  ---
  @ ipad                         // iPad & iPad with retina, landscape & portrait
  @ ipad-landscape               // iPad & iPad with retina, only landscape
  @ ipad-portrait                // iPad & iPad with retina, only portrait
  ---
  @ ipad-retina                  // iPad with retina, landscape & portrait
  @ ipad-retina-landscape        // iPad with retina, only landscape
  @ ipad-retina-portrait         // iPad with retina, only portrait
  ---
  @ iphone                       // iPhone & iPhone with retina, landscape & portrait
  @ iphone-landscape             // iPhone & iPhone with retina, only landscape
  @ iphone-portrait              // iPhone & iPhone with retina, only portrait
  ---
  @ iphone-retina                // iPhone with retina, landscape & portrait
  @ iphone-retina-landscape      // iPhone with retina, only landscape
  @ iphone-retina-portrait       // iPhone with retina, only portrait
  ---
  @ retina                       // devices with retina (can someone test it on mbp with retina?)
```
##How does it work?
<strong>Important: </strong>Whenever you use screen mixins (min-screen, screen, ...) there is no need for using units. However, if you want to use units different than 'px' remember about overriding them inside your scss / sass file.

###Example 1 - 'min-screen(min-width)' - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>

If you like <a href="http://www.lukew.com/ff/entry.asp?933">mobile first</a> philosophy this mixin is there for you!
```scss
.example
{
  @include min-screen(320)  { width: 300px; }
  @include min-screen(480)  { width: 400px; }
  @include min-screen(768)  { width: 700px; }
  @include min-screen(1024) { width: 960px; }
}
```
It will be compiled to:
```scss
@media screen and ( min-width: 320px) )
{
  .example
  {
    width: 300px;
  }
}
@media screen and ( min-width: 480px )
{
  .example
  {
    width: 400px;
  }
}
@media screen and ( min-width: 768px )
{
  .example
  {
    width: 700px;
  }
}
@media screen and ( min-width: 1024px )
{
  .example
  {
    width: 960px;
  }
}
```
###Example 2 - 'screen(max-width)' - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>
'Mobile first' is good if you are building app from scratch, but when your team have spent ~10'000h developing big platform it could be a bit difficult. I've decided to go with another philosophy and I called it <strong>'Mobile Last'</strong> (or just <strong>'smart little bastard'</strong>).
<strong>How to use it properly?</strong> You should start from the widest screen resolution and proceed to the narrowest one (styles are inherited from previous conditions)
```scss
.example
{
  width: 1200px;

  @include screen(1024) { width: 1000px; color: red; }
  @include screen(768)  { width: 700px; }              // 'color' will be inherited by lower resolutions (<= 1024)
}
```
It will be compiled to:
```scss
.example
{
  width: 1200px;
}

@media screen and ( max-width: 1024px )
{
  .example
  {
    width: 1000px;
    color: red;
  }
}

@media screen and ( max-width: 768px )
{
  .example
  {
    width: 700px;
  }
}
```
###Example 3 - 'screen(min-width, max-width)' - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>
You can add style rules for ranges. It could be really helpful if you want to target <strong>group of devices</strong> or just <strong>one</strong> with particular screen resolution.
```scss
.example
{
  background: red;

  @include screen(768, 1280) { background: black; }
  @include screen(320, 640)  { background: white; }
}
```
It will be compiled to:
```scss
.example
{
  background: red;
}

@media screen and ( min-width: 768px ) and ( max-width: 1280px )
{
  .example
  {
    background: black;
  }
}

@media screen and ( min-width: 320px ) and ( max-width: 640px )
{
  .example
  {
    background: white;
  }
}
```
###Example 4 - iOS devices - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>
You can easily manage styles for iOS devices:
```scss
.example
{
  width: 1200px;
  background-image: url("images/bg-wrapper.png");

  @include ipad   { width: 700px; }
  @include iphone { width: 100%; }
  @include retina { background-image: url("images/bg-wrapper-2x.png"); }
  }
}
```
It will be compiled to:
```scss
.example
{
  width: 1200px;
  background-image: url("images/bg-wrapper.png");
}

@media screen and (min-device-width: 768px) and (max-device-width: 1024px)
{
  .example
  {
    width: 700px;
  }
}

@media screen and (max-device-width: 480px)
{
  .example
  {
    width: 100%;
  }
}

@media screen and (-webkit-min-device-pixel-ratio: 1.5)
{
  .example
  {
    background-image: url("images/bg-wrapper-2x.png");
  }
}
```
###Example 5 - device orientation - 'landscape' and 'portrait' - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>
Want to add extra stuff only in landscape / portrait mode? Piece of cake:
```scss
.example
{
  ...

  @include ipad { ... } // common part for iPad (landscape & portrait)
  @include ipad-landscape { ... }
  @include ipad-portrait  { ... }

  @include iphone { ... } // common part for iPhone (landscape & portrait)
  @include iphone-landscape { ... }
  @include iphone-portrait  { ... }
  }
}
```
another one:
```scss
.example
{
  ...

  @include ipad-landscape { ... }           // iPad & iPad with retina
  @include ipad-retina-landscape { ... }    // only for iPad with retina

  @include iphone-portrait  { ... }         // iPhone & iPhone with retina
  @include iphone-retina-portrait { ... }   // only for iPhone with retina
  }
}
```
or:
```scss
.example
{
  ...

  @include ipad { ... }                     // iPad & iPad with retina

  @include iphone-retina-portrait  { ... }  // iPhone with retina (portrait)
  @include iphone-retina-landscape { ... }  // iPhone with retina (landscape)
  }
}
```
###Example 6 - other - <a href="http://paranoida.github.com/sass-mediaqueries/demo">demo</a>
You can use mixins together but you should be careful - one mixin can override another.<br/>It's like in Ghostbusters: <strong>"Don't cross the streams!"</strong>. They did it eventually and pieces of <a href="http://en.wikipedia.org/wiki/Stay_Puft_Marshmallow_Man">Marshmallow Man</a> were everywhere.
```scss
.example
{
  ...

  @include screen(1200px) { ... }
  @include screen(1000px) { ... }
  @include screen(800px)  { ... }
  ...
  @include retina { ... }
  @include iphone { ... }
  }
}
```
###Like it? Tweet about it!
I've spent a lot of hours creating this, so if you like it spread the word!
CHEERS!

