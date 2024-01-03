//
//  BasicImageRow_16.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 02.01.2024.
//

import SwiftUI

struct BasicImageRow_16: View {
	var restaurant: Restaurant_16

	var body: some View {
		HStack {
			Image(restaurant.image)
				.resizable()
				.frame(width: 40, height: 40)
				.cornerRadius(5)
			Text(restaurant.name)

			if restaurant.checkIn {
				Image(systemName: "checkmark.seal.fill")
					.foregroundColor(.red)
			}

			if restaurant.isFavorite {
				Spacer()

				Image(systemName: "star.fill")
					.foregroundColor(.yellow)
			}
		}
	}
}
