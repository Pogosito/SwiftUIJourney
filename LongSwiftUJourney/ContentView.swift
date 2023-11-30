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
			Spacer()
			Group {
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

			Spacer()

			Group {
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

				Button {
					print("Delete button tapped 4")
				} label: {
					Label(title: {
						Text("Delete")
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

			Spacer()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
