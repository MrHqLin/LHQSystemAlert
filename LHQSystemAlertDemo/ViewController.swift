//
//  ViewController.swift
//  LHQSystemAlertDemo
//
//  Created by WaterWorld on 2019/3/22.
//  Copyright © 2019年 linhuaqin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        for i in 0..<3 {
            let button = UIButton.init()
            button.setTitle("show\(i)", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.frame = CGRect(x: 100, y: 80 + i * 60, width: 80, height: 40)
            button.tag = i
            button.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
        
    }
    
    @objc func tap(sender: UIButton) -> Void {
        switch sender.tag {
        case 0:
            
            AlertService().showAlert(title: "title", message: "message", style: .alert, cancelTitle: "cancel", sureTitle: "sure", actions: nil, sBlock: {
                print("sure")
            }, cBlock: {
                print("cancel")
            }) { (i) in
                print("i")
            }
            
            break
        case 1:
            AlertService().showAlert(title: "title", message: "message", style: .actionSheet, cancelTitle: "cancel", sureTitle: "sure", sBlock: {
                print("sure")
            }) {
                print("cancel")
            }
        case 2:
            AlertService().showAlert(title: "title", message: "message", style: .actionSheet, cancelTitle: "cancel", actions: ["1","2","3"], cBlock: {
                print("cancel")
            }) { (i) in
                print("\(i)")
            }
            
        default: break
            
        }
    }


}

