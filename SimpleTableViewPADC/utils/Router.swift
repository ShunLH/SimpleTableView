//
//  Router.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/18/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
import UIKit

//navigation

//1. storyboard initialize

extension UIViewController{
	func navigateToQuotesDetails(quoteData:QuotesVO){
		let storyBoard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyBoard.instantiateViewController(withIdentifier: STORY_ID_QUOTES_DETAILS) as? QuotesDetailsViewController
		vc?.mData = quoteData
		if let viewController = vc {
			self.navigationController?.pushViewController(viewController, animated: true)
		}
		
	}
}
