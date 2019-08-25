//
//  ViewController.swift
//  SimpleTableViewPADC
//
//  Created by AcePlus Admin on 8/18/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

//var mData : [QuotesVO] = QuotesVO.getQuotes()

class ViewController: UIViewController {

	@IBOutlet weak var simpleTableView: UITableView!
	var mData : [String:[QuotesVO]] = QuotesVO.getQuoteGrouped()
	var authors : [String] {
		return mData.keys.sorted()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		simpleTableView.delegate = self
		simpleTableView.dataSource = self
//		let cellNib = UINib(nibName: String(describing: QuotesTableViewCell.self), bundle: nil)
//		simpleTableView.register(cellNib, forCellReuseIdentifier: String(describing: QuotesTableViewCell.self))
//		let headerNib = UINib(nibName: String(describing: CustomSectionHeaderTableViewCell.self), bundle: nil)
//		simpleTableView.register(headerNib, forCellReuseIdentifier: String(describing: CustomSectionHeaderTableViewCell.self))
		simpleTableView.registerForCell(strID: String(describing: QuotesTableViewCell.self))
		simpleTableView.registerForCell(strID: String(describing: CustomSectionHeaderTableViewCell.self))
	}


}

extension ViewController : UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return authors.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let key = authors[section]
		return mData[key]!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuotesTableViewCell.self), for: indexPath) as! QuotesTableViewCell
//		cell.mQuote = mData[indexPath.row]
		let key = authors[indexPath.section]
		cell.mQuote = mData[key]?[indexPath.row]
		return cell
	}
	
	
}

extension ViewController : UITableViewDelegate{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let key = authors[indexPath.section]
		if let data = mData[key]?[indexPath.row] {
			navigateToQuotesDetails(quoteData: data)

		}
	}
//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		let authorName = authors[section]
//		return "\(authorName)"
//	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionHeaderTableViewCell.self)) as! CustomSectionHeaderTableViewCell
		cell.mData = authors[section]
		return cell.contentView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionHeaderTableViewCell.self))
		return cell?.bounds.height ?? 0
	}
	
//	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//		return true
//	}
	
	
	func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let edit = UIContextualAction(style: .normal, title: "Edit"){
			(action,view,actionPerformed: (Bool) -> ()) in
				actionPerformed(true)
		
			let key = self.authors[indexPath.section]
			if let data = self.mData[key]?[indexPath.row] {
				self.navigateToQuotesDetails(quoteData: data)
				
			}
			
		}
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
			(action,view,actionPerformed: (Bool) -> ()) in
			actionPerformed(true)
			let key = self.authors[indexPath.section]
			let dataToRemove = self.mData[key]?[indexPath.row]
			if let obj = dataToRemove {
				let objToRemoveIndex = self.mData[key]?.firstIndex(where: {(data) -> Bool in
					return data.quoteText == obj.quoteText
				})
				
				self.mData[key]?.remove(at: objToRemoveIndex!)
				//				self.mData[key]?.remove(at: indexPath.row)
				if self.mData[key]?.count == 0 {
					self.mData[key] = nil
				}
				
				tableView.reloadData()
			}
			
		}
		edit.image = #imageLiteral(resourceName: "icons8-pencil")
		edit.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
//		deleteAction.image = #imageLiteral(resourceName: "icons8-delete")
//		deleteAction.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
		return UISwipeActionsConfiguration(actions: [edit,deleteAction])
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		return UISwipeActionsConfiguration()
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == .delete){
			let key = self.authors[indexPath.section]
			let dataToRemove = self.mData[key]?[indexPath.row]
			if let obj = dataToRemove {
				let objToRemoveIndex = self.mData[key]?.firstIndex(where: {(data) -> Bool in
					return data.quoteText == obj.quoteText
				})

				self.mData[key]?.remove(at: objToRemoveIndex!)
//				self.mData[key]?.remove(at: indexPath.row)
				if self.mData[key]?.count == 0 {
					self.mData[key] = nil
				}
				
				tableView.reloadData()
			}
		}
	}
}

