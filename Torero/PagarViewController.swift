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
        
        //var tarjeta = Card(last4: numberField.text, name: nameField.text, cvc: ccField.text, exp_month: expMonthField.text, exp_year: expYearField.text)
        var tarjeta = Card(last4: "4242424242424242", name: "Julion", cvc: "456", exp_month: "09", exp_year:"2018")
        var postInfo = nameSaved + lastSaved + streetSaved + numberSaved + coloniaSaved + delegacionSaved + juzgadoSaved + itineranteSaved
        
        conekta.createToken(tarjeta, withSuccess: { (data) -> Void in
            println("Success:")
            println(data)
           // var dataString:String = data.TokenID as! String
            let request = NSMutableURLRequest(URL: NSURL(string: "http://torero-tlacuilo.rhcloud.com/api/charge")!)
            request.HTTPMethod = "POST"
            
            let postString = postInfo
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                data, response, error in
                
                if error != nil {
                    println("error=\(error)")
                    var alert = UIAlertController(title:"Hubo un error", message: "Intentalo de Nuevo", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                        
                        
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    return
                }
                
                println("response = \(response)")
                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("responseString = \(responseString)")
                var alert = UIAlertController(title:"Pago", message: "Tu pago ha sido exitoso", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                    self.performSegueWithIdentifier("goToGracias", sender: sender)
                   
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            task.resume()
            }, withFailure: { (error) -> Void in
                println("Failure:")
                var alert = UIAlertController(title:"Error", message: "Intentalo de Nuevo", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                   
                    
                }))
                self.presentViewController(alert, animated: true, completion: nil)
                println(error)
        })
        
    }
    
    
}

