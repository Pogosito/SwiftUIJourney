//
//  CircleProgressIndicator.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 07.12.2023.
//

import SwiftUI

struct CircleProgressIndicator: View {

	@State private var progress: Int = 0

	var body: some View {
		ZStack {
			Circle()
				.stroke(Color.gray, lineWidth: 15)
				.frame(width: 110)

			Circle()
				.trim(from: 0, to: CGFloat(progress) / 100.0)
				.stroke(Color.purple, lineWidth: 10)
				.frame(width: 110)

			Text("\(progress) %")
				.font(.system(.title, design: .rounded, weight: .bold))
				.onTapGesture {
					withAnimation {
						let newProgress = Int.random(in: 0...20)
						progress = progress + newProgress > 100
						? 0
						: progress + Int.random(in: 0...30)
					}
				}
		}
	}
}
