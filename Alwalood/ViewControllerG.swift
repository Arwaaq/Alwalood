//
//  ViewController.swift
//  organizer
//
//  Created by Tahani mohammed on 29/06/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

var indexVal:Int = 0

class ViewControllerG: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    let imageD = [0:UIImage(named: "1"),1:UIImage(named: "2"),2:UIImage(named: "3"),3:UIImage(named: "4"),4:UIImage(named: "5"),5:UIImage(named: "6")]
    
    let nameD = [0:"الكيك",1:"الحلويات العصرية ",2:" الحلويات التقليدية",3:"المشروبات الساخنة ",4:"المشروبات الباردة",5:"أكواب الكيك"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageD.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCellG", for: indexPath) as! MainCollectionViewCellG
        
        cell.Olab.text = nameD[indexPath.row]
        cell.Oimg.image = imageD[indexPath.row]!!
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard (name: "Main" , bundle: nil)
        let  des = mainStoryboard.instantiateViewController(withIdentifier: "DViewControllerG") as! DViewControllerG
        des.iimage = imageD[indexPath.row]!!
        indexVal = indexPath.row

        
        self.navigationController?.pushViewController(des, animated: true)
        
    }
}

