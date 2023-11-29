//
//  CardView.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 28.11.2023.
//

import SwiftUI

struct CardView: View {

	var imageName: String
	var category: String
	var heading: String
	var author: String

	var body: some View {
		VStack {
			Image(imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
			HStack {
				VStack(alignment: .leading, spacing: 2) {
					Text(category)
						.font(.headline)
						.foregroundColor(.secondary)
					Text(heading)
						.font(.title)
						.fontWeight(.black)
						.foregroundColor(.primary)
						.lineLimit(3)
						.minimumScaleFactor(0.5)
					Text(author.uppercased())
						.font(.caption)
						.foregroundColor(.secondary)
				}
				Spacer()
			}
			.padding()
		}
		.cornerRadius(10)
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(.gray, lineWidth: 1)
		)
		.padding([.top, .horizontal])
	}
}
