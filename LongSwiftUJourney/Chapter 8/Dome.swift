//
//  Dome.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 04.12.2023.
//

import SwiftUI

final class Dome: Shape {

	func path(in rect: CGRect) -> Path {
		var path = Path()

		path.move(to: .zero)
		path.addQuadCurve(
			to: .init(x: rect.width, y: 0),
			control: .init(x: rect.width / 2, y: -(rect.width * 0.1))
		)

		path.addRect(
			.init(
				origin: .zero,
				size: .init(
					width: rect.width,
					height: rect.height
				)
			)
		)
		return path
	}
}
