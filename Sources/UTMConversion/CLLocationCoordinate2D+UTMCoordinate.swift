#if canImport(CoreLocation)
import Foundation
import CoreLocation

public extension CLLocationCoordinate2D {

    /**
     A portable `GeoCoordinate` with the same latitude/longitude
     */
    var geoCoordinate: GeoCoordinate {
        return GeoCoordinate(latitude: latitude, longitude: longitude)
    }

    /**
     Calculates the UTM coordinate of the receiver

     - Parameter datum: The datum to use, defaults to WGS84 which should be fine for most applications

     */
    func utmCoordinate(datum: UTMDatum = UTMDatum.wgs84) -> UTMCoordinate {
        return geoCoordinate.utmCoordinate(datum: datum)
    }


    /**
     The UTM grid zone
     */
    var zone: UTMGridZone {
        return geoCoordinate.zone
    }

    /**
     The UTM hemisphere
     */
    var hemisphere: UTMHemisphere {
        return geoCoordinate.hemisphere
    }

}
#endif
