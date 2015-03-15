# sass-mediaqueries

It's a collection of useful **Media Queries** mixins for **Sass** (including iOS devices, TVs and more). Fully customizable and very easy to use.

#### Online: <http://paranoida.github.com/sass-mediaqueries>
#### Demo: <http://paranoida.github.com/sass-mediaqueries/demo.html>

### How to install:

1. Using **bower**:

	```
	bower install sass-mediaqueries
	```

	Or manually using **curl**:

	```
	curl -O https://raw.githubusercontent.com/paranoida/sass-mediaqueries/master/_media-queries.scss
	```

2. Then, at the top of your sass/scss file (ie. `application.scss`) add:

	```scss
	@import "media-queries";
	```

## Doc:

#### Mixins:

```
@  screen(min-width, max-width, orientation)
@  min-screen(width)
@  max-screen(width)
--
@  screen-height(min-height, max-height, orientation)
@  min-screen-height(height)
@  max-screen-height(height)
--
@  hdpi(ratio)
--
@  landscape
@  portrait
--
@  iphone3(orientation)
@  iphone4(orientation)
@  iphone5(orientation)
@  iphone6(orientation)
@  iphone6-plus(orientation)
--
@  ipad(orientation)
@  ipad-retina(orientation)
--
@  hdtv(standard)
```

---

#### - screen($min-width, $max-width, $orientation: false)

It targets group of devices or just one with particular screen width and orientation (optional).

###### # Example:

```scss
@include screen(320px, 640px) { ... }
@include screen(768px, 1024px, landscape) { ... }
```

It will be compiled to:

```css
@media screen and (min-width: 768px) and (max-width: 1280px) { ... }
@media screen and (min-width: 320px) and (max-width: 640px) and (orientation: landscape) { ... }
```

#### - min-screen($width)

It's a shortcut for `@media screen and (min-width ... )`

###### # Example:

```scss
@include min-screen(768px) { ... }
@include min-screen(1024px) { ... }
```

It will be compiled to:

```css
@media screen and (min-width: 768px) { ... }
@media screen and (min-width: 1024px) { ... }
```


#### - max-screen($width)

It's a shortcut for `@media screen and (max-width ... )`

###### # Example:

```scss
@include max-screen(1024px) { ... }
@include max-screen(768px) { ... }
```

It will be compiled to:

```css
@media screen and (max-width: 1024px) { ... }
@media screen and (max-width: 768px) { ... }
```

---

#### - screen-height($min-height, $max-height, $orientation: false)

It targets group of devices or just one with particular screen height and orientation (optional).

###### # Example:

```scss
@include screen-height(640px, 768px) { ... }
@include screen-height(640px, 768px, landscape) { ... }
```

It will be compiled to:

```css
@media screen and (min-height: 768px) and (max-height: 1280px) { ... }
@media screen and (min-height: 768px) and (max-height: 1280px) and (orientation: landscape) { ... }
```

#### - min-screen-height($width)

It's a shortcut for `@media screen and (min-height ... )`

###### # Example:

```scss
@include min-screen-height(768px) { ... }
@include min-screen-height(1024px) { ... }
```

It will be compiled to:

```css
@media screen and (min-height: 768px) { ... }
@media screen and (min-height: 1024px) { ... }
```


#### - max-screen-height($width)

It's a shortcut for `@media screen and (max-height ... )`

###### # Example:

```scss
@include max-screen-height(1024px) { ... }
@include max-screen-height(768px) { ... }
```

It will be compiled to:

```css
@media screen and (max-height: 1024px) { ... }
@media screen and (max-height: 768px) { ... }
```

---

#### - hdpi($ratio: 1.3)

It targets devices with hdpi display.

###### # Example:

```scss
.brand {
	background-image: url(logo.png);

	@include hdpi {
		background-image: url(logo_2x.png);
	}
}
```

---

#### - landscape() & portrait()

Both mixins target different screen orientations.

###### # Example:

```scss
@include landscape { ... }
@include portrait { ... }
```

It will be compiled to:

```css
@media screen and (orientation: landscape) { ... }
@media screen and (orientation: portrait) { ... }
```

---

```
$orientation: all | portrait | landscape
```

#### - iphone3($orientation: all)

It targets only **iPhone 3** + orientation

#### - iphone4($orientation: all)

It targets only **iPhone 4** + orientation

#### - iphone5($orientation: all)

It targets only **iPhone 5** + orientation

#### - iphone6($orientation: all)

It targets only **iPhone 6** + orientation

#### - iphone6-plus($orientation: all)

It targets only **iPhone 6 Plus** + orientation

#### - ipad($orientation: all)

It targets all **iPads** + orientation

#### - ipad-retina($orientation: all)

It targets only **iPads with retina** display + orientation

###### # Example:

```scss
@include ipad { ... }                 // all iPads
@include ipad-retina { ... }          // only iPad with retina

@include iphone5 { ... }              // only iPhone 5
@include iphone4 { ... }              // only iPhone 4/4S
@include iphone3 { ... }              // only iPhone 2/3G/3GS
```

###### # Example:

```scss
// common part for iPhone 5 - landscape & portrait
@include iphone5 { ... }

@include iphone5(landscape) { ... }
@include iphone5(portrait) { ... }
```

---

```
$standard: '720p' | '1080' | '2K' | '4K'
```

#### - hdtv($standard: '1080')

It targets TVs with particular standard like `1080` or `4K`

###### # Example:
```scss
.title {
	font-size: 5vm;

	@include hdtv {
		font-size: 10vm;
	}

	@include hdtv('4K') {
		font-size: 15vm;
	}
}
```

---

### Credits:

Feel free to check my <a href="http://rafalbromirski.com">website</a> or follow me on <a href="https://twitter.com/paranoida">twitter</a>.

---

### License:

The MIT license

Copyright &copy; 2015 [Rafal Bromirski](http://rafalbromirski.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
