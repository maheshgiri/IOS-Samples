//
//  ViewController.swift
//  Mashambo
//
//  Created by Hemisphere on 24/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var choice:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiceClick(sender:UIButton){
        switch (sender.tag) {
        case 0:
            choice="Rock"
        case 1:
            choice="Scissors"
        case 2:
            choice="Paper"
        default:
            choice=nil
        }
        
        var controller : WinnerViewController
        controller=self.storyboard?.instantiateViewController(withIdentifier: "winner") as! WinnerViewController
        controller.userChoice=Type(rawValue:choice!)
        self.present(controller, animated: true, completion: nil)
        
    }

    
    
}

