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

	@State private var offset: CGFloat = 0

	@State private var isRunning = false

	var body: some View {
		ScrollView {
			VStack {
				MoonButton(height: 100, onPress: {
					print("Press")
				}, onRelease: {
					print("Release")
				})
				.padding(.top)

				RoundedRectangle(cornerRadius: 20)
					.frame(width: 100, height: 100)
					.foregroundStyle(.white)
					.overlay {
						Image(systemName: "heart.fill")
							.offset(x: 0, y: isRunning ? 100 : 0)
							.foregroundStyle(.red)
							.font(.system(size: 50))
					}
					.overlay {
						Image(systemName: "heart.fill")
							.offset(x: 0, y: isRunning ? 0 : -100)
							.foregroundStyle(.red)
							.font(.system(size: 50))
						
					}
					.onTapGesture {
						if !isRunning {
							withAnimation(.linear(duration: 0.5).speed(3).repeatCount(10, autoreverses: false)) {
								isRunning = true
							} completion: {
								isRunning = false
							}
						}
					}
					.clipped()
					.padding(.bottom)
			}
			.frame(
				maxWidth: .infinity,
				maxHeight: .infinity
			)
			.background(Color.gray)
		}
	}
}

struct ButtonsAnimations_Previews: PreviewProvider {

	static var previews: some View {
		ButtonsAnimations()
	}
}
