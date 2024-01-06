//
//  HiGestures.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 03.01.2024.
//

import SwiftUI

struct HiGestures: View {

	@State private var isPressed1: Bool = false
	@State private var isPressed2: Bool = false
	@State private var isPressed3: Bool = false
	@State private var isPressed4: Bool = false

	@GestureState private var longPressTap = false
	@GestureState private var dragOffset: CGSize = .zero

	@GestureState private var dragOffset2: CGSize = .zero
	@GestureState private var isPressed5: Bool = false

	@State private var position: CGSize = .zero
	@State private var finalOffset: CGSize = .zero
	@State private var imageScaleValue: CGFloat = 1

	var body: some View {
		VStack {

			HStack {
				Text("Simple Tap")
					.font(.largeTitle)
				Spacer()
				makeImage(toggle: isPressed1)
					.gesture(
						TapGesture()
							.onEnded({
								isPressed1.toggle()
							})
					)

				Text("Long press")
					.font(.largeTitle)
				Spacer()
				makeImage(toggle: isPressed2)
					.gesture(
						LongPressGesture(minimumDuration: 1.0)
							.onEnded({ _ in
								isPressed2.toggle()
							})
					)
			}.padding(.horizontal)

			Divider()

			HStack {
				Text("Long press with opacity")
					.font(.largeTitle)
				Spacer()
				makeImage(toggle: isPressed3)
					.opacity(longPressTap ? 0.4 : 1.0)
					.gesture(
						LongPressGesture(minimumDuration: 1.0)
							.updating(
								$longPressTap,
								body: { currentState, state, trans in
									state = currentState
								})
							.onEnded({ _ in
								isPressed3.toggle()
							})
					)
			}.padding(.horizontal)

			Divider()

			HStack {
				Text("Drag")
					.font(.largeTitle)
				Spacer()
				makeImage(toggle: isPressed4)
					.offset(
						x: finalOffset.width + dragOffset.width,
						y: finalOffset.height + dragOffset.height)
					.opacity(longPressTap ? 0.4 : 1.0)
					.gesture(
						DragGesture()
							.updating(
								$dragOffset,
								body: { currentState, state, trans in
									state = currentState.translation
								}
							)
							.onEnded({ val in
								print("location:", val.location)
								print("translation:", val.translation)
								print("---------------------")
								finalOffset.width += val.translation.width
								finalOffset.height += val.translation.height
							})
					)
			}.padding(.horizontal)

			Divider()

			HStack {
				Text("Combining")
					.font(.largeTitle)
				Spacer()
				makeImage(toggle: isPressed5)
					.opacity(isPressed5 ? 0.5 : 1.0)
					.offset(
						x: position.width + dragOffset2.width,
						y: position.height + dragOffset2.height
					)
					.animation(.easeInOut, value: dragOffset)
					.gesture(
						LongPressGesture(minimumDuration: 1.0)
							.updating($isPressed5, body: { currentState, state, transaction in
								state = currentState
							})
							.sequenced(before: DragGesture())
							.updating($dragOffset2, body: { (value, state, transaction) in
								switch value {
								case .first(true): print("Tapped")
								case .second(true, let drag): print("DRAAG")
									state = drag?.translation ?? .zero
								default: break
								}
							})
							.onEnded({ value in
								guard case .second(true, let drag?) = value else {
									return
								}
								position.height += drag.translation.height
								position.width += drag.translation.width
							})
					)
			}.padding(.horizontal)

			Divider()

			HStack {
				Text("Magnification")
					.font(.largeTitle)
				Spacer()
				Image(systemName: "person.fill")
					.scaleEffect(imageScaleValue, anchor: .center)
					.font(.system(size: 50))
					.foregroundColor(.indigo)
					.gesture(
						MagnificationGesture(minimumScaleDelta: 3)
							.onChanged({ value in
								imageScaleValue = value
							})
					)
			}.padding(.horizontal)
		}
	}

	func makeImage(toggle: Bool) -> some View {
		Image(
			systemName: "star.circle.fill"
		)
			.font(.system(size: 50))
			.scaleEffect(toggle ? 0.5 : 1.0)
			.animation(.easeInOut, value: toggle)
			.foregroundColor(.green)
	}
}

struct HiGestures_Previews: PreviewProvider {

	static var previews: some View { HiGestures() }
}
