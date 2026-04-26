import SwiftUI

struct RootView: View {
    @State private var state = AppState()

    var body: some View {
        AppShellView {
            NavigationCoordinator(state: state)
        }
        .environment(\.barakaahTheme, state.theme)
        .environment(state)
    }
}

#Preview {
    RootView()
}
