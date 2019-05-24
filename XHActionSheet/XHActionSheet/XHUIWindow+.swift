//
//  XHUIWindow+.swift
//  XHActionSheet
//
//  Created by Sunny on 15/4/29.
//  Copyright (c) 2015年 sunny. All rights reserved.
//

import UIKit

extension UIColor {
    class func kColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    class func aColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

let kViewWidth:CGFloat     = UIScreen.main.bounds.size.width
let kViewHeight:CGFloat    = UIScreen.main.bounds.size.height

extension UIWindow {
    
    //弹出popView
    func showPopButtons(titles:[String],closure:((Int)->Void)? ) {
        let maskView = XHMaskView(frame: .zero)
        self.addSubview(maskView)
        let popView = XHPopView(frame: .zero)
        self.addSubview(popView)
        popView.indexClosure = closure
        popView.setupSubViews(titles: titles)
        UIView.animate(withDuration: 0.3, animations: {
            maskView.alpha = 0.3
            popView.frame = CGRect(x: 0, y: kViewHeight - popView.frame.height, width: kViewWidth, height: popView.frame.height)
        })
    }
    
    //消失popView
    func dismissPopButton() {
        let count = self.subviews.count
        let maskView = self.subviews[count-2] as! XHMaskView
        let popView = self.subviews[count-1] as! XHPopView
        UIView.animate(withDuration: 0.3, animations: {
            maskView.alpha = 0
            popView.frame = CGRect(x: 0, y: kViewHeight, width: kViewWidth, height: popView.frame.height)
            }) { (completion:Bool) -> Void in
                maskView.removeFromSuperview()
                popView.removeFromSuperview()
        }
    }
}
