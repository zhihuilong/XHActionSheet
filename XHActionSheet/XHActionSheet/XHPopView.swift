//
//  XHPopView.swift
//  XHActionSheet
//
//  Created by Sunny on 15/4/29.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

class XHPopView:UIView {
    
    static var textButtonColor = UIColor.black
    static var cancelButtonColor = UIColor.black
    
    var indexClosure:((Int)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.kColor(red: 245, green: 245, blue: 245)
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
        
        for (i,title) in titles.enumerated() {
            let button = UIButton(frame: CGRect(x: 0, y: CGFloat(i) * 50 , width: kViewWidth, height: 50))
            addSubview(button)
            button.tag = i
            button.setTitleColor(XHPopView.textButtonColor, for: .normal)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(whenButtonTouch), for: .touchUpInside)
            //添加小分割线
            let seperateView = UIView(frame: CGRect(x: 0, y: CGFloat(i+1) * 50 + smallSeperateHeight, width: kViewWidth, height: smallSeperateHeight))
            addSubview(seperateView)
            seperateView.backgroundColor = UIColor.aColor(red: 220, green: 220, blue: 220, alpha: 50)
        }
        
        //分割线
        let seperateView = UIView(frame: CGRect(x: 0, y: CGFloat(titles.count) * 50 , width: kViewWidth, height: seperateHeight))
        addSubview(seperateView)
        seperateView.backgroundColor = UIColor.kColor(red: 205, green: 204 , blue: 213 )
        
        //取消按钮
        let cancelButton = UIButton(frame: CGRect(x: 0, y: CGFloat(titles.count) * 50 + seperateHeight, width: kViewWidth, height: 50))
        addSubview(cancelButton)
        cancelButton.setTitleColor(XHPopView.cancelButtonColor, for: .normal)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.addTarget(self, action: #selector(XHPopView.cancel), for: .touchUpInside)
    }
    
    @objc func whenButtonTouch(button:UIButton) {
        window?.dismissPopButton()
        if let closure = indexClosure {
            closure(button.tag)
        } else {
            print("you need assign to closure")
        }
        
    }
    
    @objc func cancel() {
        window?.dismissPopButton()
    }
}
