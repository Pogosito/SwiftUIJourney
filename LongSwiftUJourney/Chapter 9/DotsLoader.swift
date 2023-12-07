//
//  DotsLoader.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 07.12.2023.
//

import SwiftUI

struct DotsLoader: View {

	@State private var isRunning = false

	var body: some View {
		HStack {
			ForEach(0...4, id: \.self) { index in
				Circle()
					.foregroundColor(.red)
					.frame(width: 20)
					.scaleEffect(isRunning ? 0 : 1)
					.animation(
						.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)),
						value: isRunning
					)
			}
		}
		.onTapGesture {
			isRunning = true
		}
	}
}
