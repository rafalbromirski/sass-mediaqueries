##What is it?

It's a collection of useful <strong>media queries mixins</strong> for <strong>Sass 3.2.0+</strong> (from this version they started supporting <a href="http://sass-lang.com/docs/yardoc/file.SASS_CHANGELOG.html">@content</a> block).
This project doesn't follow 'mobile first' philosophy. Why? Well, in my opinion 'mobile first' is good if you are building app from scratch, but when your team have spent ~10'000h developing big platform it could be a bit difficult. That's why I've created this tool. Don't blame me for that - blame IE's creators.
I've tested it on multiple web browsers, iPhones & iPads with iOS 5.x.

##Who did it?

Just me - <a href="http://paranoida.com">Rafal Bromirski</a> - if you want you can follow me on <a href="https://twitter.com/paranoida">twitter</a> or check my works on <a href="http://dribbble.com/paranoida">dribbble</a>.

##Browser support

Only modern browsers that support media queries.

##Bug tracking & features

"Woohoo! I've found a bug!" - that's cool, you can go <a href="https://github.com/paranoida/sass-mediaqueries/issues">here</a> and describe your story.<br/>"That might be cool..." - use pull request - I will review your code.

##What you can find inside?

```
Requirements:
  Sass 3.2.0+

Version:
  1.0                            // developed on 19/08/2012

Config:
  $units: 'px';                  // default units for 'screen' mixin

Mixins:
  @ screen(screen-size)
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
  @ retina                       // devices with retina (can someone test it on mbp with retina?)</code></pre>
```
##How does it work?
<strong>Tip: </strong>You should start from the widest screen resolution and proceed to the narrowest one (styles are inherited from previous conditions)

###Example 1 - 'screen' mixin
Instead of writing new condition for another screen resolution you can use 'screen' mixin and put new size as a parameter.
```scss
.container
{
  width: 1200px;

  // you can type units if you want - "1024px" or "1024" - both versions are valid
  @include screen(1024) { width: 1000px; }
  @include screen(768)  { width: 700px; }
}
```
It will be compiled to:
```scss
.container
{
  width: 1200px;
}

@media screen and ( max-width: 1024px) )
{
  .container
  {
    width: 1000px;
  }
}

@media screen and ( max-width: 768px) )
{
  .container
  {
    width: 700px;
  }
}
```

###Example 2 - iOS devices
You can easily manage styles for iOS devices:
```scss
.container
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
.container
{
  width: 1200px;
  background-image: url("images/bg-wrapper.png");
}

@media screen and (min-device-width: 768px) and (max-device-width: 1024px)
{
  .container
  {
    width: 700px;
  }
}

@media screen and (max-device-width: 480px)
{
  .container
  {
    width: 100%;
  }
}

@media screen and (-webkit-min-device-pixel-ratio: 1.5)
{
  .container
  {
    background-image: url("images/bg-wrapper-2x.png");
  }
}
```
###Example 3 - device orientation - 'landscape' and 'portrait'
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
or another one:
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
###Example 4 - other
You can use mixins together but you should be careful - one mixin can override another.<br/>It's like in Ghostbusters: "Don't cross the streams!". They did it eventually but it wasn't very pleasant for them :)
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