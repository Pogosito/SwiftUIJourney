//
//  Buttons.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 30.11.2023.
//

import SwiftUI

struct Buttons: View {

	var body: some View {
		Button {
			print("Hello world tapped")
		} label: {
			Text("Hello world")
		}
	}
}

struct Buttons_Preview: PreviewProvider {

	static var previews: some View {
		Buttons()
	}
}
