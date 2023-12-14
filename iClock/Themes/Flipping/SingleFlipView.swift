import SwiftUI

struct SingleFlipView: View {

    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var screenSize: ScreenSize
    @EnvironmentObject var clockThemes: ThemeManager
    
    init(text: String, type: FlipType) {
        self.text = text
        self.type = type
        
    }

    var body: some View {
            
            VStack {
                
                let fontSize = screenSize.width * 0.12
                
                let boxWidth = screenSize.width * 0.07
                let boxHeight = screenSize.width * 0.08
                let padding: CGFloat = screenSize.width * -0.051
                let paddingEdges = screenSize.width * 0.03
                let horizontalPadding = screenSize.width * 0.005
                
                let cornerRadius = screenSize.width * 0.02
                
                
                Text(text)
                    .font(.system(size: fontSize))
                    .fontWeight(.heavy)
                    .foregroundColor(clockThemes.currentBackground.secondary)
                    .fixedSize()
                    .padding(.vertical, padding)
                    .frame(width: boxWidth, height: boxHeight, alignment: type.alignment)
                    .padding(paddingEdges)
                    .clipped()
                    .background(
                        clockThemes.currentBackground.primary
                    )
                    .cornerRadius(cornerRadius)
                    .padding(type.padding, padding)
                    .clipped()
                    .padding(.horizontal, horizontalPadding)
                
            }
    }

    enum FlipType {
        case top
        case bottom

        var padding: Edge.Set {
            switch self {
            case .top:
                return .bottom
            case .bottom:
                return .top
            }
        }

        var paddingEdges: Edge.Set {
            switch self {
            case .top:
                return [.top, .leading, .trailing]
            case .bottom:
                return [.bottom, .leading, .trailing]
            }
        }

        var alignment: Alignment {
            switch self {
            case .top:
                return .bottom
            case .bottom:
                return .top
            }
        }

    }

    private let text: String
    private let type: FlipType

}

