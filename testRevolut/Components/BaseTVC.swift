//
//  BaseTVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class BaseTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideFooterView()
    }
    
    private func hideFooterView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.tableFooterView!.isHidden = true
    }
}
