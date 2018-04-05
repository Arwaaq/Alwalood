//
//  ViewControllerTwo.swift
//  names
//
//  Created by Tahani mohammed on 03/07/1439 AH.
//  Copyright © 1439 Tahani mohammed. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var letterTwo = [0:" حرف أ ",1:" حرف ب",2:"حرف ت ",3:"حرف ث ",4:" حرف ج",5:"حرف ح ",6:"حرف خ ",7:"حرف د ",
                   8:" حرف ذ",9:" حرف ر",10:" حرف ز",11:" حرف س",12:"حرف ش ",13:" حرف ص",14:" حرف ض",15:"حرف ط ",16:"حرف ظ ",17:" حرف ع",18:"حرف غ",
                   19:" حرف ف ",20:"حرف ق ",21:" حرف ك",22:"حرف ل ",23:"حرف م ",24:"حرف ن ",25:"حرف ه",26:"حرف و",27:"حرف ي"]
    
    var namesTwo = [0:["a":"أحمد","b":" ","c":" "],1:["a":"بدر","b":"بندر","c":" "],2:["a":"تركي","b":" ","c":" "],3:["a":" ثامر","b":" ","c":" "],4:["a":" ","b":" ","c":" "],5:["a":"حمد ","b":" ","c":" "],6:["a":" خالد","b":" ","c":" "],7:["a":" ","b":" ","c":" "],8:["a":" ","b":" ","c":" "],9:["a":"راشد ","b":" ","c":" "],10:["a":" ","b":" ","c":" "],11:["a":" ","b":" ","c":" "],12:["a":" شاهين","b":" ","c":" "],13:["a":"صالح ","b":" ","c":" "],14:["a":" ","b":" ","c":" "],15:["a":" طارق","b":" ","c":" "],16:["a":" ","b":" ","c":" "],17:["a":" عبدالله","b":" عبدالرحمن","c":" عبدالعزيز"],18:["a":" ","b":" ","c":" "],19:["a":"فيصل ","b":" فهد","c":" "],20:["a":" ","b":" ","c":" "],21:["a":" كامل","b":" ","c":" "],22:["a":" ","b":" ","c":" "],23:["a":" محمد","b":" ","c":" "],24:["a":" ناصر","b":" ","c":" "],25:["a":" ","b":" ","c":" "],26:["a":" ","b":" ","c":" "],27:["a":"يزن ","b":" ياسين","c":" "]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return letterTwo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCellTwo", for: indexPath) as! MainCollectionViewCellTwo
        cell.labelTwo.text = letterTwo[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard (name: "Main" , bundle: nil)
        
        let des2 = mainStoryboard.instantiateViewController(withIdentifier: "DViewControllerTwo") as! DViewControllerTwo
        
        des2.nam1 = namesTwo[indexPath.row]!["a"]!
        des2.nam2 = namesTwo[indexPath.row]!["b"]!
        des2.nam3 = namesTwo[indexPath.row]!["c"]!
        
        self.navigationController?.pushViewController(des2, animated: true)
        
        
    }
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


