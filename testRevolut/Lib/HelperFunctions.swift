//
//  HelperFunctions.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 14/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import Foundation

func aprint(_ any: Any, function: String = #function, file: String = #file, line: Int = #line) {
    let fileName = file.lastPathComponent
    print("🍏\(any)- - - - - - - - - - - - - - - - - - - - - \(fileName!) || \(function) || \(line)")
}

extension String {
    var ns: NSString {
        return self as NSString
    }
    var pathExtension: String? {
        return ns.pathExtension
    }
    var lastPathComponent: String? {
        return ns.lastPathComponent
    }
}
