//
//  WinnerViewController.swift
//  Mashambo
//
//  Created by Hemisphere on 24/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit


enum Type:String{
    case Paper="Paper"
    case Scissors="Scissors"
    case Rock="Rock"
    
    static func randomChoice() -> Type {
        let choices = ["Rock","Paper","Scissors"]
        let randomInt=Int(arc4random_uniform(3))
        return Type(rawValue: choices[randomInt])!
        
    }
}


class WinnerViewController: UIViewController {

    
    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winnerLable:UILabel!
    @IBOutlet weak var playagainButton:UIButton!
      let shapes = ["Rock", "Paper", "Scissors"]
    var userChoice:Type!
    var otherChoice:Type=Type.randomChoice()
    
    override func viewDidLoad() {
        super.viewDidLoad()

               // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(otherChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, otherChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(otherChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(otherChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        winnerImage.image = UIImage(named: imageName)
        winnerLable.text = text
 
        
      
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissThis( sender:UIButton!){
        
        dismiss(animated: true, completion: nil)
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
