import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

struct MaxLabApp: App { var body: some Scene { WindowGroup { MaxLabHome() } } }

struct LabApp: Identifiable, Equatable { let id: String; let name: String; let purpose: String; let scheme: String; let symbol: String; let accent: Color; let available: Bool }

private func installed(_ scheme: String) -> Bool {
#if canImport(UIKit)
    return UIApplication.shared.canOpenURL(URL(string: scheme)!)
#else
    return false
#endif
}

struct MaxLabHome: View {
    @Environment(\.openURL) private var openURL
    @State private var selected: LabApp?
    private let apps = [LabApp(id: "gamefy", name: "Gamefy", purpose: "Make your bed. Grow your room.", scheme: "gamefy://", symbol: "bed.double.fill", accent: .indigo, available: installed("gamefy://")), LabApp(id: "reset", name: "Reset", purpose: "Clear your desk. Clear your mind.", scheme: "reset://", symbol: "arrow.triangle.2.circlepath", accent: .teal, available: installed("reset://"))]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("YOUR PRIVATE APP SHELF").font(.caption.weight(.semibold)).tracking(1.5).foregroundStyle(LabTokens.secondary)
                        Text("Small apps, made with care.").font(.title2.bold())
                    }
                    VStack(spacing: 16) {
                        ForEach(apps) { app in AppCard(app: app) { selected = app } }
                    }
                }.padding(20)
            }
            .background(LabTokens.background)
            .navigationTitle("MaxLab")
        }
        .sheet(item: $selected) { app in AppLaunchSheet(app: app) { openURL(URL(string: app.scheme)!) } }
    }
}

enum LabTokens {
    static var background: Color {
        #if canImport(UIKit)
        Color(uiColor: .systemGroupedBackground)
        #else
        Color(nsColor: .windowBackgroundColor)
        #endif
    }
    static var surface: Color {
        #if canImport(UIKit)
        Color(uiColor: .secondarySystemGroupedBackground)
        #else
        Color(nsColor: .controlBackgroundColor)
        #endif
    }
    static var secondary: Color {
        #if canImport(UIKit)
        Color(uiColor: .init { traits in
            .init(white: traits.userInterfaceStyle == .dark ? 0.76 : 0.36, alpha: 1)
        })
        #else
        Color.secondary
        #endif
    }
    static let action = Color(red: 0.25, green: 0.25, blue: 0.60)
}
