//
//  SwiftUIAnimations.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 04.12.2023.
//

import SwiftUI

struct SwiftUIAnimations: View {

	@State private var circleColorChanged = false
	@State private var heartColorChanged = false
	@State private var heartSizeChanged = false

	@State private var circleColorChanged1 = false
	@State private var heartColorChanged1 = false
	@State private var heartSizeChanged1 = false

	@State private var isRotated = false
	@State private var isRunning = false

	var body: some View {
		ScrollView {
			VStack {
				makeTitle(with: "Implicit/Explicit animations")

				HStack {
					Heart(
						circleColorChanged: $circleColorChanged,
						heartSizeChanged: $heartColorChanged
					)
					.onTapGesture {
						circleColorChanged.toggle()
						heartColorChanged.toggle()
						heartSizeChanged.toggle()
					}
					.animation(
						.spring(
							response: 0.3,
							dampingFraction: 0.3,
							blendDuration: 0.3
						),
						value: circleColorChanged
					)
					.animation(
						.default,
						value: heartSizeChanged
					)

					Heart(
						circleColorChanged: $circleColorChanged1,
						heartSizeChanged: $heartColorChanged1
					)
					.onTapGesture {
						withAnimation(.easeIn) {
							circleColorChanged1.toggle()
							heartColorChanged1.toggle()
							heartSizeChanged1.toggle()
						}
					}
				}

				makeTitle(with: "Loading indicators")

				HStack {
					CircleLoadingIndicator(isRotated: $isRotated)
						.onTapGesture {
							withAnimation(
								isRotated
								? .linear.repeatForever(autoreverses: false)
								: Animation.default
							) {
								isRotated.toggle()
							}
						}
						.padding(.horizontal)

					LineLoadingIndicator(
						isRunning: $isRunning
					).onTapGesture {
						withAnimation(
							isRunning
							? .linear.repeatForever(autoreverses: true)
							: Animation.default
						) {
							isRunning.toggle()
						}
					}
				}
			}
		}
	}

	func makeTitle(with text: String) -> some View {
		HStack {
			Text(text)
				.padding(.horizontal)
				.font(.system(
					.largeTitle,
					design: .rounded,
					weight: .bold)
				)
			Spacer()
		}
	}
}

struct SwiftUIAnimations_Previews: PreviewProvider {
	
	static var previews: some View {
		SwiftUIAnimations()
	}
}
