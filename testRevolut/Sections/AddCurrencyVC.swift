//
//  AddCurrencyVC.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class AddCurrencyVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var addCurrencyBtn: AddBtn!
    @IBOutlet weak var addCurrencyTxtBtn: UIButton!
    @IBOutlet weak var addCurrencyInfoLbl: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addCurrency(_ sender: Any) {
        print("Add.....")
    }
    
    // MARK: - Helper

}
