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

	@State private var scaleShow = false
	@State private var offsetShow = false
	@State private var comboShow = false

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
								? Animation.default
								: .linear.repeatForever(autoreverses: false)
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
							? Animation.default
							: .linear.repeatForever(autoreverses: true)
						) {
							isRunning.toggle()
						}
					}
				}

				HStack {
					DotsLoader()
						.padding(.horizontal)
					CircleProgressIndicator()
				}

				HStack {
					ShapeChangerButton()
				}

				makeTitle(with: "Transitions")

				HStack(alignment: .top) {

					VStack {
						makeRoundedRectangle(
							size: .init(width: 100, height: 100),
							with: "scale",
							and: .green
						).onTapGesture {
							withAnimation(.spring()) {
								self.scaleShow.toggle()
							}
						}

						if scaleShow {
							makeRoundedRectangle(
								with: "",
								and: .purple
							)
							.transition(
								.scale(scale: 0, anchor: .bottom)
							)
						}
					}

					VStack {
						makeRoundedRectangle(
							size: .init(width: 100, height: 100),
							with: "offset",
							and: .green
						).onTapGesture {
							withAnimation(.spring()) {
								self.offsetShow.toggle()
							}
						}

						if offsetShow {
							makeRoundedRectangle(
								with: "",
								and: .purple
							)
							.transition(
								.offset(x: -600, y: 0)
							)
						}
					}

					VStack {
						makeRoundedRectangle(
							size: .init(width: 100, height: 100),
							with: "combo",
							and: .green
						).onTapGesture {
							withAnimation(.spring()) {
								self.comboShow.toggle()
							}
						}

						if comboShow {
							makeRoundedRectangle(
								with: "",
								and: .purple
							)
							.transition(
								.offset(x: -600, y: 0)
							)
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

	func makeRoundedRectangle(
		size: CGSize = .init(width: 100, height: 100),
		with text: String,
		and foregroundColor: Color
	) -> some View {
		RoundedRectangle(cornerRadius: 10)
			.frame(width: size.width, height: size.height)
			.foregroundColor(foregroundColor)
			.overlay {
				Text(text)
					.font(
						.system(
							.title,
							design: .rounded
						)
					)
					.bold()
					.foregroundColor(.white)
			}
	}
}

struct SwiftUIAnimations_Previews: PreviewProvider {
	
	static var previews: some View {
		SwiftUIAnimations()
	}
}
