//
//  ArticleDetailedViewWithDismissButton.swift
//  LongSwiftUJourney
//
//  Created by Анесян Погос Артурович on 20.12.2023.
//

import SwiftUI

struct ArticleDetailedViewWithDismissButton: View {

	var articleWithContent: ArticleWithContent

	@State private var showAlert = false
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
		.navigationBarBackButtonHidden(true)
		.overlay {
			HStack {
				Spacer()
				VStack {
					Button {
						showAlert = true
					} label: {
						Image(systemName: "chevron.down.circle.fill")
							.font(.largeTitle)
							.foregroundColor(.white)
					}

					Spacer()
				}
				.padding(.trailing, 20)
				.padding(.top, 20)
			}
		}
		.ignoresSafeArea(.all, edges: .top)
		.alert("Warning", isPresented: $showAlert, actions: {
			Button {
				dismiss()
			} label: {
				Text("Confirm")
			}

			Button(role: .cancel, action: {}) {
				Text("Cancel")
			}
		}) {
			Text("Are you sure you want to leave?")
		}
	}
}

struct ArticleDetailedViewWithDismissButton_Preview: PreviewProvider {

	static var previews: some View {
		ArticleDetailedViewWithDismissButton(articleWithContent:  ArticleWithContent(title: "Vision Framework: Working with Text and Image Recognition", author: "Sai Kambampati", rating: 4, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.", image: "vision-framework", content: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps. Everything from text detection to facial detection to barcode scanners to integration with Core ML was covered in this framework.\n\nThis year, at WWDC 2019, Apple released several more new features to this framework that really push the field of computer vision. That’s what we’ll be looking at in this tutorial.\n\nFor many years now, Snapchat has reigned as the popular social media app among teens. With its simple UI and great AR features, high schoolers around the world love to place cat/dog filters themselves. Let’s flip the script!"))
	}
}

