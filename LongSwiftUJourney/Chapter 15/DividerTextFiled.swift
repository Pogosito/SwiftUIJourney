//
//  DividerTextFiled.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 28.12.2023.
//

import SwiftUI

struct DividerTextFiled: View {

	@Binding var text: String
	var placeholder: String
	var isSecure: Bool = false

	var body: some View {
		VStack {
			if isSecure {
				SecureField(placeholder, text: $text)
					.font(.system(size: 25, weight: .semibold, design: .rounded))
			} else {
				TextField(placeholder, text: $text)
					.font(.system(size: 25, weight: .semibold, design: .rounded))
			}

			Divider()
		}
	}
}
