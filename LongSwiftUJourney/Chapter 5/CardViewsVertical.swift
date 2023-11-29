//
//  CardViewsVertical.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 29.11.2023.
//

import SwiftUI

struct CardViewsVertical: View {

	var body: some View {
		VStack(spacing: 15) {
			Spacer()
			HStack {
				VStack(alignment: .leading) {
					Text("Monday, aug 20".uppercased())
						.font(.caption)
						.foregroundColor(.secondary)
					Text("Your Reading")
						.font(.system(.largeTitle, design: .rounded))
						.fontWeight(.black)
				}
				.padding(.leading)
				Spacer()
			}

			ScrollView {
				VStack {
					CardView(imageName: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
					CardView(imageName: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
					CardView(imageName: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
					CardView(imageName: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
				}
			}
		}
	}
}

struct CardViewsVertical_Preview: PreviewProvider {
	
	static var previews: some View {
		CardViewsVertical()
	}
}
