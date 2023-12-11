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
	@State private var assymShow = false

	private enum Card {
		case first
		case second
		case third
	}

	@State private var currentCard: Card = .first

	var body: some View {
		ScrollView {
			VStack {
				Group {
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
				}

				Group {
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
				}

				Group {
				makeTitle(with: "Transitions")

					VStack {
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
									.transition(.offsetScaleOpacity)
								}
							}
						}

						VStack {
							makeRoundedRectangle(
								size: .init(width: 100, height: 100),
								with: "assym",
								and: .green
							).onTapGesture {
								withAnimation(.spring()) {
									self.assymShow.toggle()
								}
							}

							if assymShow {
								makeRoundedRectangle(
									with: "",
									and: .purple
								)
								.transition(.scaleAndOffset)
							}
						}
					}
				}
			}

			makeTitle(with: "Exercise_9_1")

			SubmitButton()

			makeTitle(with: "Exercise_9_2")

			switch currentCard {
			case .first: makeRoundedRectangleForExercise(
				with: .blue,
				nextCard: .second
			)
			case .second: makeRoundedRectangleForExercise(
				with: .purple,
				nextCard: .third
			)
			case .third: makeRoundedRectangleForExercise(
				with: .orange,
				nextCard: .first
			)
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

	private func makeRoundedRectangleForExercise(
		with color: Color,
		nextCard: Card
	) -> some View {
		RoundedRectangle(cornerRadius: 20)
			.frame(width: 200, height: 200)
			.foregroundColor(color)
			.transition(.scaleFromButtonAndOpacity)
			.onTapGesture { withAnimation { currentCard = nextCard } }
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
