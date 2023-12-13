//
//  BasicImageRow.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.12.2023.
//

import SwiftUI

struct BasicImageRow: View {

	var restaurant: Restaurant

	var body: some View {
		HStack {
			Image(restaurant.image)
				.resizable()
				.frame(width: 40, height: 40)
				.cornerRadius(5)
			Text(restaurant.name)
		}
	}
}
