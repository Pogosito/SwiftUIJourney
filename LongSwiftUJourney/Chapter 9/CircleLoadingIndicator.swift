//
//  CircleLoadingIndicator.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 06.12.2023.
//

import SwiftUI

struct CircleLoadingIndicator: View {

	@Binding var isRotated: Bool

	var body: some View {
		ZStack {

			Circle()
				.stroke(Color.gray, lineWidth: 15)
				.frame(width: 100, height: 100)

			Circle()
				.trim(from: 0, to: 0.7)
				.stroke(Color.green, lineWidth: 10)
				.frame(width: 100, height: 100)
				.rotationEffect(
					isRotated ? .degrees(360) : .degrees(0)
				)
		}
	}
}
