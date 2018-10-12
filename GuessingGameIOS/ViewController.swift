//
//  ViewController.swift
//  GuessingGameIOS
//
//  Created by Andrew Beauchamp on 10/9/18.
//  Copyright © 2018 Andrew Beauchamp. All rights reserved.
//

import UIKit
//Mark Life Cylce
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var intructionsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var remainingGuessLabel: UILabel!
    @IBOutlet weak var numberGuessedLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        restart()
    }
    
    //Mark Properties
    var randomNumber = Int.random(in: 1...100)
    var guessesRemaining = 5
    var numberOfGuesses = 5
    var minimumNumber = 1
    var maximumNumber = 100
    
    @IBAction func guessButtonTapped(_ sender: Any) {
        let userInput = textField.text!
        
        numberGuessedLabel.text = "You guessed \(textField.text!)"
        
        guard let guess = Int(userInput) else {
            numberGuessedLabel.text = "Please put in a number"
            return
        }
    
        makeAGuess(guess)
        
    }
    
    //Mark: functions
    
    func makeAGuess ( _ guess: Int) {
        guard guess >= minimumNumber && guess <= maximumNumber else {
            numberGuessedLabel.text = "Input wasn't between 1 and 100"
            return
        }
        if guess == randomNumber {
            setUpForRestart()
            feedbackLabel.text = "You win!"
            return
        }
        
        if guessesRemaining == 0 {
           setUpForRestart()
            feedbackLabel.text = "You lose! The number was \(randomNumber)"
            return
        }
        
        if guess < randomNumber {
            feedbackLabel.text = "Your guess was too low"
        } else {
            feedbackLabel.text = "Your guess was too high"
        }
        if guess != randomNumber {
            textField.text = ""
            guessesRemaining -= 1
            remainingGuessLabel.text = "You have \(guessesRemaining) guesses remaining"
            return
        }
    }
    
    func setUpForRestart ( ) {
        //text field is disabled
        textField.isEnabled = false
        
        //text field hidden
        textField.isHidden = true
        
        //instructions label disabled
        intructionsLabel.isHidden = true
        
        //Guess button is hidden
        guessButton.isHidden = true
        
        //Put restart button here
        
        restartButton.isHidden = false
    }
    
    func restart () {
        // new random number
        randomNumber = Int.random(in: minimumNumber...maximumNumber)
        // reset guesses remaining
        guessesRemaining = 5
        // clear text field
        textField.text = ""
        //show text field
        textField.isHidden = false
        // enable text field
        textField.isEnabled = true
        // hide play again button
        restartButton.isHidden = true
        // show guess button
        guessButton.isHidden = false
        // reset feedback label
        feedbackLabel.text = "too high/low"
        // reset guesses remaining label
        guessesRemaining = 5
        remainingGuessLabel.text = "You have \(guessesRemaining) guesses remaining"
        //Show intructions
        intructionsLabel.isHidden = false
        intructionsLabel.text = "Enter a number between \(minimumNumber) and \(maximumNumber)"
        //number guessed label
        numberGuessedLabel.text = "Number guessed"
        
    }
    
    
    
    
    
    
    
    
    
    
    
}


