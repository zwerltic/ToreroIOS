//
//  GraciasViewController.swift
//  Torero
//
//  Created by Jose on 9/13/15.
//  Copyright (c) 2015 toreo. All rights reserved.
//

import UIKit

class GraciasViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let yourImage = UIImage(named: "Pantalla2.png")
        //        let imageview = UIImageView(image: yourImage)
        //        self.view.addSubview(imageview)
        //        view.sendSubviewToBack(imageview)
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.setHidesBackButton(true, animated:true);

    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}