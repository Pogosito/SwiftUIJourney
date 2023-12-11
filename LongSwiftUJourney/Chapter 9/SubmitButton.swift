//
//  SubmitButton.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 11.12.2023.
//

import SwiftUI

enum LoadingButtonState {
	case submit
	case processing
	case done
}

struct SubmitButton: View {

	@State private var currentButtonState: LoadingButtonState = .submit
	@State private var isProcessing = false

	var body: some View {
		Button {
			switch currentButtonState {
			case .submit: processProcessingState()
			case .processing: print("Already processing")
			case .done:
				isProcessing = false
				currentButtonState = .submit
			}
		} label: {
			switch currentButtonState {
			case .submit: makeSubmitState()
			case .processing: makeProcessingState()
			case .done: makeDoneState()
			}
		}
		.frame(
			width: currentButtonState == .submit ? 135 : 180,
			height: 50
		)
		.background(currentButtonState == .done ? .red : .green)
		.foregroundColor(.white)
		.clipShape(Capsule())
		.animation(.default, value: currentButtonState)
	}

	func processProcessingState() {
		currentButtonState = .processing
		isProcessing = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
			currentButtonState = .done
		}
	}

	// MARK: - State appearance

	func makeSubmitState() -> some View {
		Text("Submit")
			.padding()
			.padding(.horizontal)
			.font(.system(size: 20, weight: .bold, design: .rounded))
			.foregroundColor(.white)
			.transition(
				.asymmetric(
					insertion: .offset(x: 0, y: -20),
					removal: .opacity
				)
			)
	}

	func makeProcessingState() -> some View {
		HStack {
			Circle()
				.trim(from: 0, to: 0.9)
				.stroke(lineWidth: 3)
				.frame(width: 25, height: 25)
				.rotationEffect(
					.degrees(
						isProcessing ? 360 : 0
					)
				)
				.onAppear {
					withAnimation(.linear.repeatForever(autoreverses: false)) {
						isProcessing.toggle()
					}
				}
			Text("Processing")
				.font(.system(size: 20, weight: .bold, design: .rounded))
		}
		.foregroundColor(.white)
	}

	func makeDoneState() -> some View {
		Text("Done")
			.padding()
			.padding(.horizontal)
			.font(.system(size: 20, weight: .bold, design: .rounded))
			.foregroundColor(.white)
			.transition(.opacity)
	}
}

struct Exercise_9_1_Preview: PreviewProvider {

	static var previews: some View {
		SubmitButton()
	}
}
