Pod::Spec.new do |s|
  s.name = 'UTMConversion'
  s.version = '1.4.0'
  s.swift_version = '6.0'
  s.cocoapods_version = '>= 1.4.0'
  s.summary = 'Convert between latitude/longitude and the UTM coordinate system.'
  s.description  = <<~DESC
    Convert between latitude/longitude and the UTM (Universal Transverse Mercator) coordinate systems.
    The conversion happens between a custom struct UTMCoordinate and CoreLocation's CLLocationCoordinate2D and CLLocation.
  DESC
  s.homepage = 'https://github.com/wtw-software/UTMConversion'
  s.license = {
    type: 'MIT',
    file: 'LICENSE'
  }
  s.authors = {
    'Peter Ringset' => 'peter@ringset.no'
  }
  s.ios.deployment_target = '14.0'
  s.osx.deployment_target = '10.13'
  s.source = {
    git: 'https://github.com/wtw-software/UTMConversion.git',
    tag: s.version
  }
  s.source_files = 'Sources/UTMConversion/*.{swift,h}'
end
