//
//  ViewController.swift
//  Calculator2015
//
//  Created by Marcello Sasaki on 9/5/15.
//  Copyright (c) 2015 Marcello Sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var isInTheMiddleOfTypingANumber = false
    
    
    @IBAction func pressedDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (isInTheMiddleOfTypingANumber == true)
        {
            display.text = display.text! + digit
        } else
        {
            display.text = digit
            isInTheMiddleOfTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func enter() {
        isInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("stack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if isInTheMiddleOfTypingANumber
        {
            enter()
        }
        switch operation
        {
        case "×": performOperation { $1 * $0 }
        case "÷": performOperation { $1 / $0 }
        case "-": performOperation { $1 - $0 }
        case "+": performOperation { $1 + $0 }
        case "√": performOperation1 { sqrt($0) }
            
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double)
    {
        if operandStack.count >= 2
        {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation1(operation: Double -> Double)
    {
        if operandStack.count >= 1
        {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

