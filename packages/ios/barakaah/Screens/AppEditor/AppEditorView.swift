import SwiftUI

struct AppEditorView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState
    @State private var search = ""

    var groupedApps: [(String, [LockableApp])] {
        let filtered = search.isEmpty ? state.apps : state.apps.filter {
            $0.name.localizedCaseInsensitiveContains(search)
        }
        let grouped = Dictionary(grouping: filtered, by: \.category)
        let order = ["Social", "Video", "Browser"]
        return order.compactMap { cat in grouped[cat].map { (cat, $0) } }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    Button { state.popScreen() } label: {
                        IconChevronLeft().frame(width: 24, height: 24)
                    }
                    .frame(width: 38, height: 38).glass()

                    VStack(alignment: .leading, spacing: 2) {
                        EyebrowText(text: "Locked apps")
                        Text("\(state.lockedAppsCount) selected")
                            .font(theme.scaledSerif(size: 20, weight: .light, italic: true))
                            .foregroundStyle(theme.palette.txt)
                    }
                    Spacer()
                }

                // Search
                HStack(spacing: 10) {
                    IconSearch().frame(width: 16, height: 16).foregroundStyle(theme.palette.txt3)
                    TextField("Search apps...", text: $search)
                        .textFieldStyle(.plain)
                        .font(theme.scaledSans(size: 14))
                }
                .padding(10).padding(.horizontal, 4).glass()

                // Grouped app list
                ForEach(groupedApps, id: \.0) { category, apps in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category)
                            .font(theme.scaledSans(size: 10))
                            .foregroundStyle(theme.palette.txt3)
                            .padding(.leading, 4)

                        VStack(spacing: 0) {
                            ForEach(Array(apps.enumerated()), id: \.element.id) { idx, app in
                                HStack(spacing: 12) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .fill(app.color).frame(width: 36, height: 36)
                                        Text(String(app.name.prefix(1)))
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundStyle(.white)
                                    }
                                    Text(app.name)
                                        .font(theme.scaledSans(size: 14, weight: .medium))
                                        .foregroundStyle(theme.palette.txt)
                                    Spacer()
                                    Toggle("", isOn: Binding(
                                        get: { app.selected },
                                        set: { _ in state.toggleApp(id: app.id) }
                                    ))
                                    .toggleStyle(.switch)
                                    .tint(theme.palette.accent)
                                }
                                .padding(.vertical, 10).padding(.horizontal, 8)

                                if idx < apps.count - 1 {
                                    Capsule()
                                        .fill(theme.palette.line)
                                        .frame(height: 0.5)
                                        .padding(.leading, 48)
                                }
                            }
                        }
                        .padding(4).padding(.horizontal, 4).glass()
                    }
                }
            }
            .padding(.horizontal, 20).padding(.vertical, 8)
        }
    }
}

#Preview {
    AppEditorView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
