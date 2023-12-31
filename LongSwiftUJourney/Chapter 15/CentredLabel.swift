//
//  CentredLabel.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 28.12.2023.
//

import SwiftUI

struct CentredLabel: View {

	var text: String
	var systemImageName: String
	var isStrikeThrough = false

	var body: some View {
		HStack {
			Image(systemName: systemImageName)
				.foregroundColor(.red)

			Text(text)
				.foregroundColor(.secondary)
				.strikethrough(isStrikeThrough)
		}
	}
}
