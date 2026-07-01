// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "CleanTipStyle",
  platforms: [
    .iOS(.v26),
    .macOS(.v26),
  ],
  products: [
    .library(
      name: "CleanTipStyle",
      targets: ["CleanTipStyle"]
    )
  ],
  targets: [
    .target(
      name: "CleanTipStyle",
      swiftSettings: [
        .swiftLanguageMode(.v6),
        .enableExperimentalFeature("StrictConcurrency"),

      ]
    )
  ]
)
