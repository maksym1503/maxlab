# MaxLab

MaxLab is a private iPhone launcher for the small native apps in this ecosystem. It presents Gamefy and Reset as polished app cards, reports whether each URL scheme is installed, and opens installed apps through native inter-app URLs.

## Development

```sh
swift test
xcodebuild -project MaxLab.xcodeproj -scheme MaxLab -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

MaxLab uses `gamefy://` and `reset://`; it does not embed, sync or inspect the other apps.

The shared App Lab workspace can open this project alongside Gamefy and Reset. MaxLab has no Foundation package dependency; its views use its own `LabTokens`. The shared scheme includes the launcher UI smoke test in `Tests/MaxLabUITests`.
