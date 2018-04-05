//
//  InfoViewController.swift
//  Alwalood
//
//  Created by Arwa  on 3/30/18.
//  Copyright © 2018 Mashael Gm. All rights reserved.
//

import UIKit
import Firebase


class InfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var GeneralInfoList = Array<GeneralInfo>()

    @IBOutlet weak var CollectionList2: UICollectionView!
    
    var ref:DatabaseReference?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("General")
        
        ref?.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                self.GeneralInfoList.removeAll()
                
                for infos in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let infoObject = infos.value as? [String: AnyObject]
                    let name  = infoObject?["Name"] as! String
                    let des = infoObject?["Desc"] as! String
                    let im = infoObject?["Image"] as! String
                    
                    let inn = GeneralInfo(Label: name, description: des, Image: im)
                    
                    self.GeneralInfoList.append(inn)
                    
                    
                }
                
            }
        })
        CollectionList2.delegate = self
        CollectionList2.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchInfo() {
    
    ref = Database.database().reference().child("General")
    
    ref?.observe(DataEventType.value, with: { (snapshot) in
    
    if snapshot.childrenCount > 0 {
    self.GeneralInfoList.removeAll()
    
    for infos in snapshot.children.allObjects as! [DataSnapshot] {
    
    let infoObject = infos.value as? [String: AnyObject]
    let name  = infoObject?["Name"] as! String
    let des = infoObject?["Desc"] as! String
    let im = infoObject?["Image"] as! String
    
        let inn = GeneralInfo(Label: name, description: des, Image: im)
    
    self.GeneralInfoList.append(inn)
    
    
    }
    
    }
    })
    }//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GeneralInfoList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return GeneralInfoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        var i = 0
        for s in GeneralInfoList {
            cell.InfoLabel2.text =  GeneralInfoList[i].Label!
            cell.InfoImage2.image = UIImage (named: self.GeneralInfoList[i].Image!)
            i+=1
        }
       
       
        
        return cell
    }
    
}
