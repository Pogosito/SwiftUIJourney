//
//  UserRegistrationViewModel.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 29.12.2023.
//

import SwiftUI

class UserRegistrationViewModel: ObservableObject {

	// Input
	@Published var username: String = ""
	@Published var password: String = ""
	@Published var passwordConfirm: String = ""

	// Output
	@Published var isUsernameLengthValid = false
	@Published var isPasswordLengthValid = false
	@Published var isPasswordCapitalLetter = false
	@Published var isPasswordConfirmValid = false

	init() {
		$username
			.receive(on: DispatchQueue.main)
			.map { username in
				return username.count >= 4
			}
			.assign(to: \.isPasswordLengthValid, on: self)
	}
}
