//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
   
    private var dotCount: Int = 0                                      //Added by Iurie
    
    private var displayValue: Double {
        get {
            if displayLabel.text == "." {displayLabel.text = "0.0"}   // Added by Iurie
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    @IBOutlet weak var displayLabel: UILabel!
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        dotCount = 0                                                     //Added by Iurie
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    dotCount += 1
                    print("dotCount  = " , dotCount)
                    if dotCount > 1 {
                        dotCount -= 1
                        print("return dotCount  = " , dotCount)
                        return
                    }
                    //                    let isInt = floor(displayValue) == displayValue
                    //                    if !isInt {
                    //                        return
                    //                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

