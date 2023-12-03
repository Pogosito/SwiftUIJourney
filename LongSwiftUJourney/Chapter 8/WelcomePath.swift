//
//  WelcomePath.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 03.12.2023.
//

import SwiftUI

struct WelcomePath: View {

	var body: some View {
		VStack {
			Path() { path in
				path.move(to: .init(x: 20, y: 20))
				path.addLine(to: .init(x: 300, y: 20))
				path.addLine(to: .init(x: 300, y: 200))
				path.addLine(to: .init(x: 20, y: 200))
			}
			.fill(.green)
			.background(Color.red)

			Path() { path in
				path.move(to: .init(x: 20, y: 20))
				path.addLine(to: .init(x: 300, y: 20))
				path.addLine(to: .init(x: 300, y: 200))
				path.addLine(to: .init(x: 350, y: 200))
				path.closeSubpath()
			}
			.stroke(.red, lineWidth: 10)
			.background(Color.white)

			ZStack {
				Path() { path in
					path.move(to: .init(x: 20, y: 60))
					path.addLine(to: .init(x: 40, y: 60))
					path.addQuadCurve(
						to: .init(x: 210, y: 60),
						control: .init(x: 125, y: 0)
					)
					path.addLine(to: .init(x: 230, y: 60))
					path.addLine(to: .init(x: 230, y: 100))
					path.addLine(to: .init(x: 20, y: 100))
				}
				.fill(Color.purple)

				Path() { path in
					path.move(to: .init(x: 20, y: 60))
					path.addLine(to: .init(x: 40, y: 60))
					path.addQuadCurve(
						to: .init(x: 210, y: 60),
						control: .init(x: 125, y: 0)
					)
					path.addLine(to: .init(x: 230, y: 60))
					path.addLine(to: .init(x: 230, y: 100))
					path.addLine(to: .init(x: 20, y: 100))
					path.closeSubpath()
				}
				.stroke(Color.black, lineWidth: 5)
			}
			.background(Color.gray)
		}
		.background(Color.blue)
	}
}

struct WelcomePath_Previews: PreviewProvider {

	static var previews: some View { WelcomePath() }
}
