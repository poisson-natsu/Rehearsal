//
//  SecondViewController.swift
//  Rehearsal_Example
//
//  Created by 付文华 on 2022/6/15.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import Rehearsal

class SecondViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
    deinit {
        
        print("------deinit:\(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        view.addSubview(textField)
    }
    
    lazy var textField: MyTextField = {
        
        let textfield = MyTextField(frame: CGRect(x: 20, y: 100, width: 300, height: 50))
        textfield.placeholder = "请输入11位手机号"
        // 简单示例，非精确的手机号匹配
        let pattern = "^(1([3-9]{1}([0-9]{0,9})?)?)?$"
        textfield.re.setPattern(pattern) { text in
            print("the phone number is\n********\(text)********")
        }
        
        return textfield
    }()
}

class MyTextField: UITextField {
    deinit {
        print("🐶🐶🐟🐟 deinit:\(type(of: self))")
    }
}
