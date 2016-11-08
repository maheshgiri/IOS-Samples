//
//  ViewController.swift
//  SimpleCoreDataEx
//
//  Created by Hemisphere on 08/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var noteText:[String]=["First Note","Second Note","Third Note"]
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell=tableView.dequeueReusableCell(withIdentifier: "noteTexts")
        cell?.textLabel?.text="Hello"
        cell?.detailTextLabel?.text="hello i am here"
        return cell!
    }

    @IBAction func addNotes(sender:AnyObject){
        
    
    }
   
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return noteText.count
    }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

