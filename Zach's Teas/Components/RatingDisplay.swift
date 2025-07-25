struct RatingDisplay: View {
    let label: String
    let value: Int
    let rating: TeaRating

    var body: some View {
        VStack(spacing: 0) {
            Text(label)
                .font(.custom("Buda-Light", size: 13))
                .foregroundColor(rating.labelColor)
            Text("\(value)")
                .font(.custom("Buda-Light", size: 15))
                .foregroundColor(.black)
        }
    }
}
