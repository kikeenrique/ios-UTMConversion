#if canImport(CoreLocation)
import Foundation
import CoreLocation

public extension CLLocation {

    /**
        Calculates the UTM coordinate of the receiver

        - Parameter datum: The datum to use, defaults to WGS84 which should be fine for most applications

     */
    func utmCoordinate(datum: UTMDatum = UTMDatum.wgs84) -> UTMCoordinate {
        return coordinate.utmCoordinate(datum: datum)
    }

}
#endif
