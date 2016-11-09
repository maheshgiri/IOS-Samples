//
//  DetailsViewController.swift
//  DreamLister
//
//  Created by Hemisphere on 09/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var titleTextFeild:UITextField!
    @IBOutlet weak var priceTextFeild:UITextField!
    @IBOutlet weak var detailTextFeild:UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveItems(_ sender: UIButton) {
        let item=Item(context: context)
        if let title=titleTextFeild.text{
            item.title=title
        }
        if let price=priceTextFeild.text{
            item.price=(price as NSString).doubleValue
        }
        if let detail=detailTextFeild.text{
            item.details=detail
        }
        ad.saveContext()
        _=navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
