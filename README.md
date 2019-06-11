# CwlFitting

It is difficult in SwiftUI to have a `VStack` or `HStack` shrink to the width or height, respectively, of its largest component but also have elements within each row that fill the available width of the `VStack` or `HStack`. This package provides an easy solution.

The `VStack` in Swift UI will let you build a column like the one pictured here:

```swift
VStack {
   Text("Some Text")
   Text("Some Much Longer Text")
}

/*-----------------------------------------------------------|
| ============================                               |
| |        Some Text         |                               |
| |   Some Much Longer Text  |     even though more space    |
| ============================     is available, we don't    |
|                                 want to expand and fill it |
------------------------------------------------------------*/
```

but it is not easy to put background elements behind "Some Text" that fill the column width without expanding the column:

```swift
VStack {
   HStack {
      Spacer()
      Text("Some Text")
      Spacer()
   }.background(Color.gray)
   HStack {
      Spacer()
      Text("Some Much Longer Text")
      Spacer()
   }.background(Color.gray)
}

/*-----------------------------------------------------------|
| ========================================================== |
| |/////////////////////// Some Text //////////////////////| |
| |/////////////////Some Much Longer Text /////////////////| |
| =========================================================| |
|                                                            |
------------------------------------------------------------*/
```

The `Fitting` view in this package lets you build the following layout:

```swift
Fitting(VStack {
   HStack {
      FittingSpacer()
      Text("Some Text")
      FittingSpacer()
   }.background(Color.gray)
   HStack {
      FittingSpacer()
      Text("Some Much Longer Text")
      FittingSpacer()
   }.background(Color.gray)
})

/*-----------------------------------------------------------|
| ============================                               |
| |/////// Some Text ////////|                               |
| |// Some Much Longer Text//|     even though more space    |
| ============================     is available, we don't    |
|                                 want to expand and fill it |
------------------------------------------------------------*/
```

## How does it work?!

The key components are:

1. A SwiftUI `EnvironmentValue` named `useFixedSizes` (a `Bool`) which, when `true` indicates that `fixedSize()` should be applied to flexible width items.
2. A SwiftUI `View` named `FittingSpacer` which wraps `Spacer` and applies the `usedFixedSizes` logic to it.
3. A SwiftUI `View` named `Fitting` which renders a provided content `View` twice, once with `useFixedSizes == true` but set to `hidden()` (to determine the dimensions) and once with `useFixedSizes == false` to render the real view and fill the layout.

Look at the CwlFitting.swift file. It's literally shorter than this README.

## Usage

Add:

   https://github.com/mattgallagher/CwlFitting.git

to your app project's list of packages. Put `import CwlFitting` at the top of your file, wrap your `HStack` or `VStack` in `Fitting()` and use `FittingSpacer` instead of `Spacer` inside.

You can also add  `useFixedSizes` to your flexible width views (see how `FittingSpacer` is implemented).
