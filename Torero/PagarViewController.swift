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
    @IBOutlet var buttonPagar: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        buttonPagar.setTitle("Pagar", forState: .Normal)
        buttonPagar.enabled = true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    @IBAction func tokenizeCard(sender : AnyObject) {
        buttonPagar.setTitle("Cargando . . .", forState: .Normal)
        buttonPagar.enabled = false
        
        var conekta = Conekta(publicKey: "key_EfsX62HbiTSNsuHr5q6xv2Q")
        
        //var tarjeta = Card(last4: numberField.text, name: nameField.text, cvc: ccField.text, exp_month: expMonthField.text, exp_year: expYearField.text)
        var tarjeta = Card(last4: "4242424242424242", name: "Julion", cvc: "456", exp_month: "09", exp_year:"2018")
        var postInfo = nameSaved + lastSaved + streetSaved + numberSaved + coloniaSaved + delegacionSaved + juzgadoSaved + itineranteSaved
        
        conekta.createToken(tarjeta, withSuccess: { (data) -> Void in
            println("Success:")
            println(data)
            var token = data["id"] as! String!
            let request = NSMutableURLRequest(URL: NSURL(string: "http://torero-tlacuilo.rhcloud.com/api/charge")!)
            request.HTTPMethod = "POST"
            
            let postString = "token=" + token + postInfo
            println(postString)
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                data, response, error in
                
                if error != nil {
                    println("error=\(error)")
                    var alert = UIAlertController(title:"Hubo un error", message: "Intentalo de Nuevo", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                        self.buttonPagar.setTitle("Pagar", forState: .Normal)
                        self.buttonPagar.enabled = true
                        
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    return
                }
                
                println("response = \(response)")
                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("responseString = \(responseString)")
                if responseString as! String == "Success" {
                    var alert = UIAlertController(title:"Pago", message: "Tu pago ha sido exitoso", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                    NSOperationQueue.mainQueue().addOperationWithBlock {
                        self.performSegueWithIdentifier("goToGracias", sender: self)
                    }
                   
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    var alert = UIAlertController(title:"Pago", message: "Tu pago ha fallado", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                        self.buttonPagar.setTitle("Pagar", forState: .Normal)
                        self.buttonPagar.enabled = true
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            task.resume()
        }, withFailure: { (error) -> Void in
                println("Failure:")
                var alert = UIAlertController(title:"Error", message: "Intentalo de Nuevo", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                    self.buttonPagar.setTitle("Pagar", forState: .Normal)
                    self.buttonPagar.enabled = true
                    
                    
                }))
                self.presentViewController(alert, animated: true, completion: nil)
                
                println(error)
        })
        
        
    }
    
    
}

