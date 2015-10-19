//
//  ViewController.swift
//  XHActionSheet
//
//  Created by Sunny on 15/4/29.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pop(sender: AnyObject) {
        view.window?.showPopButtons(["拍照","相册"], closure: nil)
    }
    
}

