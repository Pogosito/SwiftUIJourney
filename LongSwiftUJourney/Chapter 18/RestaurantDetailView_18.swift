//
//  RestaurantDetailView_18.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 07.01.2024.
//

import SwiftUI

struct RestaurantDetailView_18: View {

	var restaurant: Restaurant_18

	var body: some View {
		ScrollView {
			RoundedRectangle(cornerRadius: 10)
				.foregroundColor(Color.gray)
				.frame(width: 50, height: 8, alignment: .center)
				.padding(.top, 10)

			VStack(alignment: .leading) {

				Text("Restaurant Details")
					.padding([.top, .horizontal])
					.padding(.bottom, 25)
					.font(.system(size: 20, weight: .bold, design: .default))

				ZStack {
					Image(restaurant.image)
						.resizable()
						.frame(height: 355)

					VStack {
						Spacer()
						HStack {
							VStack(alignment: .leading, spacing: 0) {
								Text(restaurant.name)
									.foregroundStyle(.white)
									.font(.system(.largeTitle, design: .rounded, weight: .bold))

								Text(restaurant.type)
									.foregroundStyle(.white)
									.font(.system(size: 20, weight: .semibold, design: .default))
									.padding(7)
									.background(Color.red)
									.clipShape(RoundedRectangle(cornerRadius: 5))
							}
							Spacer()
						}
					}.padding([.bottom, .leading])
				}

				HStack {
					Image(systemName: "map")
						.padding(.trailing, 5)
					Text(restaurant.location)
				}.padding([.horizontal, .top])

				HStack {
					Image(systemName: "phone")
						.padding(.trailing, 5)
					Text(restaurant.phone)
				}
				.padding([.horizontal])
				.padding(.top, 5)

				Text(restaurant.description)
					.padding()
			}
		}
	}
}

#Preview {
	RestaurantDetailView_18(
		restaurant: restaurants[1]
	)
}
