//
//  DragState.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 13.01.2024.
//

import Foundation

enum DragState {

	case inactive

	case pressing

	case dragging(translation: CGSize)

	var translation: CGSize {
		switch self {
		case .inactive, .pressing: return .zero
		case let .dragging(translation): return translation
		}
	}

	var isDragging: Bool {
		switch self {
		case .dragging: return true
		case .pressing, .inactive: return false
		}
	}

	var isPressing: Bool {
		switch self  {
		case .pressing: return true
		case .inactive, .dragging: return false
		}
	}
}
