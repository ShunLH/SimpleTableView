//
//  QuotesDetailsViewController.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/18/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class QuotesDetailsViewController: UIViewController {

	@IBOutlet weak var labelQuoteText: UILabel!
	
	@IBOutlet weak var labelAuthorName: UILabel!
	
	var mData : QuotesVO!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		labelQuoteText.text = mData.quoteText
		labelAuthorName.text = mData.authorName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
