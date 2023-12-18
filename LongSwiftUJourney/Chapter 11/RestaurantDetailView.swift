//
//  RestaurantDetailView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 17.12.2023.
//

import SwiftUI

struct RestaurantDetailView: View {

	@Environment(\.dismiss) var dismiss
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
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					dismiss()
				} label: {
					Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
						.foregroundColor(.black)
				}
			}
		}
	}
}
