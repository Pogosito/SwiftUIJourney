//
//  CardViewsHorizontal.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 29.11.2023.
//

import SwiftUI

struct CardViewsHorizontal: View {

	var body: some View {
		VStack(spacing: 15) {
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

			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					Group {
						CardView(imageName: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
						CardView(imageName: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
						CardView(imageName: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
						CardView(imageName: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
					}
					.frame(width: 300)
				}
			}

			Spacer()
		}
	}
}

struct CardViewsHorizontal_Preview: PreviewProvider {
	
	static var previews: some View {
		CardViewsHorizontal()
	}
}

