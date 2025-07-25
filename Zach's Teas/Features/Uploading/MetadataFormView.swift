import SwiftUI

struct MetadataFormView: View {
    @Binding var year: String
    @Binding var steeps: String
    @Binding var season: String
    @Binding var ratingHot: Int
    @Binding var ratingIced: Int
    @Binding var ratingColdBrew: Int

    @Binding var showSeasonMenu: Bool
    @Binding var showRatingMenu: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                fieldBox(text: $year, placeholder: "Year", width: 138)
                seasonButton
            }

            HStack(spacing: 20) {
                fieldBox(text: $steeps, placeholder: "# of Steeps", width: 138)
                ratingButton
            }
            .padding(.top, 12)
        }
    }

    private func fieldBox(text: Binding<String>, placeholder: String, width: CGFloat) -> some View {
        ZStack(alignment: .center) {
            Color(hex: "#EED160").opacity(0.51)

            if text.wrappedValue.isEmpty {
                Text(placeholder)
                    .font(.custom("Buda-Light", size: 20))
                    .foregroundColor(Color(hex: "#832F2F").opacity(0.65))
            }

            TextField("", text: text)
                .font(.custom("Buda-Light", size: 20))
                .foregroundColor(Color(hex: "#832F2F"))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .frame(width: width, height: 46)
        .cornerRadius(6)
        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
    }

    private var seasonButton: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.51)

            Button(action: {
                showSeasonMenu.toggle()
            }) {
                Text(season.isEmpty ? "Season" : season)
                    .font(.custom("Buda-Light", size: 20))
                    .foregroundColor(TeaSeason(rawValue: season)?.color ?? Color(hex:"#832F2F").opacity(0.65))
            }
        }
        .frame(width: 176, height: 46)
        .cornerRadius(6)
        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
    }

    private var ratingButton: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.51)

            Button(action: {
                showRatingMenu.toggle()
            }) {
                VStack {
                    Text("Rating")
                        .font(.custom("Buda-Light", size: 20))
                        .foregroundColor(Color(hex:"#832F2F").opacity(0.65))

                    HStack(spacing: 16) {
                        RatingDisplay(value: ratingHot, rating: .hot)
                        RatingDisplay(value: ratingIced, rating: .iced)
                        RatingDisplay(value: ratingColdBrew, rating: .coldBrew)
                    }
                }
            }
        }
        .frame(width: 176, height: 46)
        .cornerRadius(6)
        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
    }
}
