//
//  DViewController.swift
//  names
//
//  Created by Tahani mohammed on 01/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    
    var na1 = ""
    var na2 = ""
    var na3 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        name1.text! = na1
        name2.text! = na2
        name3.text! = na3

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
