//
//  PlayButton.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 04.12.2023.
//

import SwiftUI

struct PlayButton: View {

	var circleRadus: CGFloat

	var body: some View {
		Circle()
			.padding()
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.frame(
						width: circleRadus / 2,
						height: circleRadus / 2
					)
					.foregroundColor(Color.white)
			)
			.foregroundColor(Color.green)
			.frame(width: circleRadus * 2, height: circleRadus * 2)
	}
}
