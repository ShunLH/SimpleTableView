//
//  Extensions.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/24/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
	func registerForCell(strID:String){
		register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
		
	}
}

