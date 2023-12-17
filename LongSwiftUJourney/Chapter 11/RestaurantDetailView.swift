//
//  RestaurantDetailView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 17.12.2023.
//

import SwiftUI

struct RestaurantDetailView: View {

	var restaurant: Restaurant

	var body: some View {
		VStack {
			Image(restaurant.image)
				.resizable()
				.aspectRatio(contentMode: .fit)

			Text(restaurant.name)
				.font(.system(.title, design: .rounded))
				.fontWeight(.black)

			Spacer()
		}
	}
}
