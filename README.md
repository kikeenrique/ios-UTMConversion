# UTMConversion
[![CI](https://github.com/wtw-software/UTMConversion/actions/workflows/ci.yml/badge.svg)](https://github.com/wtw-software/UTMConversion/actions/workflows/ci.yml)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Convert between latitude/longitude and the [UTM (Universal Transverse Mercator)](https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system) coordinate systems. The conversion happens between a custom `struct` `UTMCoordinate` and either the portable `GeoCoordinate` `struct` (available on every platform) or, on Apple platforms, CoreLocation's `CLLocationCoordinate2D` and `CLLocation`.

## Platform support

The core conversion math is platform-neutral and depends only on Foundation, so it runs on:

- iOS 14.0+ / macOS 10.13+ (with full CoreLocation support)
- Android (via the [official Swift Android SDK](https://www.swift.org/documentation/articles/getting-started-with-android.html))
- Linux

On Apple platforms the CoreLocation-based API (`CLLocationCoordinate2D` / `CLLocation` extensions, and `UTMCoordinate.coordinate()` / `UTMCoordinate.location()`) is available exactly as before. On Android and Linux, where CoreLocation is unavailable, use the portable `GeoCoordinate` type instead.

## Requirements

- iOS 14.0+ / macOS 10.13+ (Apple platforms), or Android / Linux with a Swift 6.0+ toolchain

## Installation
### Carthage

To integrate UTMConversion into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
github "wtw-software/UTMConversion" ~> 1.4
```

### CocoaPods

To integrate UTMConversion into you Xcode project using [CocoaPods](https://cocoapods.org), specify it in you `Podfile`:

```ruby
target 'MyApp' do
  pod 'UTMConversion', '~> 1.4'
end
```

Then run `pod install` inside your terminal, or from CocoaPods.app.

## Usage
### Convert to UTM

```swift
import CoreLocation
import UTMConversion

let coordinate = CLLocationCoordinate2D(latitude: 63.430493678423012, longitude: 10.394966844991798)
let utmCoordinate = coordinate.utmCoordinate()

let location = CLLocation(latitude: 63.430493678423012, longitude: 10.394966844991798)
let utmCoordinate2 = location.utmCoordinate()
```

### Convert from UTM

```swift
import CoreLocation
import UTMConversion

let utmCoordinate = UTMCoordinate(northing: 7034313, easting: 569612, zone: 32, hemisphere: .northern)
let coordinate = utmCoordinate.coordinate()
let location = utmCoordinate.location()
```

### Datum

It is possible to specify your own datum (polar and equitorial radius), the default value is WGS84, which is the latest revision of the WGS standard.

```swift
import CoreLocation
import UTMConversion

let utmCoordinate = UTMCoordinate(northing: 7034313, easting: 569612, zone: 32, hemisphere: .northern)
let datum = UTMDatum(equitorialRadius: 6378137, polarRadius: 6356752.3142)
let coordinate = utmCoordinate.coordinate(datum: datum)
```

### Android / Linux (CoreLocation-free)

On platforms without CoreLocation, use the portable `GeoCoordinate` type. It has the same `latitude`/`longitude` shape and exposes the same conversions:

```swift
import UTMConversion

// latitude/longitude -> UTM
let geoCoordinate = GeoCoordinate(latitude: 63.430493678423012, longitude: 10.394966844991798)
let utmCoordinate = geoCoordinate.utmCoordinate()

// UTM -> latitude/longitude
let back = utmCoordinate.geoCoordinate()
```

`GeoCoordinate` also works on Apple platforms, and `CLLocationCoordinate2D` exposes a `.geoCoordinate` bridging property, so shared code can target the portable type everywhere.
