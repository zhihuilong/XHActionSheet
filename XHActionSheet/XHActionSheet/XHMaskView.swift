//
//  XHMaskView.swift
//  XHActionSheet
//
//  Created by Sunny on 15/4/29.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

class XHMaskView:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        self.frame = UIScreen.main.bounds
        alpha = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        window?.dismissPopButton()
    }
}
