//
//  CostomViewController.swift
//  GuessingGameIOS
//
//  Created by Andrew Beauchamp on 10/11/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit

class CostomViewController: UIViewController {
    
    //Mark:Properties
    @IBOutlet weak var numberOfGuessesTextField: UITextField!
    @IBOutlet weak var maximumNumberTextField: UITextField!
    
    @IBOutlet weak var startButton: UIButton!
    //Mark: Actions
    @IBAction func startButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CostomToGame", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewController = segue.destination as?  ViewController else
        {return}
        switch segue.identifier {
        case "CostomToGame":
            guessingGameViewController.maximumNumber = (Int(maximumNumberTextField.text!)!)
            guessingGameViewController.guessesRemaining = (Int(numberOfGuessesTextField.text!)!)
        default:
            break
        }
        
    }
}
