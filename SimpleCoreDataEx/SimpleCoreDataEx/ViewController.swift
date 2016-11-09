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
      var notes=[NSManagedObject]()
    let appDelegate =
        UIApplication.shared.delegate as! AppDelegate
    
    

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell=tableView.dequeueReusableCell(withIdentifier: "noteTexts")
        let note=notes[indexPath.row]
        cell?.textLabel?.text=note.value(forKey: "name") as! String?
        print("Note Value is \(note.value(forKey: "name") as! String?)")
        return cell!
    }

    func saveNote(noteText: String) {
        //1
        let managedContext = appDelegate.persistentContainer.viewContext
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "Notes",
                                                 in:managedContext)
        
        
        let note = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        
        //3
        note.setValue(noteText, forKey: "name")
        
        //4
        do {
            try managedContext.save()
            //5
            notes.append(note)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addNotes(sender:AnyObject){
        let alert=UIAlertController(title: "Add Note", message: "your fav", preferredStyle: .alert)
        
        let save=UIAlertAction(title: "Add Note", style: .default, handler: {
            (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            print("Save Note \(textField?.text)")
            self.saveNote(noteText: (textField?.text)!)
            self.tableView.reloadData()        })
        let cancel=UIAlertAction(title: "cancel", style: .cancel, handler: {(action:UIAlertAction)->Void in})
       
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
       
        alert.addAction(save)
        alert.addAction(cancel)
        present(alert,
                              animated: true,
                              completion: nil)
    }
   
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
    }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
          }

    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewwillAppear")
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        do{
         let results=try managedContext.fetch(fetchRequest)
          notes=results as! [NSManagedObject]
          print("No of Notes \(notes.count)")
        }catch let error as NSError{
            print("Error occoures \(error.localizedDescription)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

