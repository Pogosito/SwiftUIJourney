//
//  LoanStore.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 19.02.2024.
//

import Foundation

class LoanStore: Decodable, ObservableObject {

	@Published var loans: [Loan] = []
	private var cachedLoans: [Loan] = []

	private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"

	enum CodingKeys: CodingKey {
		case loans
	}

	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		loans = try values.decode([Loan].self, forKey: .loans)
	}

	init() {}

	func fetchLatestLoans() {
		guard let loanUrl = URL(string: Self.kivaLoanURL) else {
			return
		}

		let request = URLRequest(url: loanUrl)
		let task = URLSession.shared.dataTask(
			with: request,
			completionHandler: { (data, response, error) -> Void in

				if let error = error {
					print(error)
					return
				}

				// Parse JSON data
				if let data = data {
					DispatchQueue.main.async {
						self.loans = self.parseJsonData(data: data)
					}
				}
			}
		)
		task.resume()
	}

	func parseJsonData(data: Data) -> [Loan] {
		let decoder = JSONDecoder()

		do {
			let loanStore = try decoder.decode(LoanStore.self, from: data)
			self.loans = loanStore.loans
			cachedLoans = self.loans
		} catch {
			print(error)
		}

		return loans
	}

	func filterLoans(maxAmount: Int) {
		self.loans = self.cachedLoans.filter { $0.amount < maxAmount }
	}
}
