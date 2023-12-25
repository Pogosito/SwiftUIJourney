//
//  Experiments.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 25.12.2023.
//

import SwiftUI

struct SomeStruct {

	var someValue: Int = 0
}

struct SomeStruct2 {

	@State var someValue: Int = 0
}

class SomeClass: ObservableObject {

	@Published var someValue: Int = 0
}

struct CounterView: View {

	@ObservedObject private var counter: SomeClass = SomeClass()

	var body: some View {
		Button {
			counter.someValue += 1
		} label: {
			Text("Счетчик_42 \(counter.someValue)")
		}
	}
}

struct SomeView: View {

	@State private var counter = 0
	@State private var someProperty: SomeStruct = SomeStruct()
	private var someProperty2: SomeStruct2 = SomeStruct2()
	@ObservedObject private var someProperty3: SomeClass = SomeClass()

	var body: some View {
		VStack {
			Button {
				counter += 1
			} label: {
				Text("Счетчик_1 \(counter)")
			}

			Button {
				someProperty.someValue += 1
			} label: {
				Text("Счетчик_2 \(someProperty.someValue)")
			}

			Button {
				someProperty2.someValue += 1
			} label: {
				Text("Счетчик_3 \(someProperty2.someValue)")
			}

			Button {
				someProperty3.someValue += 1
			} label: {
				Text("Счетчик_4 \(someProperty3.someValue)")
			}

			CounterView()
		}
	}
}

struct SomeView_Previews: PreviewProvider {

	static var previews: some View {
		SomeView()
	}
}
