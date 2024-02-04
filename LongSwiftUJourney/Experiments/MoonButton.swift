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
	var onPress: () -> Void
	var onRelease: () -> Void

	var body: some View {
		let offest = height / 6
		let littleCircleRadius = height / 2

		return RoundedRectangle(cornerRadius: height / 5)
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
						.frame(width: littleCircleRadius, height: littleCircleRadius)

					Circle()
						.offset(
							x: isPressed ? 0 : offest,
							y: isPressed ? 0 : -offest
						)
						.frame(width: littleCircleRadius, height: littleCircleRadius)
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
