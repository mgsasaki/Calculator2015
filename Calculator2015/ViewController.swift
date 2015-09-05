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
    var isInTheMiddleOfTypingANumber: Bool! = false
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

