//
//  HeaderTestViewController.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/24/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class HeaderTestViewController: UIViewController {

	private var tableHeaderViewHeight : CGFloat = 0.0
	private var tableHeaderViewCutaway : CGFloat = 40.0
	
	var headerView : CustomTableHeaderView!
	var headerMaskLayer : CAShapeLayer!
	
	@IBOutlet weak var tableViewAuthors: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableHeaderViewHeight = self.view.frame.width * (3/4)
		tableViewAuthors.delegate = self
		tableViewAuthors.dataSource = self
		initCustomHeader()
		updateHeaderView()
		
    }
	
	func initCustomHeader() {
		headerView = tableViewAuthors.tableHeaderView as? CustomTableHeaderView
		tableViewAuthors.tableHeaderView = nil
		tableViewAuthors.addSubview(headerView)
		//for stretchy effect
		tableViewAuthors.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left: 0, bottom: 0, right: 0)
		tableViewAuthors.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight+64)
		
		// cut away the header view
		headerMaskLayer = CAShapeLayer()
		headerMaskLayer.fillColor = UIColor.black.cgColor
		headerView.layer.mask = headerMaskLayer
		
		let effectiveHeight = tableHeaderViewHeight - tableHeaderViewCutaway/2
		tableViewAuthors.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
		tableViewAuthors.contentOffset = CGPoint(x:0,y:-effectiveHeight)
	}
	
	func updateHeaderView(){
		let effectiveHeight = tableHeaderViewHeight - tableHeaderViewCutaway/2
		var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableViewAuthors.bounds.width, height: tableHeaderViewHeight)
		
		if tableViewAuthors.contentOffset.y < -effectiveHeight {
			headerRect.origin.y = tableViewAuthors.contentOffset.y
			headerRect.size.height = -tableViewAuthors.contentOffset.y + tableHeaderViewCutaway/2
		}
		
		headerView.frame = headerRect
		
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: 0))
		path.addLine(to: CGPoint(x: headerRect.width, y: 0))
		path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
		path.addLine(to: CGPoint(x: 0, y: headerRect.height - tableHeaderViewCutaway))
		
		headerMaskLayer?.path = path.cgPath
	}
    
}
extension HeaderTestViewController : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "headerTestCell", for: indexPath)
		return cell
	}
	
	
}
extension HeaderTestViewController : UITableViewDelegate{
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		updateHeaderView()
	}
	
}
