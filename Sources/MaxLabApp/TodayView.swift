import SwiftUI

struct AppCard: View {
    let app: LabApp
    let action: () -> Void
    @Environment(\.dynamicTypeSize) private var typeSize
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 16) {
                    Image(systemName: app.symbol)
                        .font(.system(size: 28, weight: .semibold)).foregroundStyle(app.accent)
                        .frame(width: 64, height: 64)
                        .background(app.accent.opacity(0.12), in: RoundedRectangle(cornerRadius: 18))
                        .accessibilityHidden(true)
                    VStack(alignment: .leading, spacing: 6) {
                        Text(app.name).font(.title2.bold()).foregroundStyle(.primary)
                        Label(app.available ? "Installed" : "Not installed", systemImage: app.available ? "checkmark.circle.fill" : "arrow.down.circle")
                            .font(.subheadline).foregroundStyle(LabTokens.secondary)
                    }
                    Spacer(minLength: 0)
                    if !typeSize.isAccessibilitySize {
                        Image(systemName: "chevron.right").font(.subheadline.weight(.semibold)).foregroundStyle(LabTokens.secondary)
                    }
                }
                Text(app.purpose).font(.body).foregroundStyle(LabTokens.secondary)
                    .multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading).padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 22))
            .overlay { RoundedRectangle(cornerRadius: 22).strokeBorder(app.accent.opacity(0.24), lineWidth: 1.5) }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(app.name), \(app.purpose), \(app.available ? "installed" : "unavailable")")
        .accessibilityHint("Show app details")
    }
}

struct AppLaunchSheet: View {
    let app: LabApp
    let launch: () -> Void
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: app.symbol).font(.system(size: 36, weight: .medium)).foregroundStyle(app.accent)
                    .frame(width: 88, height: 88)
                    .background(app.accent.opacity(0.12), in: RoundedRectangle(cornerRadius: 24))
                    .accessibilityHidden(true)
                VStack(spacing: 8) {
                    Text(app.name).font(.largeTitle.bold())
                    Text(app.purpose).font(.body).foregroundStyle(LabTokens.secondary)
                }
                if app.available {
                    Button(action: launch) {
                        Label("Open \(app.name)", systemImage: "arrow.up.forward.app")
                            .font(.headline).frame(maxWidth: .infinity).padding(.vertical, 6)
                    }.buttonStyle(.borderedProminent).controlSize(.large).tint(LabTokens.action)
                } else {
                    Label("Install this app on your iPhone to open it from MaxLab.", systemImage: "info.circle")
                        .font(.callout).foregroundStyle(LabTokens.secondary).padding(16)
                        .frame(maxWidth: .infinity)
                        .background(LabTokens.surface, in: RoundedRectangle(cornerRadius: 16))
                }
                Button("Close", action: { dismiss() }).font(.headline).controlSize(.large).buttonStyle(.bordered)
            }.multilineTextAlignment(.center).padding(24).padding(.top, 12)
        }
        .background(LabTokens.background)
        .presentationDetents([.medium, .large]).presentationDragIndicator(.visible)
    }
}
