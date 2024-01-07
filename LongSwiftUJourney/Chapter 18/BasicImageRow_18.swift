//
//  BasicImageRow_18.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 07.01.2024.
//

import SwiftUI

struct BasicImageRow_18: View {

	var restaurant: Restaurant_18

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
