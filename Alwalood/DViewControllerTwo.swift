//
//  DViewControllerTwo.swift
//  names
//
//  Created by Tahani mohammed on 03/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

class DViewControllerTwo: UIViewController {
    
 
    @IBOutlet weak var na1: UILabel!
    @IBOutlet weak var na2: UILabel!
    @IBOutlet weak var na3: UILabel!
    
    var nam1 = ""
    var nam2 = ""
    var nam3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        na1.text! = nam1
        na2.text! = nam2
        na3.text! = nam3

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
