//
//  SpinButton.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 24.01.2024.
//

import SwiftUI

struct SpinButton: View {

	@State private var isRunning = false

	var body: some View {
		RoundedRectangle(cornerRadius: 20)
			.frame(width: 100, height: 100)
			.foregroundStyle(.white)
			.overlay {
				Image(systemName: "heart.fill")
					.offset(x: 0, y: isRunning ? 100 : 0)
					.foregroundStyle(.red)
					.font(.system(size: 50))
			}
			.onTapGesture {
				if !isRunning {
					withAnimation(.linear(duration: 0.5).speed(3).repeatCount(10, autoreverses: false)) {
						isRunning = true
					} completion: {
						isRunning = false
					}
				}
			}
			.overlay {
				Image(systemName: "heart.fill")
					.offset(x: 0, y: isRunning ? 0 : -100)
					.foregroundStyle(.red)
					.font(.system(size: 50))
				
			}
			.clipped()
			.padding(.bottom)
	}
}
