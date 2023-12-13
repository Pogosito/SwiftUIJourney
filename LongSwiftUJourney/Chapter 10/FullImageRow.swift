//
//  FullImageRow.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.12.2023.
//

import SwiftUI

struct FullImageRow: View {

	var restaurant: Restaurant

	var body: some View {
		ZStack {
			Image(restaurant.image)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(height: 200)
				.cornerRadius(10)
				.overlay {
					Rectangle()
						.foregroundColor(.black)
						.cornerRadius(10)
						.opacity(0.2)
				}
				.background(Color.clear)

			Text(restaurant.name)
				.font(.system(.title, design: .rounded))
				.fontWeight(.black)
				.foregroundColor(.white)
		}
	}
}
