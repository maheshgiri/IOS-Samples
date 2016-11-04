//
//  ViewController.swift
//  Experiment
//
//  Created by Hemisphere on 22/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onButtonClick(_ sender: Any) {
        let nextController = UIAlertController()
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        nextController.addAction(okAction)
        self.present(nextController, animated: true, completion: nil)
        // let image = UIImage()
       // let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        //self.present(nextController, animated: true, completion: nil)        //let controller=UIImagePickerController()
     //self.present(controller, animated: true, completion: nil)
    
    }

}

