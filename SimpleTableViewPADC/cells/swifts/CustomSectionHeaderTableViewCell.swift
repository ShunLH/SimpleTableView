//
//  CustomSectionHeaderTableViewCell.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/24/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class CustomSectionHeaderTableViewCell: UITableViewCell {

	@IBOutlet weak var labelBookName: UILabel!
	@IBOutlet weak var labelAuthorName: UILabel!
	var mData : String! {
		didSet {
			labelAuthorName.text = mData
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
