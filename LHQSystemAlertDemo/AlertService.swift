//
//  LHQAlert.swift
//  LHQSwiftDemo
//
//  Created by WaterWorld on 2019/3/21.
//  Copyright © 2019年 linhuaqin. All rights reserved.
//

import UIKit

typealias cancelBlock = () -> Void
typealias sureBlock = () -> Void
typealias defaultBlock = (Int) -> Void

class AlertService: NSObject {
    
    
    func showAlert(title: String?,
                   message: String?,
                   style: UIAlertController.Style,
                   sureTitle: String?,
                   sBlock: sureBlock?) -> Void {
        
        showAlert(title: title, message: message, style: style, cancelTitle: nil, sureTitle: sureTitle, sBlock: sBlock)
    }
    
    func showAlert(title: String?,
                   message: String?,
                   style: UIAlertController.Style,
                   cancelTitle: String?,
                   sureTitle: String?,
                   sBlock: sureBlock?) -> Void {
        
        showAlert(title: title, message: message, style: style, cancelTitle: cancelTitle, sureTitle: sureTitle, sBlock: sBlock, cBlock: nil)
    }
    
    func showAlert(title: String?,
                   message: String?,
                   style: UIAlertController.Style,
                   cancelTitle: String?,
                   actions:[(String)]?,
                   cBlock: cancelBlock?,
                   dBlock: defaultBlock?) -> Void {
        
        showAlert(title: title, message: message, style: style, cancelTitle: cancelTitle, sureTitle: nil, actions: actions, sBlock: nil, cBlock: cBlock, dBlock: dBlock)
    }
    
    func showAlert(title: String?,
                   message: String?,
                   style: UIAlertController.Style,
                   cancelTitle: String?,
                   sureTitle: String?,
                   sBlock: sureBlock?,
                   cBlock: cancelBlock?) -> Void {
        
        showAlert(title: title, message: message, style: style, cancelTitle: cancelTitle, sureTitle: sureTitle, actions: nil, sBlock: sBlock, cBlock: cBlock, dBlock: nil)
    }
    
    func showAlert(title: String?,
                   message: String?,
                   style: UIAlertController.Style,
                   cancelTitle: String?,
                   sureTitle: String?,
                   actions:[(String)]?,
                    sBlock: sureBlock?,
                    cBlock: cancelBlock?,
                    dBlock: defaultBlock?) -> Void {
        
        let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        if !title!.isEmpty {
            alertVc.title = title
        }
        if message != nil {
            alertVc.message = message
        }
        
        if style == UIAlertController.Style.alert {
            if sureTitle != nil{
                let sureAction = UIAlertAction.init(title: sureTitle, style: .default) { (action) in
                    sBlock?()
                }
                alertVc .addAction(sureAction)
            }
        }
        
        if cancelTitle != nil{
            let cancelAction = UIAlertAction.init(title: cancelTitle, style: .cancel) { (action) in
                cBlock?()
            }
            alertVc .addAction(cancelAction)
        }
        
        if actions != nil {
            for i in 0..<actions!.count {
                let deAction = UIAlertAction.init(title: actions![i], style: .default) { (action) in
                    dBlock?(i)
                }
                alertVc.addAction(deAction)
            }
        }
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVc, animated: true, completion: nil)
        
    }
    
}


