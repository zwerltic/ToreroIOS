
//
//  ConfirmarViewController.swift
//  Torero
//
//  Created by Jose on 8/8/15.
//  Copyright (c) 2015 toreo. All rights reserved.
//

import UIKit

class ConfirmarViewController: UIViewController {
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var lastLabel : UILabel!
    @IBOutlet var streetLabel : UILabel!
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var coloniaLabel : UILabel!
    @IBOutlet var delegacionLabel : UILabel!
    @IBOutlet var juzgadoLabel : UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text       = "Nombre     :   " + nameSaved
        lastLabel.text       = "Apellido   :   " + lastSaved
        streetLabel.text     = "Calle      :   " + streetSaved
        numberLabel.text     = "Numero     :   " + numberSaved
        coloniaLabel.text    = "Colonia    :   " + coloniaSaved
        delegacionLabel.text = "Delegacion :   " + delegacionSaved
        juzgadoLabel.text    = "Juzgado    :   " + juzgadoSaved
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

