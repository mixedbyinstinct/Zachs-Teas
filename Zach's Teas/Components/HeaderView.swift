import SwiftUI

struct HeaderView: View {
    var title: String?
    var subtitle: String?
    var iconName: String?
    var iconOverlay: AnyView? = nil
    var iconTint: Color? = nil
    var titleFont: Font = .custom("Amarante-Regular", size: 45)
    var subtitleFont: Font = .custom("Brygada1918-Regular", size: 24)
    var titleColor: Color = Color(hex: "#EED160")
    var subtitleColor: Color = .white
    var strokedSubtitle: Bool = false
    var subtitleStrokeColor: UIColor = .black
    var subtitleStrokeWidth: Float = -2
    var strokedSubtitleFont: UIFont? = nil
    var shadow: Bool = true
    var iconWidth: CGFloat = 91
    var iconHeight: CGFloat = 69

    var body: some View {
        VStack(spacing: 8) {
            if let title = title {
                Text(title)
                    .font(titleFont)
                    .foregroundColor(titleColor)
                    .shadow(color: shadow ? .black.opacity(0.5) : .clear, radius: 2, x: 2, y: 2)
            }

            if let iconName = iconName {
                ZStack {
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconWidth, height: iconHeight)
                        .opacity(iconTint != nil ? 0 : 1)

                    if let tint = iconTint {
                        Image(iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: iconWidth, height: iconHeight)
                            .colorMultiply(tint)
                    }

                    if let overlay = iconOverlay {
                        overlay
                            .offset(y: -10)
                    }
                }
            }

            if let subtitle = subtitle {
                if strokedSubtitle, let uiFont = strokedSubtitleFont {
                    StrokedText(
                        text: subtitle,
                        font: uiFont,
                        strokeColor: subtitleStrokeColor,
                        foregroundColor: UIColor(subtitleColor),
                        strokeWidth: CGFloat(subtitleStrokeWidth)
                    )
                    .frame(height: CGFloat(uiFont.pointSize + 10))
                } else {
                    Text(subtitle)
                        .font(subtitleFont)
                        .foregroundColor(subtitleColor)
                }
            }

        }
    }
}
