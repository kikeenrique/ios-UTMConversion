#if canImport(Foundation)
import Foundation
#endif

#if canImport(Glibc)
import Glibc
#elseif canImport(Android)
import Android
#endif

/**
    A portable latitude/longitude coordinate.

    `GeoCoordinate` is the platform-neutral coordinate type used by the
    conversion math. On Apple platforms it bridges to and from CoreLocation's
    `CLLocationCoordinate2D`, but it is available everywhere Foundation is
    (including Android and Linux), which lets UTM conversions run without
    CoreLocation.
 */
public struct GeoCoordinate: Equatable, Sendable {

    /** The latitude in degrees */
    public let latitude: Double

    /** The longitude in degrees */
    public let longitude: Double

    /**
        Initializes a geographic coordinate.

        - Parameter latitude: The latitude in degrees
        - Parameter longitude: The longitude in degrees
     */
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public extension GeoCoordinate {

    /**
        Calculates the UTM coordinate of the receiver

        - Parameter datum: The datum to use, defaults to WGS84 which should be fine for most applications
     */
    func utmCoordinate(datum: UTMDatum = UTMDatum.wgs84) -> UTMCoordinate {
        let zone = self.zone
        return TMCoordinate(coordinate: self, centralMeridian: zone.centralMeridian, datum: datum).utmCoordinate(zone: zone, hemisphere: hemisphere)
    }

    /**
        The UTM grid zone
     */
    var zone: UTMGridZone {
        return UTMGridZone(floor((longitude + 180.0) / 6)) + 1
    }

    /**
        The UTM hemisphere
     */
    var hemisphere: UTMHemisphere {
        return latitude < 0 ? .southern : .northern
    }
}
