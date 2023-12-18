//
//  Exercise_10_1.swift
//  LongSwiftUJourney
//
//  Created by Pogosito on 17.12.2023.
//

import SwiftUI

struct Article: Identifiable {

	let id = UUID()

	let title: String

	let author: String

	let rating: Int

	let excerpt: String

	let image: String
}

struct Exercise_10_1: View {

	var articles = [

		Article(
			title: "The Comprehensive Guide to the State Management in iOS",
			author: "Alexey Naumov",
			rating: 4,
			excerpt: "There are many challenges in the software development, but there isone beast that tends to screw things up much more often than the others:the problem of app’s state management and data propagation.",
			image: "state-management"
		),

		Article(
			title: "Using Swift Protocols to Manage App Configuration",
			author: "Gabriel Theodoropoulos",
			rating: 4,
			excerpt: "Hello and welcome to a new tutorial! One of the most common concepts met and used in Swift by all developers is protocols, and I don’t think there’s even one developer who doesn’t know about them.",
			image: "protocols"
		),

		Article(
			title: "Drawing a Border with Rounded Corners",
			author: "Simon Ng",
			rating: 4,
			excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier.",
			image: "swiftui-button"
		),

		Article(
			title: "Building a Simple Text Editing App",
			author: "Gabriel Theodoropoulos",
			rating: 5,
			excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.",
			image: "macos-programming"
		),

		Article(
			title: "Building a Flutter App with Complex UI",
			author: "Lawrence Tan",
			rating: 4,
			excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial.",
			image: "flutter-app"
		)
	]

	var body: some View {
		List(articles) { article in
			ArticleView(article: article)
		}
		.listStyle(.plain)
	}
}


struct Exercise_10_1_Previews: PreviewProvider {

	static var previews: some View { Exercise_10_1() }
}
