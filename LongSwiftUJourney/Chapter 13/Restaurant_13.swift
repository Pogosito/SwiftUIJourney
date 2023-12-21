//
//  Restaurant_13.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 21.12.2023.
//

import Foundation

struct Restaurant_13: Identifiable {

	var id = UUID()

	var name: String

	var type: String

	var phone: String

	var image: String

	var priceLevel: Int

	var isFavorite: Bool = false

	var isCheckIn: Bool = false
}
