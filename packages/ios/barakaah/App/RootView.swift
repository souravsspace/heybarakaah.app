import SwiftUI

struct RootView: View {
    @State private var state = AppState()
    
    private var didOnboard: Bool {
        Persistence.didOnboard
    }

    var body: some View {
        AppShellView {
            NavigationCoordinator(state: state)
        }
        .environment(\.barakaahTheme, state.theme)
        .environment(state)
        .task {
            Haptics.prepare()
            if didOnboard && state.phase == .splash {
                try? await Task.sleep(for: .seconds(1.0))
                state.phase = .app
            }
        }
    }
}

#Preview {
    RootView()
}
