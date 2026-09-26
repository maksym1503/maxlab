# MaxLab

MaxLab is a private iPhone launcher for the small native apps in this ecosystem. It presents Gamefy and Reset as polished app cards, reports whether each URL scheme is installed, and opens installed apps through native inter-app URLs.

## Development

```sh
swift test
xcodebuild -project MaxLab.xcodeproj -scheme MaxLab -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

MaxLab uses `gamefy://` and `reset://`; it does not embed, sync or inspect the other apps.
