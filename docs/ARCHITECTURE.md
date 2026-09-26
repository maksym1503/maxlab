# MaxLab architecture

MaxLab is intentionally a thin catalog shell. App metadata lives in a small value type, installed-state checks use `UIApplication.canOpenURL`, and launching uses SwiftUI `openURL`. It does not share persistence or product logic with Gamefy or Reset.
