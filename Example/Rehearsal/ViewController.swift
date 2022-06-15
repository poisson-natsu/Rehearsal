//
//  ViewController.swift
//  Rehearsal
//
//  Created by fuwenhua on 06/15/2022.
//  Copyright (c) 2022 fuwenhua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.present(SecondViewController(), animated: true)
    }

}

