# Using Combine for URLSession in Swift ![Swift](https://img.shields.io/badge/swift-5.0-brightgreen.svg)

This repository illustrates an example to use Swift's [Combine](https://developer.apple.com/documentation/combine) to retreive JSON response and load to a UITableView.

However, Combine is best used with SwiftUI. This is only to replace the use of RxSwift in the [previous example](https://github.com/calvinwkl/swift-uitableview).


## Swift Package Manager

- [CombineDataSources](https://github.com/CombineCommunity/CombineDataSources)

## Mock API response

- [Travel](https://api.myjson.com/bins/16w6h0)

```
[
  {
    "name": "Hong Kong",
    "desc": "The place I live.",
    "url": "https://en.wikipedia.org/wiki/Hong_Kong"
  },
  {
    "name": "Singapore",
    "desc": "A clean and disciplined place.",
    "url": "https://en.wikipedia.org/wiki/Singapore"
  },
  {
    "name": "Japan",
    "desc": "Love those yummy sushi and sashimi.",
    "url": "https://en.wikipedia.org/wiki/Japan"
  }
]
```
