//
//  HiBottomSheet.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 07.01.2024.
//

import SwiftUI

struct HiBottomSheet: View {

	@State private var presentDetailSheet: Bool = false
	@State private var selectedRestaurant: Restaurant_18?

	var body: some View {
		NavigationStack {
			List {
				ForEach(restaurants) { restaurant in
					BasicImageRow_18(restaurant: restaurant)
						.onTapGesture {
							presentDetailSheet = true
							selectedRestaurant = restaurant
					}
					.sheet(item: $selectedRestaurant) { res in
						RestaurantDetailView_18(restaurant: res)
							.presentationDetents([.large, .medium])
							.presentationDragIndicator(.hidden)
					}
				}
			}
			.listStyle(.plain)
			.navigationTitle("Restaurants")
		}
	
	}
}

struct HiBottomSheet_Preview: PreviewProvider {

	static var previews: some View {
		HiBottomSheet()
	}
}
