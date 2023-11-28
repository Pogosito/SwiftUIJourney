//
//  CardView.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 28.11.2023.
//

import SwiftUI

struct CardView: View {

	var body: some View {
		VStack {
			Image("swiftui-button")
				.resizable()
				.aspectRatio(contentMode: .fit)

			VStack(alignment: .leading, spacing: 2) {
				Text("SwiftUI")
					.font(.headline)
					.foregroundColor(.secondary)
				Text("Drawing a border with Rounded Corners")
					.font(.title)
					.fontWeight(.black)
					.foregroundColor(.primary)
					.lineLimit(3)
				Text("WRITTEN BY SIMON NG")
					.font(.caption)
					.foregroundColor(.secondary)
			}
			.padding(10)
		}
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(.gray, lineWidth: 1)
		)
		.padding([.top, .horizontal])
	}
}

struct CardView_Preview: PreviewProvider {

	static var previews: some View {
		CardView()
	}
}
