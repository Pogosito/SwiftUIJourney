//
//  SettingView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 21.12.2023.
//

import SwiftUI

struct SettingView: View {

	@State private var selectedOrder: DisplayOrderType = .alphabetical
	@State private var showCheckOnly = false
	@State private var maxPriceLevel = 5

	@EnvironmentObject var settingsStore: SettingStore

	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("SORT PREFERNCE")) {
					Picker(
						selection: $selectedOrder,
						label: Text("Display order")
					) {
						ForEach(DisplayOrderType.allCases, id: \.self) {
							Text($0.text)
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
			.onAppear(perform: {
				selectedOrder = settingsStore.displayOrder
				showCheckOnly = settingsStore.showCheckInOnly
				maxPriceLevel = settingsStore.maxPriceLevel
			})
			.toolbar(content: {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						settingsStore.displayOrder = selectedOrder
						settingsStore.showCheckInOnly = showCheckOnly
						settingsStore.maxPriceLevel = maxPriceLevel
					} label: {
						Text("Save")
					}
				}
			})
		}
	}
}

struct SettingView_Previews: PreviewProvider {

	static var previews: some View {
		SettingView().environmentObject(SettingStore())
	}
}
