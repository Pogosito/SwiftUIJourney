//
//  ContentView.swift
//  LongSwiftUJourney
//
//  Created by Pogos Anesyan on 26.11.2023.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		VStack {
			Header()
			HStack {
				makePricingView(
					title: Chap4.Strings.basic,
					price: Chap4.Strings.nineDollars,
					textColor: .white,
					bgColor: .purple
				)
				makePricingView(
					title: Chap4.Strings.pro,
					price: Chap4.Strings.nineDollars,
					textColor: .black,
					bgColor: Chap4.Colors.proGray,
					inscriptionViewModel: .init(
						inscription: Chap4.Strings.bestForDesigners,
						yPosition: 87
					)
				)
			}
			.padding()

			makePricingView(
				systemImageViewModel: .init(
					imageSystemName: Chap4.SystemIconNames.wandAndRays,
					foregroundColor: .white,
					size: 30
				),
				title: Chap4.Strings.team,
				price: Chap4.Strings.twoHundredNinetyNine,
				textColor: .white,
				bgColor: Chap4.Colors.teamBackgroundColor,
				inscriptionViewModel: .init(
					inscription: Chap4.Strings.perfectForTeamWith20Members,
					yPosition: 108
				)
			)
			.padding(.horizontal)

			Spacer()
		}
	}

	func makePricingView(
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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
