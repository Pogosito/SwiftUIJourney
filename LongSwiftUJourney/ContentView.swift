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
					title: Chap4Strings.basic,
					price: Chap4Strings.nineDollars,
					textColor: .white,
					bgColor: .purple
				)
				makePricingView(
					title: Chap4Strings.pro,
					price: Chap4Strings.nineDollars,
					textColor: .black,
					bgColor: Chap4Colors.proGray,
					inscriptionViewModel: .init(
						inscription: Chap4Strings.bestForDesigners,
						yPosition: 87
					)
				)
			}
			.padding()

			makePricingView(
				systemImageViewModel: .init(
					imageSystemName: Chap4Strings.wandAndRaysIconName,
					foregroundColor: .white,
					size: 30
				),
				title: Chap4Strings.team,
				price: Chap4Strings.twoHundredNinetyNine,
				textColor: .white,
				bgColor: Chap4Colors.teamBackgroundColor,
				inscriptionViewModel: .init(
					inscription: Chap4Strings.perfectForTeamWith20Members,
					yPosition: 108
				)
			)
			.padding(.horizontal)
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
