//
//  ButtonsAnimations.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import SwiftUI

struct ButtonsAnimations: View {

	@State private var tapped: Bool = false
	@State private var buttomWidth: CGFloat = 150

	var body: some View {
		ScrollView {
			VStack {
				MoonButton(height: 100, onPress: {
					print("Press")
				}, onRelease: {
					print("Release")
				})
				.padding(.top)

				SpinButton()

				Capsule()
					.frame(width: buttomWidth, height: 50)
					.padding(.bottom)
					.animation(
						.spring(
							response: 0.5,
							dampingFraction: 0.5,
							blendDuration: 0.5
						).speed(2),

						value: buttomWidth
					)
					.onTapGesture {
						tapped = !tapped
						buttomWidth = tapped ? 150 : 50
					}
			}
			.frame(
				maxWidth: .infinity,
				maxHeight: .infinity
			)
			.background(Color.gray)
		}
	}
}

struct ButtonsAnimations_Previews: PreviewProvider {

	static var previews: some View {
		ButtonsAnimations()
	}
}
