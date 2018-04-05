//
//  firstViewController.swift
//  names
//
//  Created by Tahani mohammed on 03/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

class firstViewControllerN: UIViewController {
    

    @IBAction func femaleBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "female", sender: self)
    }
 
  
    @IBAction func maleBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "male", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
