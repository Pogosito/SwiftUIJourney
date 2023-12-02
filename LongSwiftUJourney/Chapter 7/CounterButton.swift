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

	var body: some View {
		Button {
			counter += 1
		} label: {
			Text("\(counter)")
				.frame(width: 200, height: 200, alignment: .center)
				.font(.system(size: 100, weight: .regular, design: .rounded))
				.background(color)
				.clipShape(Circle())
				.foregroundColor(.white)
				.minimumScaleFactor(0.2)
		}
	}
}
