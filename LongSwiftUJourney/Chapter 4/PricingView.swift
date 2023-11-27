//
//  PricingView.swift
//  LongSwiftUJourney
//
//  Created by Pogos Anesyan on 26.11.2023.
//

import SwiftUI

struct SystemImageViewModel {

	let imageSystemName: String

	let foregroundColor: Color

	let size: CGFloat
}

struct InscriptionViewModel {

	let inscription: String

	let yPosition: CGFloat
}

struct PricingView: View {

	var systemImageViewModel: SystemImageViewModel?
	let title: String
	let price: String
	let textColor: Color
	let bgColor: Color
	var inscriptionViewModel: InscriptionViewModel?

	var body: some View {
		ZStack {
			VStack {
				if let systemImageViewModel {
					Image(systemName: systemImageViewModel.imageSystemName)
						.font(.system(size: systemImageViewModel.size))
						.foregroundColor(systemImageViewModel.foregroundColor)
				}

				Text(title)
					.font(.system(.title, design: .rounded))
					.fontWeight(.black)
					.foregroundColor(textColor)
				Text(price)
					.font(.system(size: 40, weight: .heavy, design:.rounded))
					.foregroundColor(textColor)
				Text(Chap4.Strings.perMonth)
					.font(.headline)
					.foregroundColor(textColor)
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
			.padding(40)
			.background(bgColor)
			.cornerRadius(10)

			if let inscriptionViewModel {
				Text(inscriptionViewModel.inscription)
					.font(.system(.caption, design: .rounded))
					.fontWeight(.bold)
					.foregroundColor(.white)
					.padding(5)
					.background(Color(red: 255 / 255, green: 183 / 255, blue: 37 / 255))
					.offset(x: 0, y: inscriptionViewModel.yPosition)
			}
		}
	}

	static func makePricingView(
		systemImageViewModel: SystemImageViewModel? = nil,
		title: String,
		price: String,
		textColor: Color,
		bgColor: Color,
		inscriptionViewModel: InscriptionViewModel? = nil
	) -> some View {
		PricingView(
			systemImageViewModel: systemImageViewModel,
			title: title,
			price: price,
			textColor: textColor,
			bgColor: bgColor,
			inscriptionViewModel: inscriptionViewModel
		)
	}
}
