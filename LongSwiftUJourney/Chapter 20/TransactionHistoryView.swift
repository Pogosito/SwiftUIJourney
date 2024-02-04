//
//  TransactionHistoryView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 29.01.2024.
//

import SwiftUI

struct TransactionHistoryView: View {

	var transactions: [Transaction]

	var body: some View {
		VStack(alignment: .leading) {
			Text("Transaction History")
				.font(.system(size: 25, weight: .black, design: .rounded))
				.padding()

			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 30) {
					ForEach(transactions) { transaction in
						TransactionView(transaction: transaction)
					}
				}
				.padding()
			}
		}
	}
}
