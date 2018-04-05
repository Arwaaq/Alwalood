//
//  ViewController.swift
//  names
//
//  Created by Tahani mohammed on 01/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

class ViewControllerN: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var dLetter = [0:" حرف أ ",1:" حرف ب",2:"حرف ت ",3:"حرف ث ",4:" حرف ج",5:"حرف ح ",6:"حرف خ ",7:"حرف د ",
                   8:" حرف ذ",9:" حرف ر",10:" حرف ز",11:" حرف س",12:"حرف ش ",13:" حرف ص",14:" حرف ض",15:"حرف ط ",16:"حرف ظ ",17:" حرف ع",18:"حرف غ",
                   19:" حرف ف ",20:"حرف ق ",21:" حرف ك",22:"حرف ل ",23:"حرف م ",24:"حرف ن ",25:"حرف ه",26:"حرف و",27:"حرف ي"]
    
    var Dnames = [0:["a":"أفنان","b":"أسماء","c":"أروى"],1:["a":"بدرية","b":"بسمة","c":" "],2:["a":"تهاني","b":" ","c":" "],3:["a":"ثريا","b":" ","c":" "],4:["a":"جواهر","b":" ","c":" "],5:["a":" حصة","b":" ","c":" "],6:["a":" خلود","b":" ","c":" "],7:["a":" دلال","b":" ","c":" "],8:["a":"ذكرى ","b":" ","c":" "],9:["a":"روان ","b":" ","c":" "],10:["a":" زهرة","b":" ","c":" "],11:["a":" سارة","b":" ","c":" "],12:["a":"شهد ","b":" ","c":" "],13:["a":" صالحة","b":" ","c":" "],14:["a":" ضحى","b":" ","c":" "],15:["a":" ","b":" ","c":" "],16:["a":" ","b":" ","c":" "],17:["a":"علياء ","b":" ","c":" "],18:["a":" غيداء","b":" ","c":" "],19:["a":" فاطمة","b":" ","c":" "],20:["a":"قمر ","b":" ","c":" "],21:["a":" كوثر","b":" ","c":" "],22:["a":"لمى ","b":" ","c":" "],23:["a":" مها","b":" ","c":" "],24:["a":" نورة","b":" ","c":" "],25:["a":"هند ","b":" ","c":" "],26:["a":" وعد","b":" ","c":" "],
                  27:["a":" ياسمين","b":" ","c":" "]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dLetter.count    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cell.label.text = dLetter[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard (name: "Main" , bundle: nil)
        
          let des = mainStoryboard.instantiateViewController(withIdentifier: "DViewController") as! DViewController
        
        des.na1 = Dnames[indexPath.row]!["a"]!
        des.na2 = Dnames[indexPath.row]!["b"]!
        des.na3 = Dnames[indexPath.row]!["c"]!

        self.navigationController?.pushViewController(des, animated: true)

    
    }
}



