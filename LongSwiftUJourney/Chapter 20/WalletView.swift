//
//  WalletView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 29.01.2024.
//

import SwiftUI

struct WalletView: View {

	var cards: [Card] = testCards
	private static let cardOffset: CGFloat = 50.0
	@State private var isCardPresented = false

	var body: some View {
		VStack {
			HStack {
				Text("Wallet")
					.font(.system(.largeTitle, design: .rounded))
					.fontWeight(.heavy)

				Spacer()

				Image(systemName: "plus.circle.fill")
					.font(.system(.title))
			}
			.padding(.horizontal)
			.padding(.top, 20)
			.padding(.bottom)

			Spacer()

			ZStack {
				if isCardPresented {
					ForEach(cards) { card in
						BankCardView(card: card)
							.offset(offset(for: card))
							.padding(.horizontal, 35)
							.zIndex(self.zIndex(for: card))
							.transition(AnyTransition.slide)
					}
				}
			}
			.onAppear(perform: {
				withAnimation {
					isCardPresented.toggle()
				}
			})
			Spacer()
		}
	}
}

private extension WalletView {

	func zIndex(for card: Card) -> Double {
		guard let cardIndex = index(for: card) else {
			return 0.0
		}

		return -Double(cardIndex)
	}

	func index(for card: Card) -> Int? {
		guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
			return nil
		}

		return index
	}

	func offset(for card: Card) -> CGSize {

		guard let cardIndex = index(for: card) else {
			return CGSize()
		}

		return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
	}
}

struct WalletView_Previews: PreviewProvider {

	static var previews: some View {
		WalletView()
	}
}
