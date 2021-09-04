//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlet allows me refrence UI elemnets
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    // defined an array of dice images
    let DiceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
    
    

    @IBAction func rollbuttonPressed(_ sender: UIButton)
    {
        //.randomElement() selects an random element from the dice array
        diceImageView1.image = DiceArray.randomElement()
        diceImageView2.image = DiceArray.randomElement()
        
        
        
        
        
        
    }
    
}

 
