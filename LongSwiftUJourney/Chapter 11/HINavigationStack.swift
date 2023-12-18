//
//  HINavigationStack.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 17.12.2023.
//

import SwiftUI

struct HINavigationStack: View {

	var restaurants = [
		Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
		Restaurant(name: "Homei", image: "homei"),
		Restaurant(name: "Teakha", image: "teakha"),
		Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
		Restaurant(name: "Petite Oyster", image: "petiteoyster"),
		Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
		Restaurant(name: "Po's Atelier", image: "posatelier"),
		Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
		Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
		Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
		Restaurant(name: "Homei", image: "upstate"),
		Restaurant(name: "Traif", image: "traif"),
		Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
		Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
		Restaurant(name: "Five Leaves", image: "fiveleaves"),
		Restaurant(name: "Cafe Lore", image: "cafelore"),
		Restaurant(name: "Confessional", image: "confessional"),
		Restaurant(name: "Barrafina", image: "barrafina"),
		Restaurant(name: "Donostia", image: "donostia"),
		Restaurant(name: "Royal Oak", image: "royaloak"),
		Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
	]

	init() {
		let navBarAppearance = UINavigationBarAppearance()

		navBarAppearance.largeTitleTextAttributes = [
			.foregroundColor: UIColor.red,
			.font: UIFont(name: "ArialRoundedMTBold", size: 35)!
		]

		navBarAppearance.titleTextAttributes = [
			.foregroundColor: UIColor.red,
			.font: UIFont(name: "ArialRoundedMTBold", size: 20)!
		]

		navBarAppearance.setBackIndicatorImage(
			UIImage(systemName: "arrow.turn.up.left"),
			transitionMaskImage: UIImage(systemName: "arrow.turn.up.left")
		)

		UINavigationBar.appearance().standardAppearance = navBarAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
		UINavigationBar.appearance().compactAppearance = navBarAppearance
	}

	var body: some View {
		NavigationStack {
			List {
				ForEach(restaurants) { restaurant in
					NavigationLink(
						destination: RestaurantDetailView(restaurant: restaurant)
					) {
						BasicImageRow(restaurant: restaurant)
					}
				}
			}
			.listStyle(.plain)
			.navigationTitle("Restaurants")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct HINavigationStack_Previews: PreviewProvider {

	static var previews: some View {
		HINavigationStack()
	}
}
