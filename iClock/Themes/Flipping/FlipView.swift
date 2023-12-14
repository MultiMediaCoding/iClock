import SwiftUI

struct FlipView: View {

    @ObservedObject var viewModel: FlipViewModel
    @EnvironmentObject var screenSize: ScreenSize
    @EnvironmentObject var clockThemes: ThemeManager

    var body: some View {
        let dividerWidth = screenSize.width * 0.13
        let dividerHeight = screenSize.width * 0.002
        
        VStack(spacing: 0) {
            ZStack {
                SingleFlipView(text: viewModel.newValue ?? "", type: .top)
                SingleFlipView(text: viewModel.oldValue ?? "", type: .top)
                    .rotation3DEffect(.init(degrees: self.viewModel.animateTop ? -90 : .zero),
                                      axis: (1, 0, 0),
                                      anchor: .bottom,
                                      perspective: 0.5)
            }
            
            Rectangle()
                .frame(width: dividerWidth, height: dividerHeight)
                .foregroundColor(clockThemes.currentBackground.secondary)
                
            
            ZStack {
                SingleFlipView(text: viewModel.oldValue ?? "", type: .bottom)
                SingleFlipView(text: viewModel.newValue ?? "", type: .bottom)
                    .rotation3DEffect(.init(degrees: self.viewModel.animateBottom ? .zero : 90),
                                      axis: (1, 0, 0),
                                      anchor: .top,
                                      perspective: 0.5)
            }
        }
            .fixedSize()
    }

}

