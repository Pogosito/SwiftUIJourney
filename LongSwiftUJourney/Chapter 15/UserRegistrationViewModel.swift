//
//  UserRegistrationViewModel.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 29.12.2023.
//

import SwiftUI
import Combine

// $ for Published get Publisher
// $ for @Sate get Binding
// $ for @ObservedObject get Wrapper which we use for crateting bindings
class UserRegistrationViewModel: ObservableObject {

	// Input
	@Published var username: String = ""
	@Published var password: String = ""
	@Published var passwordConfirm: String = ""

	private var cancellableSet: Set<AnyCancellable> = []

	// Output
	@Published var isUsernameLengthValid = false
	@Published var isPasswordLengthValid = false
	@Published var isPasswordCapitalLetter = false
	@Published var isPasswordConfirmValid = false

	init() {

		$username
			.receive(on: DispatchQueue.main)
			.map { username in return username.count >= 4 }
			.assign(to: \.isUsernameLengthValid, on: self)
			.store(in: &cancellableSet)

		$password
			.receive(on: DispatchQueue.main)
			.map { password in return password.count >= 8 }
			.assign(to: \.isPasswordLengthValid, on: self)
			.store(in: &cancellableSet)

		$password
			.receive(on: DispatchQueue.main)
			.map { password in
				let pattern = "[A-Z]"
				if let _ = password.range(
					of: pattern,
					options: .regularExpression
				) {
					return true
				} else {
					return false
				}
			}
			.assign(to: \.isPasswordCapitalLetter, on: self)
			.store(in: &cancellableSet)

		Publishers.CombineLatest($password, $passwordConfirm)
			.receive(on: DispatchQueue.main)
			.map { (password, passwordConfirm) in
				return !passwordConfirm.isEmpty && (passwordConfirm == password)
			}
			.assign(to: \.isPasswordConfirmValid, on: self)
			.store(in: &cancellableSet)
	}
}
