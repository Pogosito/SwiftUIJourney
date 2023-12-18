//
//  ArticleView.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 18.12.2023.
//

import SwiftUI

struct ArticleView: View {

	var article: Article

	var body: some View {

		VStack(alignment: .leading) {
			Image(article.image)
				.resizable()
				.frame(height: 230)
				.clipShape(RoundedRectangle(cornerRadius: 5))

			Text(article.title)
				.font(.system(size: 28, weight: .heavy, design: .rounded))
				.padding(.bottom, 2)

			Text("by\(article.author)".uppercased())
				.foregroundStyle(.gray)
				.font(.system(.footnote, design: .default, weight: .light))
				.padding(.bottom, 2)

			HStack {
				ForEach(0..<article.rating, id: \.self) { _ in
					Image(systemName: "star.fill")
						.font(.caption)
						.foregroundColor(.yellow)
				}

				Spacer()
			}
			.padding(.bottom, 2)

			Text(article.excerpt)
				.font(.subheadline)
				.foregroundColor(.secondary)
		}
	}
}
