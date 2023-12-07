//
//  LineLoadingIndicator.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 06.12.2023.
//

import SwiftUI

struct LineLoadingIndicator: View {

	@Binding var isRunning: Bool

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 5)
				.frame(width: 200, height: 15)
				.foregroundColor(Color.gray)

			RoundedRectangle(cornerRadius: 5)
				.frame(width: 30, height: 10)
				.foregroundColor(Color.orange)
				.offset(
					x: isRunning ? -80 : 80,
					y: 0
				)
		}
	}
}
