//
//  ListForEachIdentifiable.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 11.12.2023.
//

import SwiftUI

struct ListForEachIdentifiable: View {

	var body: some View {
		List {
			Text("Item 1")
			Text("Item 2")
			Text("Item 3")
			Text("Item 4")
		}
	}
}

struct ListForEachIdentifiable_Previews: PreviewProvider {

	static var previews: some View {
		ListForEachIdentifiable()
	}
}
