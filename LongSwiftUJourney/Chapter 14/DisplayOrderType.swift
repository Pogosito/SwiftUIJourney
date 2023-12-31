//
//  DisplayOrderType.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 22.12.2023.
//

import Foundation

enum DisplayOrderType: Int, CaseIterable {

	case alphabetical = 0

	case favoriteFirst = 1

	case checkInFirst = 2

	init(type: Int) {
		switch type {
		case 0: self = .alphabetical
		case 1: self = .favoriteFirst
		case 2: self = .checkInFirst
		default: self = .alphabetical
		}
	}

	var text: String {
		switch self {
		case .alphabetical: return "Alphabetical"
		case .favoriteFirst: return "Show Favorite First"
		case .checkInFirst: return "Show Check-in First"
		}
	}

	func predicate() -> (Restaurant_13, Restaurant_13) -> Bool {
		switch self {
		case .alphabetical: return { $0.name < $1.name }
		case .favoriteFirst: return { $0.isFavorite && !$1.isFavorite }
		case .checkInFirst: return { $0.isCheckIn && !$1.isCheckIn }
		}
	}
}
