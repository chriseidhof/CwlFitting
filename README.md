# CwlFitting

It is difficult in SwiftUI to have a `VStack` or `HStack` shrink to the width or height, respectively, of its largest component but also have elements within each row fill the allocated width or height, respectively, of the `VStack` or `HStack`. This package provides an easy solution.

The `VStack` in SwiftUI will let you build a column like the one pictured here:

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

CwlFitting introduces `fittingSize()`, a view transformation that conditionally applies `fixedSize()` to views, when the environment variable `useFixedSize` is `true`. Combined with the  `fittingContent()` transformation on a parent container, this allows subsets of your view tree to grow to fit allocated space, rather than growing to consume all available space:

```swift
VStack {
   HStack {
      Spacer().fittingSize()
      Text("Some Text")
      Spacer().fittingSize()
   }.background(Color.gray)
   HStack {
   Spacer().fittingSize()
      Text("Some Much Longer Text")
      Spacer().fittingSize()
   }.background(Color.gray)
}.fittingContent()

/*-----------------------------------------------------------|
| ============================                               |
| |/////// Some Text ////////|                               |
| |// Some Much Longer Text//|     even though more space    |
| ============================     is available, we don't    |
|                                 want to expand and fill it |
------------------------------------------------------------*/
```

## Usage

Add:

    https://github.com/mattgallagher/CwlFitting.git

to your app project's list of packages.

Put `import CwlFitting` at the top of your file. Apply `fittingContent()` to any `VStack` or `HStack` you want to use a fitting layout. Apply `fittingSize()` to any perpendicular `Spacer` within these layouts.

## Sample

![](https://user-images.githubusercontent.com/5382/59252515-85a2cf00-8c2c-11e9-88c8-9b4449b6d0cc.png)

To achieve this, you can use the following code:

```swift
func item(_ text: Text) -> some View {
    HStack {
        Spacer().fittingSize()
        text.color(.white)
        Spacer().fittingSize()
    }.padding().background(Color.blue.cornerRadius(10))
}

struct ContentView : View {
    var body: some View {
        return HStack(alignment: .top) {
            VStack {
                item(Text("Short"))
                item(Text("The longest text."))
                item(Text("Short"))
            }.fittingContent()
            VStack {
                bodyText.lineLimit(nil)
            }
        }
    }
}

let bodyText: Text = Text("It is difficult in SwiftUI to have a ") + Text("VStack").italic() + Text(" or ") + Text("HStack").italic() + Text(" shrink to the width or height, respectively, of its largest component but also have elements within each row fill the available width of the VStack or HStack. This package provides an easy solution.")
```
