//
//  ContentView.swift
//  LongSwiftUJourney
//
//  Created by Pogos Anesyan on 26.11.2023.
//

import SwiftUI

struct ContentView: View {

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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
