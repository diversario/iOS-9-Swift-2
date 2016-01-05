//
//  ViewController.swift
//  retro-calculator
//
//  Created by Ilya Shaisultanov on 1/4/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Add = "+"
        case Multiply = "*"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var lvalueStr = ""
    var rvalueStr = ""
    var currentOperation: Operation = .Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
            btnSound.volume = 0.005
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed (btn: UIButton!) {
        playSound()
        
        runningNumber += String(btn.tag)
        
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePress(sender: UIButton) {
        processOperation(.Divide)
    }
    
    @IBAction func onMultiplyPress(sender: UIButton) {
        processOperation(.Multiply)
    }
    
    @IBAction func onSubtractPress(sender: UIButton) {
        processOperation(.Subtract)
    }
    
    @IBAction func onAddPress(sender: UIButton) {
        processOperation(.Add)
    }
    
    @IBAction func onEqualPress(sender: UIButton) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != .Empty {
            currentOperation = op
            
            if runningNumber == "" {
                return
            }
            
            rvalueStr = runningNumber
            runningNumber = ""
            
            switch currentOperation {
            case .Multiply: result = String(Double(lvalueStr)! * Double(rvalueStr)!)
                break
            case .Divide: result = String(Double(lvalueStr)! / Double(rvalueStr)!)
                break
            case .Add: result = String(Double(lvalueStr)! + Double(rvalueStr)!)
                break
            case .Subtract: result = String(Double(lvalueStr)! - Double(rvalueStr)!)
                break
            default: break
            }
            
            lvalueStr = result
            outputLabel.text = result
        } else {
            lvalueStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound () {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
}

