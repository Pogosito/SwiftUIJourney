//
//  ProgressView.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 04.12.2023.
//

import SwiftUI

struct ProgressView: View {

	var body: some View {
		ZStack {
			Circle()
				.stroke(
					Color(.systemGray6),
					lineWidth: 10
				)
				.frame(width: 100, height: 100)
				.font(
					.system(
						size: 40,
						weight: .bold,
						design: .rounded
					)
				)

			Circle()
				.trim(from: 0, to: 0.85)
				.stroke(
					.red,
					lineWidth: 10
				)
				.frame(width: 100, height: 100)
				.font(
					.system(
						size: 40,
						weight: .bold,
						design: .rounded
					)
				)

			VStack {
				Text("\(85) %")
					.font(.system(size: 30))
				Text("Complete")
					.font(.system(.body, design: .rounded))
					.bold()
					.foregroundColor(.gray)
			}
		}
	}
}
