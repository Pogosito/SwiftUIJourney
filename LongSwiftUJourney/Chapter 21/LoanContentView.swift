//
//  LoanContentView.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 19.02.2024.
//

import SwiftUI

struct LoanContentView: View {

	@ObservedObject var loanStore = LoanStore()
	@State private var filterEnabled = false
	@State private var maximumLoanAmount = 10000.0

	var body: some View {
		NavigationStack {
			if filterEnabled {
				LoanFilterView(amount: self.$maximumLoanAmount)
					.transition(.opacity)
			}

			List(loanStore.loans) { loan in
				LoanCellView(loan: loan)
					.padding(.vertical, 5)
			}
			.listStyle(.inset)
			.navigationTitle("Kiva Loan")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						withAnimation(.linear) {
							self.filterEnabled.toggle()
							self.loanStore.filterLoans(maxAmount: Int(self.maximumLoanAmount))
						}
					} label: {
						Text("Filter")
							.font(.subheadline)
							.foregroundColor(.primary)
					}
				}
			}
		}
		// task отличается от onAppear, тем что task умеет
		// отменять задау, когда view скрывается
		.task {
			loanStore.fetchLatestLoans()
		}
	}
}

struct LoanContentView_Previews: PreviewProvider {

	static var previews: some View {
		LoanContentView()
	}
}
