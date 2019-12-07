//
//  AddBtn.swift
//  testRevolut
//
//  Created by Pavle Mijatovic on 07/12/2019.
//  Copyright © 2019 Pavle Mijatovic. All rights reserved.
//

import UIKit

class AddBtn: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }

    private func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.backgroundColor = .blue
    }
}
