//
//  DetailsViewController.swift
//  DreamLister
//
//  Created by Hemisphere on 09/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var titleTextFeild:UITextField!
    @IBOutlet weak var priceTextFeild:UITextField!
    @IBOutlet weak var detailTextFeild:UITextField!
    @IBOutlet weak var thumbImage:UIImageView!
    var editToItem:Item?
    var imagePicker:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if  editToItem != nil {
            loadtemData()
        }
        imagePicker=UIImagePickerController()
        imagePicker.delegate=self
        
    }

    @IBAction func addImage(_ sender: Any) {
       present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       if let ima=info[UIImagePickerControllerOriginalImage] as? UIImage{
            thumbImage.image=ima
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteItem(_ sender: UIBarButtonItem) {
        if editToItem != nil{
            context.delete(editToItem!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveItems(_ sender: UIButton) {
        
        let item:Item?
        let pickimage:Image?
        pickimage=Image(context: context)
        if (editToItem==nil){
            item=Item(context: context)
            
        }
        else{
            item=editToItem
        }
       
        if let title=titleTextFeild.text{
            item?.title=title
        }
        if let price=priceTextFeild.text{
            item?.price=(price as NSString).doubleValue
        }
        if let detail=detailTextFeild.text{
            item?.details=detail
        }
        pickimage?.image=thumbImage.image
        item?.toImage=pickimage
        ad.saveContext()
        _=navigationController?.popViewController(animated: true)
        
    }
    
    func loadtemData()  {
        if let item=editToItem{
            titleTextFeild.text=item.title
            priceTextFeild.text="\(item.price)"
            detailTextFeild.text=item.details
            thumbImage.image=item.toImage?.image as? UIImage
        }
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
