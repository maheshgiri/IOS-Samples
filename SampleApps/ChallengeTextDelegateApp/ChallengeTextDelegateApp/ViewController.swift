//
//  ViewController.swift
//  ChallengeTextDelegateApp
//
//  Created by Hemisphere on 24/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var limitTextField: UITextField!
    let limitDelegate=TextLimitDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.limitTextField.delegate=limitDelegate        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

