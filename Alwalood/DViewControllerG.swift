//
//  DViewController.swift
//  organizer
//
//  Created by Tahani mohammed on 29/06/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

var dImg = [0:UIImage(named: "7"),1:UIImage(named: "8"),2:UIImage(named: "9"),3:UIImage(named: "10"),4:UIImage(named: "11"),5:UIImage(named: "12")]

var dNam = [0:"المحل ١",1:"المحل ٢",2:"المحل ٣",3:"المحل ٤",4:"المحل ٥",5:"المحل ٦"]

var dEmail = [0:"cake@cake.com",1:"cupcake@cupcake.com",2:"dount@dount.com",3:"pie@pie.com",4:"flower@flower.com",5:"coffee@coffee.com"]

var dInstgram = [0:"@Cake",1:"@cupCake",2:"@Dount",3:"@Pie",4:"@Flower",5:"@Coffee"]


class DViewControllerG: UIViewController {
    //
    var delegate: detailsViewControllerG?
    @IBOutlet weak var img: UIImageView!
    
    @IBAction func infoBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "segue", sender: self)
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "segue" {
        let detVC = segue.destination as! detailsViewControllerG
        detVC.image2 = dImg[indexVal]!!
        detVC.Name = dNam[indexVal]!
        detVC.Email = dEmail[indexVal]!
        detVC.Insta = dInstgram[indexVal]!
    }
    }
    var iimage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = iimage
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
