//
//  ButtonsAnimations.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import SwiftUI

struct ButtonsAnimations: View {

	@GestureState var isPressed: Bool = false

	var body: some View {
		VStack {
//			Button(action: {
//				
//			}, label: {
				RoundedRectangle(cornerRadius: 10)
					.foregroundStyle(.blue)
					.frame(width: 50, height: 50)
					.overlay {
						ZStack {
							Circle()
								.foregroundStyle(.white)
								.frame(width: 15, height: 15)

							Circle()
								.offset(x: 4, y: -4)
								.frame(width: 15, height: 15)
								.foregroundStyle(.green)
						}
					}
					.modifier(PressActions(onPress: {
						print("Press")
					}, onRelease: {
						print("release")
					} ))
//			})
		}
	}
}

struct ButtonsAnimations_Previews: PreviewProvider {

	static var previews: some View {
		ButtonsAnimations()
	}
}
