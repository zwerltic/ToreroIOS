//
//  PagarViewController.swift
//  Torero
//
//  Created by Jose on 8/8/15.
//  Copyright (c) 2015 toreo. All rights reserved.
//

import UIKit

class PagarViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!;
    @IBOutlet var numberField: UITextField!;
    @IBOutlet var expMonthField: UITextField!;
    @IBOutlet var expYearField: UITextField!;
    @IBOutlet var ccField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    @IBAction func tokenizeCard(sender : AnyObject) {
        var conekta = Conekta(publicKey: "key_EfsX62HbiTSNsuHr5q6xv2Q")
        
        var tarjeta = Card(last4: numberField.text, name: nameField.text, cvc: ccField.text, exp_month: expMonthField.text, exp_year: expYearField.text)
        
        conekta.createToken(tarjeta, withSuccess: { (data) -> Void in
            println("Success:")
            println(data)
            }, withFailure: { (error) -> Void in
                println("Failure:")
                println(error)
        })
        
    }
    
    
}

