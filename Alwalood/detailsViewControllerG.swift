//
//  detailsViewController.swift
//  organizer
//
//  Created by Tahani mohammed on 04/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit


class detailsViewControllerG: UIViewController {
    
    var imageDc = [0:UIImage(named: "1"),1:UIImage(named: "2"),2:UIImage(named: "3"),3:UIImage(named: "4"),4:UIImage(named: "5"),5:UIImage(named: "6")]
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "seg2", sender: self)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg2" {
            let DVC = segue.destination as! DViewControllerG
            DVC.iimage = imageDc[indexVal]!!
          //  DVC.delegate = self
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            self.navigationController?.pushViewController(DVC, animated: true)

        }
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var insta: UILabel!
    
    var image2 = UIImage()
    var Name  = " "
    var Email = " "
    var Insta = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = image2
        shopName.text = Name
        email.text = Email
        insta.text = Insta
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
