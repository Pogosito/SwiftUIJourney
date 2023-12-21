//
//  SettingView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 21.12.2023.
//

import SwiftUI

struct SettingView: View {

	private var displayOrders = [
		"Alphabetically",
		"Show Favorite First",
		"Show Check-in First"
	]

	@State private var selectedOrder = 0
	@State private var showCheckOnly = false
	@State private var maxPriceLevel = 5

	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("SORT PREFERNCE")) {
					Picker(
						selection: $selectedOrder,
						label: Text("Display order")
					) {
						ForEach(0..<displayOrders.count, id: \.self) {
							Text(self.displayOrders[$0])
						}
					}
				}

				Section(header: Text("FILTER PREFENCE")) {
					Toggle(isOn: $showCheckOnly) {
						Text("Show Check-in only")
					}

					Stepper(onIncrement: {
						self.maxPriceLevel += 1

						if self.maxPriceLevel > 5 {
							self.maxPriceLevel = 5
						}
					},
							onDecrement: {
						self.maxPriceLevel -= 1

						if self.maxPriceLevel < 1 {
							self.maxPriceLevel = 1
						}
					}) {
						Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
					}
				}
			}
			.navigationTitle("Settings")
		}
	}
}

struct SettingView_Previews: PreviewProvider {

	static var previews: some View {
		SettingView()
	}
}
