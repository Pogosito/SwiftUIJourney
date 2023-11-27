//
//  Header.swift
//  LongSwiftUJourney
//
//  Created by Pogos Anesyan on 26.11.2023.
//

import SwiftUI

struct Header: View {

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 2) {
				Text(Chap4.Strings.choose)
					.font(.system(.largeTitle, design: .rounded))
					.fontWeight(.black)
				Text(Chap4.Strings.yourPlan)
					.font(.system(.largeTitle, design: .rounded))
					.fontWeight(.black)
			}
			Spacer()
		}
		.padding()
	}
}
