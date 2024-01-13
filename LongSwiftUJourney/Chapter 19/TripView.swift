//
//  TripView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import SwiftUI

struct TripView: View, Identifiable {

	let id = UUID()

	var trip: Trip

	var body: some View {
		Image(trip.image)
			.resizable()
			.clipShape(RoundedRectangle(cornerRadius: 5))
			.padding([.horizontal])
			.overlay {
				VStack {
					Spacer()
					Text(trip.destination)
						.padding(10)
						.padding(.horizontal, 20)
						.background(Color.white)
						.clipShape(RoundedRectangle(cornerRadius: 5))
						.font(.system(size: 20, weight: .semibold, design: .rounded))
				}
				.padding(.bottom)
			}
	}
}
