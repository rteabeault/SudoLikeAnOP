//
//  PasswordListController.swift
//  SudoLikeAnOP
//
//  Created by Russell Teabeault on 11/21/18.
//  Copyright © 2018 Russell Teabeault. All rights reserved.
//

import Cocoa

class PasswordListController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
    let passwords = ["Gnip Sudo", "Synology Sudo", "Your mother"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        tableView.delegate = self
        tableView.dataSource = self
        // Do view setup here.
        tableView.reloadData()

    }
}

extension PasswordListController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        print("Getting number of rows")
        return passwords.count
    }
}

extension PasswordListController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "PasswordCellID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
//        var image: NSImage?
        var text: String = ""
        var cellIdentifier: String = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        
        let item = passwords[row]
        
        if tableColumn == tableView.tableColumns[0] {
            text = item
            cellIdentifier = CellIdentifiers.NameCell
        }
        
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
//            cell.imageView?.image = image ?? nil
            return cell
        }
        return nil
    }
    
}
