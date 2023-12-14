import SwiftUI

struct AllFlipsView: View {

    let viewModel = ClockViewModel()
    @EnvironmentObject var screenSize: ScreenSize

    var body: some View {
        let spaceBetweenFlipPacks = screenSize.width * 0.04
        let spaceBetweenFlips = screenSize.width * 0.01
        
        HStack(spacing: spaceBetweenFlipPacks) {
            HStack(spacing: spaceBetweenFlips) {
                FlipView(viewModel: viewModel.flipViewModels[0])
                FlipView(viewModel: viewModel.flipViewModels[1])
            }
            HStack(spacing: spaceBetweenFlips) {
                FlipView(viewModel: viewModel.flipViewModels[2])
                FlipView(viewModel: viewModel.flipViewModels[3])
            }
            HStack(spacing: spaceBetweenFlips) {
                FlipView(viewModel: viewModel.flipViewModels[4])
                FlipView(viewModel: viewModel.flipViewModels[5])
            }
        }
    }

}
