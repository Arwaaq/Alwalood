//
//  ViewController.swift
//  Picker
//
//  Created by Arwa  on 2/14/18.
//  Copyright © 2018 Arwa . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class ViewController2: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

  
    @IBAction func LOGOUT(_ sender: Any) {
        
        self.showConMessage(title:"تأكيد",msg:"هل أنتي متأكدة من تسجيل الخروج")
    }
    
    func logOutCon(){
        if Auth.auth().currentUser != nil{
            do
            {
                try Auth.auth().signOut()
            }catch let error as NSError
            {
                print (error.localizedDescription)
            }
            print("success")
        }
    }
    func showConMessage(title: String, msg: String){
        let refreshAlert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: { (action: UIAlertAction!) in
            self.logOutCon()
            self.performSegue(withIdentifier: "FIRSTPAGE", sender: self)
        }))
        refreshAlert.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    var isSlideMenueHidden = true

    @IBOutlet weak var texttView: UITextView!
    @IBOutlet weak var Laheader: UILabel!
    
    
    @IBAction func TODD(_ sender: Any) {
        let ref = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict = snapshot.value as? [String:Any] {
                let w = userDict["WeekNo"] as! Int?
                self.weeek = w!
                //Do not cast print it directly may be score is Int not string
                print(self.weeek)
                
                if self.weeek == 0 {
                    self.pickerView.selectRow(self.weeek , inComponent: 0, animated: true)
                    self.texttView.text = self.ListInfo[self.weeek].content
                    self.Laheader.text = self.ListInfo[self.weeek].header
                    
                    let imageFile = self.ListInfo[self.weeek].imageV
                    let downloadImageRef = self.imageReference.child(imageFile!)
                    
                    let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
                        if let data = data {
                            let image = UIImage(data: data)
                            self.imageV.image = image
                        }
                        print ("NO ERROR")
                    }

                }else {
                
                self.pickerView.selectRow(self.weeek - 1 , inComponent: 0, animated: true)
                self.texttView.text = self.ListInfo[self.weeek - 1].content
              //  self.imageV.image = UIImage (named: self.ListInfo[self.weeek - 1].imageV!)
                self.Laheader.text = self.ListInfo[self.weeek - 1].header
                
                let imageFile = self.ListInfo[self.weeek - 1].imageV
                let downloadImageRef = self.imageReference.child(imageFile!)
                
                let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
                    if let data = data {
                        let image = UIImage(data: data)
                        self.imageV.image = image
                    }
                    print ("NO ERROR")
                }
                
            }
            }
        })
        
    }
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textView: UITextView!

    //ref to images folder in firebase to get pregnancy images
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
   
   
    
    var ListInfo = [Week]()
    var w:Int = 0
    var weeek:Int = 0
    
    var WeekList = [Week]()
    var WeekListNumber = [Week]()
    
    @IBOutlet weak var BirthD: UILabel!
    var weeks = [String]()
    var d: String = ""

    //view current week info once user logged in
/*
    @IBAction func TOD(_ sender: Any) {
    
        let ref = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)

        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict = snapshot.value as? [String:Any] {
                let w = userDict["WeekNo"] as! Int?
                self.weeek = w!
                //Do not cast print it directly may be score is Int not string
                print(self.weeek)
                self.pickerView.selectRow(self.weeek - 1 , inComponent: 0, animated: true)
                self.textV.text = self.ListInfo[self.weeek - 1].content
                self.imageV.image = UIImage (named: self.ListInfo[self.weeek - 1].imageV!)
                self.laHeader.text = self.ListInfo[self.weeek - 1].header

            }
        })
            

     
        ref?.child("User").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let w = value?["WeekNo"] as? String ?? ""
            print(w)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        */
        /////////////////////
        /*
        ref = Database.database().reference().child("User")
        
        let userid = Auth.auth().currentUser?.uid
        
        let  userref = ref?.child(byAppendingPath: userid!)
        userref?.observe(DataEventType.value, with: { (snapshot) in
            for infos in snapshot.children.allObjects as! [DataSnapshot] {
                print("Hello")
                
                let infoObject = infos.value as? [String: AnyObject]
                let w  = infoObject?["WeekNo"] as! String?
                
                print(w)
            }
        })
        */

        //textV.text = ListInfo[weeek - 1].content
        //imageV.image = UIImage (named: ListInfo[weeek - 1].imageV!)
       // laHeader.text = ListInfo[weeek - 1].header
        
        
    


    let pickerView = UIPickerView()
    var rotationAngle: CGFloat!
    let width:CGFloat = 100
    let height:CGFloat = 100
    
    func Showbirth() {
        
        let ref2 = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)
        
        ref2.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict2 = snapshot.value as? [String:Any] {
                let w2 = userDict2["BirthDate"]
                self.d = w2! as! String
                //Do not cast print it directly may be score is Int not string
                print(self.d)
                self.BirthD.text = self.d
                
            }
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
 SlideMenuConst.constant = -305
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.layer.borderColor = UIColor.purple.cgColor
        //pickerView.layer.borderWidth = 1.5 //1.5
        //   pickerView.layer.backgroundColor = UIColor.lightGray.cgColor
        pickerView.layer.backgroundColor = UIColor.clear.cgColor
        


        //pickerview rotation
        rotationAngle = -90  * (.pi/180)
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle )
        
        //pickerview creation
        pickerView.frame = CGRect(x: 0 - 150 , y: 100, width: view.frame.width + 300  , height: 70)
        pickerView.bringSubview(toFront: pickerView)
        // pickerView.center = self.view.center
        self.view.addSubview(pickerView)
        
        //fill the array
        popluatArray()
        fetch()

        //view current week number and content,, index start at 0 once user register
    // pickerView.selectRow(weeek - 1 , inComponent: 0, animated: true)
 // textV.text = ListInfo[weeek - 1].content
         //   imageV.image = UIImage (named: ListInfo[weeek - 1].imageV!)
              //  laHeader.text = ListInfo[weeek - 1].header
       
            
      /*  var nameValue: String = ""
        
        databaseHandle = ref?.child("User").observe(.childAdded, with:{(snapshot)in
            let name = snapshot.childSnapshot(forPath: "Username")
            nameValue = (name.value as? String)!
            
            if(nameValue == self.usernameNEW) {
                self.checkLa.text = " الرجاء التأكد من اسم المستخدم المدخل"
                // self.performSegue(withIdentifier: "error", sender: self)
                print(nameValue)
                print(self.usernameNEW)
                print("username Exist")
            }
*/
        
        
        let ref = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)
      ref.observeSingleEvent(of: .value, with: { (snapshot) in
        
        if let userDict = snapshot.value as? [String:Any] {
                let w = userDict["WeekNo"] as! Int?
            let birth = userDict["BirthDate"] as! String?
                self.weeek = w!
            self.d = birth!
            self.BirthD.text = " موعد الولادة المتوقع \(self.d) "
                print(self.weeek)
            
            if self.weeek == 0 {
                self.pickerView.selectRow(self.weeek , inComponent: 0, animated: true)
                self.texttView.text = self.ListInfo[self.weeek].content
                self.Laheader.text = self.ListInfo[self.weeek].header
                
                let imageFile = self.ListInfo[self.weeek].imageV
                let downloadImageRef = self.imageReference.child(imageFile!)
                
                let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
                    if let data = data {
                        let image = UIImage(data: data)
                        self.imageV.image = image
                    }
                    print ("NO ERROR")
                }
                
            }else {

                self.pickerView.selectRow(self.weeek - 1 , inComponent: 0, animated: true)
                self.texttView.text = self.ListInfo[self.weeek - 1].content
               // self.imageV.image = UIImage (named: self.ListInfo[self.weeek - 1].imageV!)
                self.Laheader.text = self.ListInfo[self.weeek - 1].header
            
            let imageFile = self.ListInfo[self.weeek - 1].imageV
            let downloadImageRef = self.imageReference.child(imageFile!)
            
            let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    self.imageV.image = image
                }
                print ("NO ERROR")
            }
        

            }
        }
        })
 
     
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var SlideMenuConst: NSLayoutConstraint!
    @IBAction func OrgPressed(_ sender: UIBarButtonItem) {
        
        
        let ref2 = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)
        
        ref2.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict2 = snapshot.value as? [String:Any] {
                let w2 = userDict2["Username"] as! String
                //self.d = w2! as! String
                //Do not cast print it directly may be score is Int not string
                self.welcomeLabel.text = "أهلا بكِ، \(w2)"
                
            }
        })
        
        
        
        if isSlideMenueHidden {
            SlideMenuConst.constant = 0
            
            UIView.animate(withDuration: 0.3 , animations: {
                self.view.layoutIfNeeded()
            })
        }else {
            SlideMenuConst.constant = -320
            
            UIView.animate(withDuration: 0.3 , animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        isSlideMenueHidden = !isSlideMenueHidden
    }
    func numberOfComponents(in newPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weeks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
       let view = UIView()
        view.frame = CGRect (x: 0, y: 0, width: width, height: height)
        
        let label = UILabel()
        label.frame = CGRect (x: 0, y: 0, width: width, height: height)
        label.textAlignment = .center
        label.textColor = UIColor.purple
        label.text = weeks[row]
        
        if row == weeek - 1 {
            label.textColor = UIColor.purple
            label.font = UIFont.boldSystemFont(ofSize: 20)
        }
        view.addSubview(label)
        
        //rotate view
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return view
        
    }
    
    /*
    func ReadContent(){
        
        let path = Bundle.main.path(forResource: "Weeks", ofType:"plist")
        let url = URL(fileURLWithPath: path! )
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        
        let dicArray = plist as! [[String:String]]
        
        for dic in dicArray {
            WeekList.append(Week(weekNo: dic["WeekNo"]!, imageV: dic["image"]!,header: dic["header"], content: dic["Content"]!))
        }
    }
    */
    
    func pickerView(_ newPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        var i = 0
        for s in ListInfo {
            if weeks[row] == ListInfo[i].weekNo {
                texttView.text = ListInfo[i].content
               // imageV.image = UIImage (named: ListInfo[i].imageV!)
                Laheader.text = ListInfo[i].header
                
                let imageFile = self.ListInfo[i].imageV
                let downloadImageRef = self.imageReference.child(imageFile!)
                
                let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
                    if let data = data {
                        let image = UIImage(data: data)
                        self.imageV.image = image
                    }
                    print ("NO ERROR")
                }
                
              
            }
            
            
            i+=1
        }//for
   
        /*
        var i = 0
        for w in WeekList {
            if weeks[row] == WeekList[i].weekNo {
                imageV.image = UIImage (named: WeekList[i].imageV!)
                laHeader.text = WeekList[i].header
                textV.text = WeekList[i].content}
            i+=1
        }
 */
        
    }//
    
    
    
    func popluatArray(){
        let path2 = Bundle.main.path(forResource: "WeeksNumbers", ofType:"plist")
        let url2 = URL(fileURLWithPath: path2! )
        let data2 = try! Data(contentsOf: url2)
        let plist2 = try! PropertyListSerialization.propertyList(from: data2, options: .mutableContainers, format: nil)
        
        let dicArray2 = plist2 as! [[String:String]]
        
        for dic in dicArray2 {
            WeekListNumber.append(Week(weekNo: dic["WeekNo"]!))
        }
        
        var i = 0
        for w in WeekListNumber {
            weeks.append(WeekListNumber[i].weekNo!)
            i+=1
        }
    }//
    
    
    func fetch() {
        
        ref = Database.database().reference().child("Info")
        
        ref?.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                self.ListInfo.removeAll()
                
                for infos in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let infoObject = infos.value as? [String: AnyObject]
                    let c  = infoObject?["content"]
                    let h = infoObject?["header"]
                    let im = infoObject?["image"]
                    let w = infoObject?["weekNo"]
                   
                   
 
                    
                    let inn = Week(weekNo: w as! String?, imageV: im as! String?, header: h as! String?, content: c as! String?)
                    
                    self.ListInfo.append(inn)
                 
                    
                }

            }
        })

    }//fetch
  
    func fetchImg(){
        
        var im = ""
        
        ref = Database.database().reference().child("Info")
        
        ref?.observe(DataEventType.value, with: { (snapshot) in
            for infos in snapshot.children.allObjects as! [DataSnapshot] {
                
                let infoObject = infos.value as? [String: AnyObject]
                im = (infoObject?["image"] as! String?)!
            }
        })
            
        let downloadImageRef = self.imageReference.child("im")
        
        let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                self.imageV.image = image
            }
            print ("NO ERROR")
        }
        
      
            downloadTask.resume()

    }//
}





