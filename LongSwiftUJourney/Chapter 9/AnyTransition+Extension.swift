//
//  AnyTransition+Extension.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 11.12.2023.
//

import SwiftUI

extension AnyTransition {

	static var offsetScaleOpacity: AnyTransition {
		AnyTransition
			.offset(x: -600, y: 0)
			.combined(with: .scale)
			.combined(with: .opacity)
	}

	static var scaleAndOffset: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .scale,
			removal: .offset(x: -600)
		)
	}
}
