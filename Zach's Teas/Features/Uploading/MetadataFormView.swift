import SwiftUI

struct MetadataFormView: View {
    @Binding var year: Int
    @Binding var steeps: Int
    @Binding var season: String
    @Binding var ratingHot: Int
    @Binding var ratingIced: Int
    @Binding var ratingColdBrew: Int

    @Binding var showSeasonMenu: Bool
    @Binding var showRatingMenu: Bool

    @State private var yearFieldTapped = false
    @State private var steepsFieldTapped = false

    var body: some View {
        VStack(spacing: 10) {
            // Year + Season
            HStack(spacing: 20) {
                yearField
                seasonButton
            }

            // Steeps + Rating
            HStack(spacing: 20) {
                steepsField
                ratingButton
            }
            .padding(.top, 12)
        }
    }

    private var yearField: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.51)
            TextField("Year", text: $year.asString())
                .font(.custom("Buda-Light", size: 20))
                .foregroundColor(Color(hex: "#832F2F"))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .opacity(year == 0 ? 0.65 : 1)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    if !yearFieldTapped {
                        year = 0
                        yearFieldTapped = true
                    }
                }
                .placeholder(when: year == 0) {
                    Text("Year")
                        .font(.custom("Buda-Light", size: 20))
                        .foregroundColor(Color(hex: "#832F2F").opacity(0.65))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
        }
        .frame(width: 138, height: 46)
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
                    .foregroundColor(TeaSeason(rawValue: season)?.color ?? Color(hex:"#832F2FA6").opacity(0.65))
            }
        }
        .frame(width: 176, height: 46)
        .cornerRadius(6)
        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
    }

    private var steepsField: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.51)
            TextField("# of Steeps", text: $steeps.asString())
                .font(.custom("Buda-Light", size: 20))
                .foregroundColor(Color(hex: "#832F2F"))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .opacity(steeps == 0 ? 0.65 : 1)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    if !steepsFieldTapped {
                        steeps = 0
                        steepsFieldTapped = true
                    }
                }
                .placeholder(when: steeps == 0) {
                    Text("# of Steeps")
                        .font(.custom("Buda-Light", size: 20))
                        .foregroundColor(Color(hex: "#832F2F").opacity(0.65))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
        }
        .frame(width: 138, height: 46)
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
                        .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))

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
