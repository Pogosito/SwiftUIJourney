//
//  ButtonStyles.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 01.12.2023.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {

	func makeBody(configuration: Configuration) -> some View {
		return configuration.label
			.frame(minWidth: 0, maxWidth: .infinity)
			.padding()
			.foregroundColor(Color.white)
			.background(
				LinearGradient(
					colors: [Color("DarkGreen"), Color("LightGreen")],
					startPoint: .leading,
					endPoint: .trailing
				)
			)
			.cornerRadius(40)
			.padding(.horizontal, 20)
			.scaleEffect(configuration.isPressed ? 0.5 : 1)
	}
}

struct RotationButtonStyle: ButtonStyle {

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
	}
}
