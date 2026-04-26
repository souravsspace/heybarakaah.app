import SwiftUI

struct NavigationCoordinator: View {
    @Bindable var state: AppState

    var body: some View {
        ZStack {
            switch state.phase {
            case .splash:
                SplashShell(onFinish: { state.phase = .onboarding })
                    .transition(.opacity)

            case .onboarding:
                OnboardingShell(onFinish: { state.phase = .app })
                    .transition(.opacity)

            case .app:
                AppNavigationView(state: state)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.6), value: state.phase)
    }
}

// MARK: - Splash Placeholder

private struct SplashShell: View {
    @Environment(\.barakaahTheme) private var theme
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            Color.bgGradient(for: theme.theme).ignoresSafeArea()
            VStack(spacing: 16) {
                Star8(size: 88, color: theme.palette.accent, strokeWidth: 0.8)
                Text("Barakaah")
                    .font(theme.scaledLgTitle())
                    .foregroundStyle(theme.palette.txt)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation { onFinish() }
            }
        }
    }
}

// MARK: - Onboarding Placeholder

private struct OnboardingShell: View {
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            Color.bgGradient(for: .dark).ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Onboarding")
                    .font(.custom("Fraunces-VariableFont", size: 38))
                    .fontWeight(.light)
                    .foregroundStyle(.white)

                PrimaryButton(action: { withAnimation { onFinish() } }) {
                    Text("Complete Onboarding")
                }
                .frame(width: 280)
            }
        }
    }
}

// MARK: - App Navigation View

private struct AppNavigationView: View {
    @Bindable var state: AppState

    var body: some View {
        NavigationStack(path: $state.stack) {
            tabContent
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: Route.self) { route in
                    routeDestination(for: route)
                        .toolbar(.hidden, for: .navigationBar)
                }
        }
    }

    @ViewBuilder
    private var tabContent: some View {
        switch state.tab {
        case .home:
            HomePlaceholder(state: state)
        case .salah:
            PlaceholderView(title: "Prayer Times", state: state)
        case .tasbih:
            PlaceholderView(title: "Dhikr", state: state)
        case .profile:
            PlaceholderView(title: "Profile", state: state)
        }
    }

    @ViewBuilder
    private func routeDestination(for route: Route) -> some View {
        switch route {
        case .quran:
            PlaceholderView(title: "Quran", state: state)
        case .adhkar:
            PlaceholderView(title: "Adhkar", state: state)
        case .appEditor:
            PlaceholderView(title: "App Editor", state: state)
        }
    }
}

private struct HomePlaceholder: View {
    @Environment(\.barakaahTheme) private var theme
    let state: AppState

    var body: some View {
        VStack(spacing: 16) {
            EyebrowText(text: "Home", accent: true)
            Text("Welcome, \(state.name)")
                .font(theme.scaledLgTitle())
                .foregroundStyle(theme.palette.txt)

            Spacer().frame(height: 24)

            PrimaryButton(action: { state.pushScreen(.quran) }) {
                HStack(spacing: 6) {
                    IconQuran().frame(width: 20, height: 20)
                    Text("Open Qur\u{02BE}\u{0101}n")
                }
            }
            .frame(width: 280)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct PlaceholderView: View {
    @Environment(\.barakaahTheme) private var theme
    let title: String
    let state: AppState

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(theme.scaledLgTitle())
                .foregroundStyle(theme.palette.txt)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationCoordinator(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
