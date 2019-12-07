//
//  UIStoryboard+Extension.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    static var addCurrencyTVC: AddCurrencyTVC { return UIStoryboard.main.instantiateViewController(withIdentifier: "AddCurrencyTVC_ID") as! AddCurrencyTVC }
}
