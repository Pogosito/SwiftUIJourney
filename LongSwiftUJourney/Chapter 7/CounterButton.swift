//
//  CounterButton.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 02.12.2023.
//

import SwiftUI

struct CounterButton: View {

	@Binding var counter: Int
	let color: Color
	var textColor: Color = .white

	var body: some View {
		Button {
			counter += 1
		} label: {
			Circle()
				.overlay {
					Text("\(counter)")
						.font(.system(
							size: 100,
							weight: .bold,
							design: .rounded)
						)
						.foregroundColor(textColor)
						.padding()
						.minimumScaleFactor(0.1)
				}
				.foregroundColor(color)
		}
	}
}
