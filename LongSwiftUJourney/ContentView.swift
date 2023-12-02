//
//  ContentView.swift
//  LongSwiftUJourney
//
//  Created by Pogos Anesyan on 26.11.2023.
//

import SwiftUI

struct ContentView: View {

	@State private var counter = 10000000000

	var body: some View {
		VStack {
			PlayStopButton()
			CounterButton(counter: $counter, color: .brown)
			CounterButton(counter: $counter, color: .gray)
			CounterButton(counter: $counter, color: .green)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
