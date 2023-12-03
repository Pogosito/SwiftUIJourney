//
//  States.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 02.12.2023.
//

import SwiftUI

struct States: View {

	@State private var counter = 10000000000

	var body: some View {
		VStack {

			PlayStopButton()

			CounterButton(counter: $counter, color: .gray)
			CounterButton(counter: $counter, color: .green)
			CounterButton(counter: $counter, color: .brown)
		}
	}
}

struct States_Preview: PreviewProvider {

	static var previews: some View {
		States()
	}
}
