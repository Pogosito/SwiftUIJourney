//
//  Exercise_4_2.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 27.11.2023.
//

import SwiftUI

struct Exercise_4_2: View {

	var body: some View {
		ZStack {
			PricingView.makePricingView(
				systemImageViewModel: .init(
					imageSystemName: Chap4.SystemIconNames.wandAndRays,
					foregroundColor: .white,
					size: 30
				),
				title: Chap4.Strings.team,
				price: Chap4.Strings.twoHundredNinetyNine,
				textColor: .white,
				bgColor: Chap4.Colors.teamBackgroundColor
			)
			.padding(.horizontal, 40)
			.offset(x: 0, y: -190)
			.zIndex(2)

			PricingView.makePricingView(
				systemImageViewModel: .init(
					imageSystemName: Chap4.SystemIconNames.burstFill,
					foregroundColor: .white,
					size: 30
				),
				title: Chap4.Strings.pro,
				price: Chap4.Strings.nineteenDollars,
				textColor: .white,
				bgColor: .yellow
			)
			.padding(.horizontal, 30)
			.zIndex(1)

			PricingView.makePricingView(
				systemImageViewModel: .init(
					imageSystemName: Chap4.SystemIconNames.burstFill,
					foregroundColor: .white,
					size: 30
				),
				title: Chap4.Strings.basic,
				price: Chap4.Strings.nineDollars,
				textColor: .white,
				bgColor: .purple
			)
			.padding(.horizontal, 20)
			.offset(x: 0, y: 190)
			.zIndex(0)
		}
	}
}

struct Exercise_4_2_Preview: PreviewProvider {

	static var previews: some View {
		Exercise_4_2()
	}
}
