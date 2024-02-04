//
//  CardView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 29.01.2024.
//

import SwiftUI

struct BankCardView: View {

	let card: Card

	var body: some View {
		HStack {
			Image(card.image)
				.resizable()
				.scaledToFit()
				.shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
				.overlay(alignment: .bottomLeading) {
					VStack(alignment: .leading) {
						Text(card.number)
							.bold()
						HStack {
							Text(card.name)
								.bold()
							Text("Valid Thru \(card.expiryDate)")
						}
					}
					.foregroundStyle(.white)
					.padding(.leading, 25)
					.padding(.bottom, 20)
				}
		}
	}
}

struct BankCardView_Provider: PreviewProvider {

	static var previews: some View {
//		ForEach(testCards) { card in
			BankCardView(
				card: testCards[0]
			)
//			.previewDisplayName(card.name)
//		}
	}
}
