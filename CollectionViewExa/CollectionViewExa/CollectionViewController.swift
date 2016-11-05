//
//  CollectionViewController.swift
//  CollectionViewExa
//
//  Created by Hemisphere on 05/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController{

    @IBOutlet weak var flowLayout:UICollectionViewFlowLayout!
    let imagesCollection=[UIImage(named:"")]
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
   
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "collectionImages", for: indexPath) as! CustomCollectionViewCell
        cell.imageCollectionItem.image=UIImage(named: "myimage")
        return cell
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
