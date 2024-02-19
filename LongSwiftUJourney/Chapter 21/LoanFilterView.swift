//
//  LoanFilterView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 19.02.2024.
//

import SwiftUI

struct LoanFilterView: View {

	@Binding var amount: Double
	var minAmount = 0.0
	var maxAmount = 10_000.0

	var body: some View {
		VStack(alignment: .leading) {
//			Slider(
//				value: $amount,
//				in: 0.0...10_000.0
//			) {
//				Text("Hiii Pogos")
//			} minimumValueLabel: {
//				Text("minAmount \(minAmount)")
//			} maximumValueLabel: {
//				Text("MaxAmount \(maxAmount)")
//			}
			Text("Show loan amount below $\(Int(amount))")
				.font(.system(.headline, design: .rounded))

			Slider(value: $amount, in: minAmount...maxAmount)

			HStack {
				Text("\(Int(minAmount))")
					.font(.system(.footnote, design: .rounded))
				Spacer()
				Text("\(Int(maxAmount))")
					.font(.system(.footnote, design: .rounded))
			}
		}
		.padding(.horizontal)
	}
}

struct LoanFilterView_Previews: PreviewProvider {

	static var previews: some View {
		@State var amount: Double = 0.0

		LoanFilterView(amount: $amount)
	}
}
