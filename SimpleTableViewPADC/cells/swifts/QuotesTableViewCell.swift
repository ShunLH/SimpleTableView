//
//  QuotesTableViewCell.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/18/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {

	@IBOutlet weak var labelQuoteText: UILabel!
	
	@IBOutlet weak var labelAuthorName: UILabel!
	var mQuote : QuotesVO! {
		didSet {
			labelAuthorName.text = mQuote.authorName
			labelQuoteText.text = mQuote.quoteText
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none

	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	
}
