//
//  AnyTransition+Extenstion_19.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 24.01.2024.
//

import SwiftUI

extension AnyTransition {

	static var trailingBottom: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .identity,
			removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
		)
	}

	static var leadingBottom: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .identity,
			removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
		)
	}
}
