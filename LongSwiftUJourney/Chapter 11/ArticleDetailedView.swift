//
//  ArticleDetailedView.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 18.12.2023.
//

import SwiftUI

struct ArticleDetailedView: View {

	var articleWithContent: ArticleWithContent
	@Environment(\.dismiss) var dismiss

	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Image(articleWithContent.image)
					.resizable()
					.aspectRatio(contentMode: .fit)

				Text(articleWithContent.title)
					.font(.system(size: 28, weight: .heavy, design: .rounded))
					.padding(.bottom, 2)
					.padding(.leading, 20)
	
				Text("by \(articleWithContent.author)".uppercased())
					.foregroundStyle(.gray)
					.font(.system(.footnote, design: .default, weight: .light))
					.padding(.bottom, 10)
					.padding(.leading, 20)

				Text(articleWithContent.content)
					.font(.body)
					.padding()
					.lineLimit(1000)
					.multilineTextAlignment(.leading)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.ignoresSafeArea(.all, edges: .top)
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					dismiss()
				} label: {
					Image(systemName: "chevron.left.circle.fill")
						.font(.largeTitle)
						.foregroundColor(.white)
				}
			}
		}
	}
}

struct ArticleDetailedView_Previews: PreviewProvider {

	static var previews: some View {
		ArticleDetailedView(articleWithContent:  ArticleWithContent(title: "Vision Framework: Working with Text and Image Recognition", author: "Sai Kambampati", rating: 4, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.", image: "vision-framework", content: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps. Everything from text detection to facial detection to barcode scanners to integration with Core ML was covered in this framework.\n\nThis year, at WWDC 2019, Apple released several more new features to this framework that really push the field of computer vision. That’s what we’ll be looking at in this tutorial.\n\nFor many years now, Snapchat has reigned as the popular social media app among teens. With its simple UI and great AR features, high schoolers around the world love to place cat/dog filters themselves. Let’s flip the script!"))
	}
}
