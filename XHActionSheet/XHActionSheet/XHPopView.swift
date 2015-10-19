//
//  XHPopView.swift
//  XHActionSheet
//
//  Created by Sunny on 15/4/29.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

class XHPopView:UIView {
    
    static var textButtonColor = UIColor.blackColor()
    static var cancelButtonColor = UIColor.blackColor()
    
    var indexClosure:((Int)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.kColor(245, green: 245, blue: 245)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews(titles:[String]) {
        //计算控件个数
        let count = titles.count + 1
        let seperateHeight:CGFloat = 6
        let smallSeperateHeight:CGFloat = 0.5
        
        frame = CGRect(x: 0, y: kViewHeight, width: kViewWidth, height: 50 * CGFloat(count) + seperateHeight)
        
        for var i = 0; i < titles.count; ++i {
            let button = UIButton(frame: CGRect(x: 0, y: CGFloat(i) * 50 , width: kViewWidth, height: 50))
            addSubview(button)
            button.tag = i
            button.setTitleColor(XHPopView.textButtonColor, forState: UIControlState.Normal)
            button.setTitle(titles[i], forState: UIControlState.Normal)
            button.addTarget(self, action: Selector("whenButtonTouch:"), forControlEvents: UIControlEvents.TouchUpInside)
            //添加小分割线
            let seperateView = UIView(frame: CGRect(x: 0, y: CGFloat(i+1) * 50 + smallSeperateHeight, width: kViewWidth, height: smallSeperateHeight))
            addSubview(seperateView)
            seperateView.backgroundColor = UIColor.aColor(220, green: 220, blue: 220, alpha: 50)
        }
        
        //分割线
        let seperateView = UIView(frame: CGRect(x: 0, y: CGFloat(titles.count) * 50 , width: kViewWidth, height: seperateHeight))
        addSubview(seperateView)
        seperateView.backgroundColor = UIColor.kColor(205, green: 204 , blue: 213 )
        
        //取消按钮
        let cancelButton = UIButton(frame: CGRect(x: 0, y: CGFloat(titles.count) * 50 + seperateHeight, width: kViewWidth, height: 50))
        addSubview(cancelButton)
        cancelButton.setTitleColor(XHPopView.cancelButtonColor, forState: UIControlState.Normal)
        cancelButton.setTitle("取消", forState: UIControlState.Normal)
        cancelButton.addTarget(self, action: Selector("cancel"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func whenButtonTouch(button:UIButton) {
        window?.dismissPopButton()
        if let closure = indexClosure {
            closure(button.tag)
        } else {
            print("you need assign to closure")
        }
        
    }
    
    func cancel() {
        window?.dismissPopButton()
    }
}