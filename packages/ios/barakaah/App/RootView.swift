import SwiftUI

struct RootView: View {
    @State private var state = AppState()

    var body: some View {
        AppShellView {
            NavigationCoordinator(state: state)
        }
        .task { Haptics.prepare() }
        .environment(\.barakaahTheme, state.theme)
        .environment(state)
    }
}

#Preview {
    RootView()
}
