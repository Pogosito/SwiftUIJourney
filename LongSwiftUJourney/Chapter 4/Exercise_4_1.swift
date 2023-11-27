//
//  Exercise_4_1.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 27.11.2023.
//

import SwiftUI

struct Exercise_4_1: View {

	var body: some View {
		VStack {
			Header()
			HStack {
				PricingView.makePricingView(
					title: Chap4.Strings.basic,
					price: Chap4.Strings.nineDollars,
					textColor: .white,
					bgColor: .purple
				)
				PricingView.makePricingView(
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

			PricingView.makePricingView(
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
}

struct Exercise_4_1_Preview: PreviewProvider {
	static var previews: some View {
		Exercise_4_1()
	}
}
