// swift-tools-version: 5.9
import PackageDescription

let package = Package(name: "MaxLab", platforms: [.iOS(.v17), .macOS(.v14)], products: [.library(name: "AppFoundation", targets: ["AppFoundation"]), .library(name: "MaxLabApp", targets: ["MaxLabApp"])], targets: [.target(name: "AppFoundation"), .target(name: "MaxLabApp"), .testTarget(name: "MaxLabTests", dependencies: ["MaxLabApp"])])
