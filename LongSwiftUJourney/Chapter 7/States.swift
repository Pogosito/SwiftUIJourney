//
//  States.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 02.12.2023.
//

import SwiftUI

struct States: View {

	@State private var isPlaying: Bool = false

	var body: some View {
		Button {
			isPlaying.toggle()
		} label: {
			Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
				.font(.system(size: 150))
				.foregroundColor(isPlaying ? .red : .green)
		}
	}
}

struct States_Preview: PreviewProvider {

	static var previews: some View {
		States()
	}
}
