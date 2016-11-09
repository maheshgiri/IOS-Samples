//
//  ViewController.swift
//  DreamLister
//
//  Created by Hemisphere on 08/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    @IBOutlet weak var tableView:UITableView!
    
    @IBOutlet weak var sortController: UISegmentedControl!
    var fetchedController:NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate=self
        tableView.dataSource=self
       
       // generateTestData()
        attemptFetchResults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
   //Configuring Customized Item cell
    func configureCell(cell:ItemCell,indexPath:NSIndexPath)  {
        let itemObj=fetchedController.object(at: indexPath as IndexPath)
            cell.configureCell(item: itemObj )
        
    }
    
   /* //Customized row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections=fetchedController.sections{
            let sectionInfo=sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections=fetchedController.sections{
            return sections.count
        }
        return 0
    }
    
    
    func attemptFetchResults (){
        //create one fetch request for fetching NSManagedObject form Core Data
        let itemFetchRequest:NSFetchRequest<Item>=Item.fetchRequest()
        //to sort date wise
        let sortDate=NSSortDescriptor(key: "created", ascending: true)
        itemFetchRequest.sortDescriptors=[sortDate]
       //handle request to fetchController to fetch results
        let fetchedController=NSFetchedResultsController(fetchRequest: itemFetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.fetchedController=fetchedController
        self.fetchedController.delegate=self
        do{
            try fetchedController.performFetch()
        }catch{
            let error=error as NSError
            print("\(error)")
        }
        
    
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath=newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath=indexPath{
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath=indexPath{
            let cell=tableView.cellForRow(at: indexPath) as! ItemCell
             configureCell(cell: cell , indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
            if let indexPath=indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath=newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        
        }
    }
    
    //Generate some random data and add to Db
    func generateTestData(){
     let item=Item(context: context)
     item.title="Tesla S 100"
     item.price=50000
     item.details="Coming by plane next sat ,Dont want to wait for it wanna drive and test it"
        let item1=Item(context: context)
        item1.title="Bose Wi Headphones"
        item1.price=500
        item1.details="Noise cancel is awsome wanna test for Noise cancelation"
    
    }
  
        
    


}
