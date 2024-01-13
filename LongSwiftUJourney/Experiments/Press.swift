//
//  Press.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import SwiftUI

struct Press: ButtonStyle {

	var pressAction: () -> ()
	var releaseAction: () -> ()

	func makeBody(configuration: Configuration) -> some View {
		print(configuration.isPressed)
		return configuration.label
			.simultaneousGesture(
				DragGesture(minimumDistance: 0)
					.onChanged({ _ in pressAction() })
					.onEnded({ _ in releaseAction() })
			)
	}
}

struct PressActions: ViewModifier {
	var onPress: () -> Void
	var onRelease: () -> Void
	
	func body(content: Content) -> some View {
		content
			.simultaneousGesture(
				DragGesture(minimumDistance: 0)
					.onChanged({ _ in
						onPress()
					})
					.onEnded({ _ in
						onRelease()
					})
			)
	}
}
