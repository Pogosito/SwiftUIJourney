//
//  Exercise_7_1.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 03.12.2023.
//

import SwiftUI

struct Exercise_7_1: View {

	@State private var counter1 = 0
	@State private var counter2 = 0
	@State private var counter3 = 0
	@State private var mainCounter = 0

	var body: some View {
		VStack {

			Spacer()

			Text("\(counter1 + counter2 + counter3)")
				.font(.system(
					size: 100,
					weight: .bold,
					design: .rounded)
				)

			Spacer()

			HStack {
				CounterButton(counter: $counter1, color: .gray)
				CounterButton(counter: $counter2, color: .brown)
				CounterButton(counter: $counter3, color: .green)
			}
			.padding(.horizontal)

			Spacer()
		}
	}
}

struct Exercise_7_1Preview: PreviewProvider {

	static var previews: some View {
		Exercise_7_1()
	}
}
