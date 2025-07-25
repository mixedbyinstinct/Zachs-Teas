struct PhotoUploadSlotView: View {
    let label: String

    var body: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.3)

            Text("+\(label)")
                .font(.custom("Asul-Bold", size: 20))
                .foregroundColor(.black)
        }
        .frame(width: 112, height: 116)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1.2, dash: [6]))
                .foregroundColor(Color(hex: "#832F2F"))
        )
        .cornerRadius(8)
    }
}
