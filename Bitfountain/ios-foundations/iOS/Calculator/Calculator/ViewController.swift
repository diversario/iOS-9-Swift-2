//
//  ViewController.swift
//  Calculator
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var displayValue: String?
    var previousValue: Double?
    var operation: String?
    var shouldClearDisplay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateDisplayValue (calc: (Double, Double) -> Double, opName: String, sender: UIButton) -> () {
        print("opName is \(opName)")
        if operation != nil {
            equalsTapped(sender)
        }

        operation = opName
        
        var doubleFromDisplayValue: Double?
        
        if let currentValue = displayValue, currentValueDouble = Double(currentValue) {
            doubleFromDisplayValue = currentValueDouble
        }
        
        if doubleFromDisplayValue == nil {
            displayValue = nil
            displayLabel.text = "0"
        } else {
            if let prevValue = previousValue {
                let result = calc(prevValue, doubleFromDisplayValue!)
                
                displayValue = String(result)
                displayLabel.text = displayValue
                
                previousValue = result
            } else {
                previousValue = doubleFromDisplayValue
            }
        }

        shouldClearDisplay = true
    }
    
    // Operations
    
    @IBAction func multiplyTapped(sender: UIButton) {
        func op (a: Double, b: Double) -> Double {
            return a * b
        }
        
        calculateDisplayValue(op, opName: "*", sender: sender)
    }
    
    @IBAction func divideTapped(sender: UIButton) {
        func op (a: Double, b: Double) -> Double {
            return a / b
        }
        
        calculateDisplayValue(op, opName: "/", sender: sender)
    }
    
    @IBAction func minusTapped(sender: UIButton) {
        func op (a: Double, b: Double) -> Double {
            return a - b
        }
        
        calculateDisplayValue(op, opName: "-", sender: sender)
    }
    
    @IBAction func plusTapped(sender: UIButton) {
        func op (a: Double, b: Double) -> Double {
            return a + b
        }
        
        calculateDisplayValue(op, opName: "+", sender: sender)
    }
    
    @IBAction func equalsTapped(sender: UIButton) {
        if let op = operation {
            operation = nil
            
            switch (op) {
            case "*": multiplyTapped(sender)
                break
            case "/": divideTapped(sender)
                break
            case "+": plusTapped(sender)
                break
            case "-": minusTapped(sender)
                break
            default: break
            }
        }
    }
    
    @IBAction func plusMinusTapped(sender: UIButton) {

    }
    
    @IBAction func backspaceTapped(sender: UIButton) {
    }
    
    // Symbols
    
    func appendSymbol(symbol: String) {
        if shouldClearDisplay {
            displayValue = nil
            shouldClearDisplay = false
        }

        let val = displayValue ?? ""
        
        displayValue = val + symbol
        
        displayLabel.text = displayValue!
    }

    func prependSymbol(symbol: String) {
        let val = displayValue ?? ""
        
        displayValue = symbol + val
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func decimalTapped(sender: UIButton) {
        if let currentValue = displayValue {
            if currentValue.containsString(".") {return}
            
            appendSymbol(".")
        } else {
            appendSymbol("0.")
        }
        
        displayLabel.text = displayValue!
    }
    
    @IBAction func zeroTapped(sender: UIButton) {
        appendSymbol("0")
    }
    
    @IBAction func oneTapped(sender: UIButton) {
        appendSymbol("1")
    }
    
    @IBAction func twoTapped(sender: UIButton) {
        appendSymbol("2")
    }
    
    @IBAction func threeTapped(sender: UIButton) {
        appendSymbol("3")
    }
    
    @IBAction func fourTapped(sender: UIButton) {
        appendSymbol("4")
    }
    
    @IBAction func fiveTapped(sender: UIButton) {
        appendSymbol("5")
    }
    
    @IBAction func sixTapped(sender: UIButton) {
        appendSymbol("6")
    }
    
    @IBAction func sevenTapped(sender: UIButton) {
        appendSymbol("7")
    }
    
    @IBAction func eightTapped(sender: UIButton) {
        appendSymbol("8")
    }
    
    @IBAction func nineTapped(sender: UIButton) {
        appendSymbol("9")
    }
    
}

