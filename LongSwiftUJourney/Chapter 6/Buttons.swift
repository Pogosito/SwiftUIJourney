//
//  Buttons.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 30.11.2023.
//

import SwiftUI

struct Buttons: View {

	var body: some View {
		ScrollView {
			Spacer()
			Group {

				makeHeader(with: "Exercise")

				Button {
					print("Cross button tapped")
				} label: {
					Image(systemName: "plus")
						.foregroundColor(Color.white)
						.padding(20)
						.background(Color.purple)
						.font(.system(size: 50))
						.clipShape(Circle())
				}
				.buttonStyle(RotationButtonStyle())

				makeHeader(with: "Just text button")

				HStack {
					Button {
						print("Hello world tapped")
					} label: {
						Text("Hello world")
							.padding()
							.background(Color.purple)
							.foregroundColor(.white)
							.font(.title)
					}

					Button {
						print("Hello world 2")
					} label: {
						Text("Hello world 2")
							.foregroundColor(.purple)
							.font(.title)
							.padding()
							.border(Color.purple, width: 5)
					}
				}

				HStack {
					Button {
						print("Hello world 3")
					} label: {
						Text("Hello world 3")
							.fontWeight(.bold)
							.foregroundColor(.white)
							.font(.title)
							.padding()
							.background(Color.purple)
							.padding(10)
							.border(Color.purple, width: 5)
					}

					Button {
						print("Hello world 4")
					} label: {
						Text("Hello world 4")
							.fontWeight(.bold)
							.foregroundColor(.white)
							.font(.title)
							.padding()
							.background(Color.purple)
							.cornerRadius(40)
							.padding(10)
							.overlay {
								RoundedRectangle(cornerRadius: 40)
									.stroke(.purple, lineWidth: 5)
							}
					}
				}
			}
			.frame(maxWidth: .infinity)

			Group {

				makeHeader(with: "With images")

				Spacer(minLength: 20)

				HStack {
					Button {
						print("Delete button tapped 1")
					} label: {
						Image(systemName: "trash")
							.font(.largeTitle)
							.foregroundColor(.red)
					}

					Button {
						print("Delete button tapped 2")
					} label: {
						Image(systemName: "trash")
							.padding()
							.font(.largeTitle)
							.foregroundColor(.white)
							.background(Color.red)
							.clipShape(Circle())
					}

					Button {
						print("Delete button tapped 3")
					} label: {
						HStack {
							Image(systemName: "trash")
								.font(.title)
								.foregroundColor(.white)
							Text("Delete")
								.fontWeight(.semibold)
								.foregroundColor(.white)
								.font(.title)
						}
						.padding()
						.background(Color.red)
						.clipShape(Capsule())
					}
				}

				Button {
					print("Delete button tapped 4")
				} label: {
					Label(title: {
						Text("Delete with label")
							.fontWeight(.semibold)
							.font(.title)
					}, icon: {
						Image(systemName: "trash")
							.font(.title)
					})
					.foregroundColor(.white)
					.padding()
					.background(Color.blue)
					.clipShape(Capsule())
				}
			}

			Group {
				makeHeader(with: "Gradient + shadows")

				HStack {
					Button {
						print("Delete button tapped 5")
					} label: {
						makeDeleteLabel()
						.background(
							LinearGradient(
								colors: [Color.red, Color.blue],
								startPoint: .leading,
								endPoint: .trailing
							)
						)
					}
					.clipShape(Capsule())

					Button {
						print("Delete button tapped 6")
					} label: {
						makeDeleteLabel()
						.background(
							LinearGradient(
								colors: [
									Color("DarkGreen"),
									Color("LightGreen")
								],
								startPoint: .top,
								endPoint: .bottom
							)
						)
					}
					.clipShape(Capsule())
					.shadow(color: .black, radius: 10, x: 20, y: 20)
				}
			}

			Group {
				makeHeader(with: "Experiment with sizes")

				Spacer(minLength: 20)

				Button {
					print("Delete button tapped 7")
				} label: {
					HStack {
						Image(systemName: "trash")
							.font(.title)
						Text("Delete")
							.fontWeight(.semibold)
							.font(.title)
					}
				}
				.foregroundColor(Color.white)
				.padding()
				.frame(maxWidth: .infinity)
				.background(Color.gray)
				.clipShape(Capsule())
				.padding()
			}

			Group {
				makeHeader(with: "Experiment GradientButtonStyle")

				VStack {
					makeDeleteButton(
						with: "Share",
						imageName: "square.and.arrow.up"
					)

					makeDeleteButton(
						with: "Edit",
						imageName: "square.and.pencil"
					)

					makeDeleteButton(
						with: "Delete",
						imageName: "trash"
					)
				}
			}
		}
		.frame(maxWidth: .infinity)
	}

	func makeDeleteLabel() -> some View {
		Label {
			Text("Delete")
				.fontWeight(.semibold)
				.font(.title)
		} icon: {
			Image(systemName: "trash")
				.font(.title)
		}
		.foregroundColor(Color.white)
		.padding()
	}

	func makeDeleteButton(
		with text: String,
		imageName: String
	) -> some View {
		Button {
			print("Delete button tapped 8")
		} label: {
			Label(title: {
				Text(text)
					.fontWeight(.semibold)
					.font(.title)
			}, icon: {
				Image(systemName: imageName)
					.font(.title)
			})
		}
		.buttonStyle(GradientButtonStyle())
	}

	func makeHeader(
		with text: String
	) -> some View {
		HStack {
			Text(text)
				.fontWeight(.bold)
				.font(.system(size: 40))
				.padding(.leading)
			Spacer()
		}
	}
}

struct Buttons_Preview: PreviewProvider {

	static var previews: some View {
		Buttons()
	}
}
