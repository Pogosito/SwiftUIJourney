//
//  MoonButton.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 15.01.2024.
//

import SwiftUI

struct MoonButton: View {

	@State private var isPressed: Bool = false
	@State private var isLight: Bool = false

	var height: CGFloat = 50
	var moonHight: CGFloat = 15
	var cornerRadoius: CGFloat = 10
	var onPress: () -> Void
	var onRelease: () -> Void

	var body: some View {
		RoundedRectangle(cornerRadius: cornerRadoius)
			.foregroundStyle(
				isLight
				? .white
				: .init(red: 0.2, green: 0.2, blue: 0.19)
			)
			.frame(width: height, height: height)
			.overlay {
				ZStack {
					Circle()
						.foregroundStyle(
							isLight
							? .yellow
							: .indigo)
						.frame(width: moonHight, height: moonHight)

					Circle()
						.offset(
							x: isPressed ? 0 : 4,
							y: isPressed ? 0 : -4
						)
						.frame(width: moonHight, height: moonHight)
						.foregroundStyle(
							isLight
							? .white
							: .init(red: 0.2, green: 0.2, blue: 0.19)
						)
				}
			}
			.modifier(PressActions(onPress: {
				isPressed = true
				isLight = !isLight
				onPress()
			}, onRelease: {
				isPressed = false
				onRelease()
			}))
			.animation(.default, value: isPressed)
			.animation(.default, value: isLight)
	}
}
