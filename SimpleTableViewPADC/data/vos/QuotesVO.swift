//
//  File.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/18/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation

class QuotesVO {
	var quoteText : String = ""
	var authorName : String = ""
	
	init(quoteText:String,authorName:String) {
		self.quoteText = quoteText
		self.authorName = authorName
	}
}

extension QuotesVO {
	static func getQuotes() -> [QuotesVO] {
		return [
			.init(quoteText: "To go wrong in one's own way is better than to go right in someone else's.",authorName: "Fyodor Dostoevsky"),
			.init(quoteText: "Two things are infinite: the universe and human stupidity; and I am not sure about the universe.",authorName: "Albert Einstein"),
			.init(quoteText: "Design is not just what it look like and feel like.Design is how it works.", authorName: "Steve Jobs"),
			.init(quoteText: "The journey of a thousand miles begins with a single step.", authorName: "Lao Tzu")
		]
	}
	
	static func getQuoteGrouped() -> [String:[QuotesVO]]{
		
		return [
			"Albert Einstein" :[.init(quoteText: "Two things are infinite: the universe and human stupidity; and I am not sure about the universe.",authorName: "Albert Einstein")],
			"Fyodor Dostoevsky" :[.init(quoteText: "To go wrong in one's own way is better than to go right in someone else's.",authorName: "Fyodor Dostoevsky")],
			"Lao Tzu" :[.init(quoteText: "The journey of a thousand miles begins with a single step.",authorName: "Lao Tzu")],
			"Steve Jobs" :[.init(quoteText: "Design is not just what it look like and feel like.Design is how it works.",authorName: "Steve Jobs")]
		]
	}
}

