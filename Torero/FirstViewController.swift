//
//  FirstViewController.swift
//  Torero
//
//  Created by Jose on 8/7/15.
//  Copyright (c) 2015 toreo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let yourImage = UIImage(named: "Pantalla1.png")
//        let imageview = UIImageView(image: yourImage)
//        self.view.addSubview(imageview)
//        view.sendSubviewToBack(imageview)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    - (IBAction)unwindToAcerca: (UIStoryboardSegue*)segue {
//    
//    }
    
    @IBAction func unwindToAcerca (segue: UIStoryboardSegue){}
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    


}

