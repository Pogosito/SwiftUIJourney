//
//  Heart.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 06.12.2023.
//

import SwiftUI

struct Heart: View {

	@Binding var circleColorChanged: Bool
	@Binding var heartSizeChanged: Bool

	var body: some View {
		ZStack {
			Circle()
				.frame(width: 100)
				.foregroundColor(
					circleColorChanged
					? Color(.systemGray5)
					: .red
				)

			Image(systemName: "heart.fill")
				.foregroundColor(
					circleColorChanged
					? .red
					: .white
				)
				.font(.system(size: 50))
				.scaleEffect(
					heartSizeChanged
					? 1.0
					: 0.5
				)
		}
	}
}
