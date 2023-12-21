//
//  ContentView_13.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 21.12.2023.
//

import SwiftUI

struct ContentView_13: View {

	@State var restaurants = [
		Restaurant_13(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
		Restaurant_13(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
		Restaurant_13(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
		Restaurant_13(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
		Restaurant_13(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
		Restaurant_13(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
		Restaurant_13(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
		Restaurant_13(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
		Restaurant_13(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
		Restaurant_13(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
		Restaurant_13(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
		Restaurant_13(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
		Restaurant_13(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
		Restaurant_13(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
		Restaurant_13(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
		Restaurant_13(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
		Restaurant_13(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
		Restaurant_13(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
		Restaurant_13(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
		Restaurant_13(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
		Restaurant_13(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
		]

	@State private var selectedRestaurant: Restaurant_13?
	@State private var showSettings = false

	var body: some View {
		NavigationStack {
			List {
				ForEach(restaurants) { restaurant in
					BasicImageRow_13(restaurant: restaurant)
						.contextMenu {
							
							Button(action: {
								// mark the selected restaurant as check-in
								self.checkIn(item: restaurant)
							}) {
								HStack {
									Text("Check-in")
									Image(systemName: "checkmark.seal.fill")
								}
							}
							
							Button(action: {
								// delete the selected restaurant
								self.delete(item: restaurant)
							}) {
								HStack {
									Text("Delete")
									Image(systemName: "trash")
								}
							}
											 
							Button(action: {
								// mark the selected restaurant as favorite
								self.setFavorite(item: restaurant)
								
							}) {
								HStack {
									Text("Favorite")
									Image(systemName: "star")
								}
							}
						}
						.onTapGesture {
							self.selectedRestaurant = restaurant
						}
				}
				.onDelete { (indexSet) in
					self.restaurants.remove(atOffsets: indexSet)
				}
			}
			
			.navigationTitle("Restaurant")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						showSettings = true
					}, label: {
						Image(systemName: "gear")
							.font(.title2)
							.foregroundColor(.black)
					})
				}
			}
			.sheet(isPresented: $showSettings) {
				SettingView()
			}
		}
	}
	
	private func delete(item restaurant: Restaurant_13) {
		if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
			self.restaurants.remove(at: index)
		}
	}
	
	private func setFavorite(item restaurant: Restaurant_13) {
		if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
			self.restaurants[index].isFavorite.toggle()
		}
	}
	
	private func checkIn(item restaurant: Restaurant_13) {
		if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
			self.restaurants[index].isCheckIn.toggle()
		}
	}
}

struct ContentView_Previews_13: PreviewProvider {

	static var previews: some View {
		ContentView_13()
	}
}
