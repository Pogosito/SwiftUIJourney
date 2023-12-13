//
//  ListForEachIdentifiable.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 11.12.2023.
//

import SwiftUI

struct ListForEachIdentifiable: View {

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

	var body: some View {
		List {
			ForEach(
				restaurants.indices,
				id: \.self
			) { index in
				if (0...1).contains(index) {
					FullImageRow(restaurant: self.restaurants[index])
				} else {
					BasicImageRow(restaurant: self.restaurants[index])
				}
			}
			.listRowSeparator(.hidden)
		}
		.background {
			Image("homei")
				.resizable()
				.scaledToFill()
				.clipped()
		}
		.scrollContentBackground(.hidden)
		.listStyle(.plain)
	}
}

struct ListForEachIdentifiable_Previews: PreviewProvider {

	static var previews: some View {
		ListForEachIdentifiable()
	}
}
