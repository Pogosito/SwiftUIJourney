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
			HStack {
				Path() { path in
					path.move(to: .init(x: 20, y: 20))
					path.addLine(to: .init(x: 150, y: 20))
					path.addLine(to: .init(x: 150, y: 200))
					path.addLine(to: .init(x: 20, y: 200))
				}
				.fill(.green)
				.background(Color.red)
				
				Path { path in
					path.move(to: .init(x: 100, y: 100))
					path.addArc(
						center: .init(x: 100, y: 100),
						radius: 50,
						startAngle: .degrees(0),
						endAngle: .degrees(90),
						clockwise: true
					)
				}
				.fill(.orange)
				.background(Color.green)
			}

			HStack {
				Path() { path in
					path.move(to: .init(x: 20, y: 20))
					path.addLine(to: .init(x: 100, y: 20))
					path.addLine(to: .init(x: 40, y: 200))
					path.addLine(to: .init(x: 80, y: 200))
					path.closeSubpath()
				}
				.stroke(.red, lineWidth: 10)
				.background(Color.white)

				ZStack {
					Path { path in
						path.move(to: .init(x: 80, y: 80))
						path.addArc(
							center: .init(x: 80, y: 80),
							radius: 40,
							startAngle: .degrees(360),
							endAngle: .degrees(190),
							clockwise: true
						)
					}
					.fill(.yellow)

					Path { path in
						path.move(to: .init(x: 80, y: 80))
						path.addArc(
							center: .init(x: 80, y: 80),
							radius: 40,
							startAngle: .degrees(190),
							endAngle: .degrees(110),
							clockwise: true
						)
					}
					.fill(.teal)

					Path { path in
						path.move(to: .init(x: 80, y: 80))
						path.addArc(
							center: .init(x: 80, y: 80),
							radius: 40,
							startAngle: .degrees(110),
							endAngle: .degrees(90),
							clockwise: true
						)
					}
					.fill(.blue)

					Path { path in
						path.move(to: .init(x: 80, y: 80))
						path.addArc(
							center: .init(x: 80, y: 80),
							radius: 40,
							startAngle: .degrees(90),
							endAngle: .degrees(0),
							clockwise: true
						)
					}
					.fill(.red)
					.offset(x: 5, y: 5)
					.overlay(
						Text("25%")
							.font(.system(size: 10))
							.bold()
							.foregroundColor(.white)
							.offset(x: 0, y: -30)
					)
				}
				.background(Color.purple)

				ZStack {
					Circle()
						.trim(from: 0, to: 0.1)
						.stroke(Color(.systemGray), lineWidth: 10)
						.padding()

					Circle()
						.trim(from: 0.1, to: 0.4)
						.stroke(Color(.yellow), lineWidth: 10)
						.padding()

					Circle()
						.trim(from: 0.4, to: 0.7)
						.stroke(Color(.purple), lineWidth: 10)
						.padding()

					Circle()
						.trim(from: 0.7, to: 1)
						.stroke(Color(.brown), lineWidth: 15)
						.padding()
				}
				.background(Color.orange)
			}

			HStack {
				VStack {
					ZStack {
						Path() { path in
							path.move(to: .init(x: 10, y: 60))
							path.addLine(to: .init(x: 20, y: 60))
							path.addQuadCurve(
								to: .init(x: 180, y: 60),
								control: .init(x: 95, y: 0)
							)
							path.addLine(to: .init(x: 190, y: 60))
							path.addLine(to: .init(x: 190, y: 100))
							path.addLine(to: .init(x: 10, y: 100))
						}
						.fill(Color.purple)
						
						Path() { path in
							path.move(to: .init(x: 10, y: 60))
							path.addLine(to: .init(x: 20, y: 60))
							path.addQuadCurve(
								to: .init(x: 180, y: 60),
								control: .init(x: 95, y: 0)
							)
							path.addLine(to: .init(x: 190, y: 60))
							path.addLine(to: .init(x: 190, y: 100))
							path.addLine(to: .init(x: 10, y: 100))
							path.closeSubpath()
						}
						.stroke(Color.black, lineWidth: 5)

						Button {
							print("Shaped button")
						} label: {
							Text("Button")
								.frame(width: 200, height: 30)
								.foregroundColor(Color.white)
								.background(Dome().fill(.red))
						}

						PlayButton(circleRadus: 70)
							.offset(x: 0, y: 80)
					}
					.background(Color.gray)
				}

				ZStack {
					Path() { path in
						path.move(to: .init(x: 10, y: 20))
						path.addQuadCurve(to: .init(x: 190, y: 20), control: .init(x: 80, y: 7))
						path.addLine(to: .init(x: 190, y: 50))
						path.addLine(to: .init(x: 10, y: 50))
					}
					.fill(.black)
					.background(Color.teal)

					Path() { path in
						path.addRect(
							.init(
								origin: .init(x: 50, y: 40),
								size: .init(width: 100, height: 100)
							)
						)
					}

					ProgressView()
						.offset(x: 0, y: 90)
				}
			}
		}
		.background(Color.blue)
	}
}

struct WelcomePath_Previews: PreviewProvider {

	static var previews: some View { WelcomePath() }
}
