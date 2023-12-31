//
//  RegistrationScreen.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 26.12.2023.
//

import SwiftUI

struct RegistrationScreen: View {

	@State private var username: String = ""
	@State private var password: String = ""
	@State private var confirmation: String = ""

	var body: some View {
		VStack {
			Text("Create an account")
				.font(.system(size: 37, weight: .bold, design: .rounded))
				.padding()
			VStack(alignment: .leading) {
				DividerTextFiled(
					text: $username,
					placeholder: "Username"
				)

				CentredLabel(
					text: "A minimum of 4 characters",
					systemImageName: "xmark.square",
					isStrikeThrough: false
				).padding(.vertical, 20)

				DividerTextFiled(
					text: $password,
					placeholder: "Password",
					isSecure: true
				)

				CentredLabel(
					text: "A minimum of 8 characters",
					systemImageName: "lock.open",
					isStrikeThrough: false
				)
				.padding(.top, 20)

				CentredLabel(
					text: "One uppercase letter",
					systemImageName: "lock.open",
					isStrikeThrough: false
				)
				.padding(.top, 1)
				.padding(.bottom, 20)

				DividerTextFiled(
					text: $confirmation,
					placeholder: "Confirm password",
					isSecure: true
				)

				CentredLabel(
					text: "Your confirm password should be the same as password",
					systemImageName: "xmark.square",
					isStrikeThrough: false
				)
				.padding(.vertical)
				.fixedSize(horizontal: false, vertical: true)
			}
			.padding(30)
			.padding(.bottom, 30)

			Button {
				print("Sign Up")
			} label: {
				Text("Sign Up")
					.font(.system(size: 18, weight: .semibold, design: .rounded))
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, maxHeight: 50)
					.background(
						LinearGradient(
							colors: [.orange, .yellow],
							startPoint: .leading,
							endPoint: .trailing
						)
					)
					.cornerRadius(10)
					.padding(.horizontal, 30)
					.padding(.bottom, 35)
			}

			HStack {
				Text("Already have an account?")
					.font(.system(size: 15, weight: .bold, design: .rounded))
				Button {
					print("Sign In")
				} label: {
					Text("Sign In")
						.font(.system(size: 18, weight: .semibold, design: .rounded))
						.foregroundColor(.orange)
				}
			}

			Spacer()
		}
	}
}

struct RegistrationScreen_Previews: PreviewProvider {

	static var previews: some View {
		RegistrationScreen()
	}
}
