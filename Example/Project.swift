// swift-tools-version:6.0
//
// Project.swift
@preconcurrency import ProjectDescription

let exampleTarget = Target.target(
  name: "Example",
  destinations: [.iPhone, .iPad, .mac],
  product: .app,
  bundleId: "com.gmsoft.sample.Example",
  deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
  infoPlist: .extendingDefault(
    with: [
      "UILaunchStoryboardName": "LaunchScreen.storyboard"
    ]
  ),
  sources: ["Sources/**"],
  resources: [
  "Resources/**",
  "Sources/**/*.xib"
  ],
  dependencies: [
    .package(product: "SwiftSM")
  ]
)

let exampleTestsTarget = Target.target(
  name: "ExampleTests",
  destinations: [.iPhone, .iPad, .mac],
  product: .unitTests,
  bundleId: "com.gmsoft.sample.ExampleTests",
  deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
  infoPlist: .default,
  sources: [
    "./Tests/**"
  ],
  dependencies: [
    .target(name: "Example")
  ]
)


let project: Project = {
  let settings = Settings.settings(
    base: [
      "SWIFT_VERSION": "6"
    ],
    defaultSettings: .recommended
  )
  
  return Project(
    name: "Example",
    packages: [
      .package(path: "../")
    ],
    settings: settings,
    targets: [
      exampleTarget,
      exampleTestsTarget,
    ]
  )
}()
