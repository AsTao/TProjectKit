//
//  ViewController.swift
//  TProjectKit
//
//  Created by EasyfunDev on 03/12/2019.
//  Copyright (c) 2019 EasyfunDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var abutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abutton.addMask(radius: 10)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

