//
//  ContextMenu.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 02.01.2024.
//

import SwiftUI

struct ContextMenu: View {

	@State var restaurants = [
		Restaurant_16(name: "Cafe Deadend", image: "cafedeadend"),
		Restaurant_16(name: "Homei", image: "homei"),
		Restaurant_16(name: "Teakha", image: "teakha"),
		Restaurant_16(name: "Cafe Loisl", image: "cafeloisl"),
		Restaurant_16(name: "Petite Oyster", image: "petiteoyster"),
		Restaurant_16(name: "For Kee Restaurant", image: "forkeerestaurant"),
		Restaurant_16(name: "Po's Atelier", image: "posatelier"),
		Restaurant_16(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
		Restaurant_16(name: "Haigh's Chocolate", image: "haighschocolate"),
		Restaurant_16(name: "Palomino Espresso", image: "palominoespresso"),
		Restaurant_16(name: "Homei", image: "upstate"),
		Restaurant_16(name: "Traif", image: "traif"),
		Restaurant_16(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
		Restaurant_16(name: "Waffle & Wolf", image: "wafflewolf"),
		Restaurant_16(name: "Five Leaves", image: "fiveleaves"),
		Restaurant_16(name: "Cafe Lore", image: "cafelore"),
		Restaurant_16(name: "Confessional", image: "confessional"),
		Restaurant_16(name: "Barrafina", image: "barrafina"),
		Restaurant_16(name: "Donostia", image: "donostia"),
		Restaurant_16(name: "Royal Oak", image: "royaloak"),
		Restaurant_16(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
	]

	@State var someProp: Bool = false
	@State var isSheetPresented: Bool = false
	@State var selectedResaurant: Restaurant_16?

	var body: some View {
		List {
			ForEach(restaurants) { restaurant in
				BasicImageRow_16(restaurant: restaurant)
					.contextMenu {
						Button(action: {
							delete(item: restaurant)
						}, label: {
							HStack {
								Text("Delete")
								Image(systemName: "trash")
							}
						})

						Button(action: {
							setFavorite(item: restaurant)
						}, label: {
							HStack {
								Text("Favorite")
								Image(systemName: "star")
							}
						})
					}
					.onTapGesture {
						isSheetPresented.toggle()
						selectedResaurant = restaurant
					}
					.confirmationDialog(
						"Action Sheet",
						isPresented: $isSheetPresented,
						presenting: selectedResaurant
					) { restaurant in
						Button {
							setFavorite(item: restaurant)
						} label: {
							Text("Mark is Favorite")
						}

						Button {
							delete(item: restaurant)
						} label: {
							Text("Delete")
						}

						Button("Cancel", role: .cancel) {}
					}
			}
			.onDelete(perform: { indexSet in
				restaurants.remove(atOffsets: indexSet)
			})
		}
		.listStyle(.plain)
	}

	private func delete(item restaurant: Restaurant_16) {
		if let index = self.restaurants.firstIndex(where: { res in
			res.id == restaurant.id
		}) {
			self.restaurants.remove(at: index)
		}
	}

	private func setFavorite(item restaurant: Restaurant_16) {
		if let index = self.restaurants.firstIndex(where: { res in
			res.id == restaurant.id
		}) {
			self.restaurants[index].isFavorite.toggle()
		}
	}
}

struct ContextMenu_Previews: PreviewProvider {
	static var previews: some View {
		ContextMenu()
	}
}
