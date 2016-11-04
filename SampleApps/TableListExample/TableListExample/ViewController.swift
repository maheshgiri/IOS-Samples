//
//  ViewController.swift
//  TableListExample
//
//  Created by Hemisphere on 26/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    let username:[String]=["mahesh","pratik","sachin","kkk"]
    let userImages=[UIImage(named: "myimage"),UIImage(named: "myimage"),UIImage(named: "myimage"),UIImage(named: "myimage")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return username.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells=self.tableView.dequeueReusableCell(withIdentifier: "mypics", for: indexPath) as! CustomTableViewCell
        cells.fullnameLable.text=username[indexPath.row]
        cells.profileImage.image=userImages[indexPath.row]
        cells.postImage.image=userImages[indexPath.row]
        return cells
    }
}

