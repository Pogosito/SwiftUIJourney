//
//  UILikeTinder.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 09.01.2024.
//

import SwiftUI

struct UILikeTinder: View {

	@GestureState private var dragState = DragState.inactive

	@State private var tripsViews: [TripView] = {
		var tripsViews: [TripView] = []

		for index in 0..<2 {
			tripsViews.append(
				TripView(trip: trips[index])
			)
		}

		return tripsViews
	}()

	@State private var currentTripView: TripView?
	@State private var lastIndex = 1
	@State private var removalTransition = AnyTransition.trailingBottom

	private let dragThreshold: CGFloat = 80.0

	var body: some View {
		VStack {
			HStack {
				button(with: "line.3.horizontal") { print("Menu") }

				Spacer()

				button(with: "mappin.and.ellipse") { print("Location") }

				Spacer()

				button(with: "heart.circle.fill") { print("heart") }
			}.padding()

			ZStack {
				ForEach(tripsViews) { tripView in
					let isTopTrip: Bool = isTopTrip(tripView: tripView)
					tripView
						.overlay {
							if self.dragState.translation.width < -self.dragThreshold && self.isTopTrip(tripView: tripView) {
								Image(systemName: "x.circle")
									.foregroundColor(.white)
									.font(.system(size: 100))
							} else if self.dragState.translation.width > self.dragThreshold && self.isTopTrip(tripView: tripView) {
								Image(systemName: "heart.circle")
									.foregroundColor(.white)
									.font(.system(size: 100))
							}
						}
						.zIndex(isTopTrip ? 1 : 0)
						.offset(isTopTrip ? dragState.translation : .zero)
						.scaleEffect(dragState.isDragging ? 0.95 : 1.0)
						.rotationEffect(Angle(degrees: isTopTrip ? Double(dragState.translation.width / 10) : 0))
						.transition(removalTransition)
						.animation(.interpolatingSpring(stiffness: 180, damping: 100), value: dragState.translation)
						.gesture(
							LongPressGesture(minimumDuration: 0.01)
								.sequenced(before: DragGesture())
								.updating(self.$dragState, body: { value, state, transaction in
									switch value {
									case .first(true): 
										state = .pressing
									case .second(true, let drag):
										state = .dragging(translation: drag?.translation ?? .zero)
									default:
										print(value)
										break
									}
								})
								.onChanged({ value in
									guard case .second(true, let drag?) = value else {
										return
									}

									if drag.translation.width < -self.dragThreshold {
										self.removalTransition = .leadingBottom
									}

									if drag.translation.width > self.dragThreshold {
										self.removalTransition = .trailingBottom
									}
								})
								.onEnded({ value in
									guard case .second(true, let drag?) = value else {
										return
									}

									if drag.translation.width < -self.dragThreshold ||
										drag.translation.width > self.dragThreshold {
										self.moveCard()
									}
								})
						)
				}
			}

			Spacer(minLength: 20)

			HStack {
				button(with: "xmark") { print("cross") }
					.padding(.trailing, 10)

				Button(action: {
					print("BOOK IT NOW")
				}, label: {
					Text("BOOK IT NOW")
						.padding()
						.padding(.horizontal)
						.background(Color.black)
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.foregroundStyle(.white)
				})
				.padding(.horizontal)

				button(with: "heart") { print("heart") }
					.padding(.leading, 10)
			}
			.opacity(
				dragState.isDragging ? 0.0 : 1.0
			)
			.animation(.default, value: dragState.isDragging)

			Spacer()
		}
	}

	private func moveCard() {
		tripsViews.removeFirst()
		lastIndex += 1
		let trip = trips[lastIndex % trips.count]
		tripsViews.append(TripView(trip: trip))
	}

	private func isTopTrip(tripView: TripView) -> Bool {
		guard let index = tripsViews.firstIndex(where: {
			$0.id == tripView.id
		}) else {
			return false
		}

		return index == 0
	}

	func button(
		with systemIconName: String,
		and action: @escaping () -> ()
	) -> some View {
		Button(action: {
			action()
		}, label: {
			Image(systemName: systemIconName)
				.font(.system(size: 28))
				.foregroundStyle(.black)
		})
	}
}

struct UILikeTinder_Previews: PreviewProvider {

	static var previews: some View {
		UILikeTinder()
	}
}
