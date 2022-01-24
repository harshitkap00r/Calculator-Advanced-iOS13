//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
        
    private var calculator = CalculatorLogic()
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                print("yaha se")
                displayValue = result
            }
            else {
                displayLabel.text = displayLabel.text! + sender.currentTitle!
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        displayLabel.text = displayLabel.text == "0" ? sender.currentTitle : displayLabel.text! + sender.currentTitle!
    }

}
