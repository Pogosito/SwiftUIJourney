//
//  ButtonsAnimations.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import SwiftUI

struct ButtonsAnimations: View {

	@State private var isPressed: Bool = false
	@State private var isLight: Bool = false

	var body: some View {
		VStack {
			MoonButton(height: 70, moonHight: 35, onPress: {
				print("Press")
			}, onRelease: {
				print("Release")
			})
		}
		.frame(
			maxWidth: .infinity,
			maxHeight: .infinity
		)
		.background(Color.gray)
	}
}

struct ButtonsAnimations_Previews: PreviewProvider {

	static var previews: some View {
		ButtonsAnimations()
	}
}
