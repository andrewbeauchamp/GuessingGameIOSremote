//
//  SelectDifficultyViewController.swift
//  GuessingGameIOS
//
//  Created by Andrew Beauchamp on 10/10/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit

class SelectDifficultyViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewController = segue.destination as?  ViewController else
        {return}
        switch segue.identifier {
        case "EasyToGuessingGame":
            guessingGameViewController.minimumNumber = 1
            guessingGameViewController.maximumNumber = 50
            guessingGameViewController.guessesRemaining = 4
        case "MediumToGuessingGame":
            guessingGameViewController.minimumNumber = 1
            guessingGameViewController.maximumNumber = 100
            guessingGameViewController.guessesRemaining = 4
        case "HardToGuessingGame":
            guessingGameViewController.minimumNumber = 1
            guessingGameViewController.maximumNumber = 500
            guessingGameViewController.guessesRemaining = 4
        default:
            break
        }
    }
    
    
    
}
