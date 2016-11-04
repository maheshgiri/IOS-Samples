//
//  ViewController.swift
//  SimpleNavApp
//
//  Created by Hemisphere on 04/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "start Over", style: .plain, target: self, action:#selector(ViewController.startOver))
        
    }
    
    func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

