import SwiftUI

struct DynamicIslandView: View {
    var body: some View {
        if BarakaahPreviewShell.enabled {
            Capsule()
                .fill(.black)
                .frame(width: 122, height: 36)
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    DynamicIslandView()
        .background(Color(hex: 0x1A1612))
}
