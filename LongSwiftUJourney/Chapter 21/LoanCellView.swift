//
//  LoanCellView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 19.02.2024.
//

import SwiftUI

struct LoanCellView: View {

	var loan: Loan

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				HStack {
					Text(loan.name)
						.font(.system(.headline, design: .rounded))
					Spacer()
					Text("$\(loan.amount)")
						.font(.system(.title, design: .rounded))
						.bold()
				}
				Text(loan.country)
					.font(.system(.subheadline, design: .rounded))

				Text(loan.use)
					.font(.system(.body, design: .rounded))
			}
			Spacer()
		}.padding(.horizontal)
	}
}

struct LoanCellView_Previews: PreviewProvider {

	static var previews: some View {
		LoanCellView(
			loan: Loan(
				name: "Kokoe",
				country: "Togo",
				use: """
				to buy 25 brooms, 8 bags of palm
				by products and 2 bags of manioc
				flour.
				""",
				amount: 425
			)
		).previewLayout(.sizeThatFits)
	}
}
