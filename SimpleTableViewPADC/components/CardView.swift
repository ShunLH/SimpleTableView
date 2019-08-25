//
//  CardView.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/24/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class CardView : UIView {
	@IBInspectable var cornerRadius : CGFloat = 2
	@IBInspectable var shadowOffsetWidth : Int = 0
	@IBInspectable var shadowOffsetHeight : Int = 3
	@IBInspectable var shadowColor : UIColor? = UIColor.black
	@IBInspectable var shadowOpacity : Float = 0.5
//	@IBInspectable var customColor : UIColor? = UIColor.red
	
	override func layoutSubviews() {
		layer.cornerRadius = cornerRadius
		let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
		layer.masksToBounds = false
		layer.shadowColor = shadowColor?.cgColor
		layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
		layer.shadowOpacity = shadowOpacity
		layer.shadowPath = shadowPath.cgPath
//		layer.backgroundColor = customColor?.cgColor
	}
}
