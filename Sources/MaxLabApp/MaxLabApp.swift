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
    var body: some View { NavigationStack { ScrollView { VStack(alignment: .leading, spacing: 24) { Text("MAXLAB").font(.caption.bold()).foregroundStyle(.secondary); Text("Small apps, made with care.").font(.largeTitle.bold()); Text("Your private app shelf").font(.title3).foregroundStyle(.secondary); LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) { ForEach(apps) { app in AppCard(app: app) { selected = app } } } }.padding() }.background(LabTokens.background).navigationTitle("MaxLab") }.sheet(item: $selected) { app in AppLaunchSheet(app: app) { openURL(URL(string: app.scheme)!) } } }
}

enum LabTokens { static let background = Color(red: 0.96, green: 0.95, blue: 0.92) }
