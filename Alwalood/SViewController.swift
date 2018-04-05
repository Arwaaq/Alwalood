//
//  SViewController.swift
//  Alwalood
//
//  Created by Arwa  on 2/25/18.
//  Copyright © 2018 Mashael Gm. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SViewController: UIViewController {
    var ref:DatabaseReference?

    @IBOutlet weak var date: UIDatePicker!

    var weekNo: Int = 0
    var username:String = ""
    var email:String = ""
    var pass:String = ""
    
   var duedateString : String = ""
    var strigDate : String = ""
    @IBOutlet weak var laWe: UILabel!
    
    @IBAction func NEXT(_ sender: Any) {
        
        let period = date.date
        var dateComponent = DateComponents()
        dateComponent.day = 280
        let duedate = Calendar.current.date(byAdding: dateComponent, to: period)!
        
        //before
        let today2 = Date()
        let calendar2 = Calendar.current
        let days2 = calendar2.dateComponents([Calendar.Component.day], from:today2, to:duedate)
        let alldays2 = days2.day
        
        print("No days" , alldays2)
        
        //after
        let today3 = Date()
        let calendar3 = Calendar.current
        let days3 = calendar3.dateComponents([Calendar.Component.day], from:today3, to:duedate)
        let alldays3 = days3.day
        if(alldays3! > 280 ) {
            print("After")
            showMessage(title: "خطأ", msg: "يرجى التأكد من التاريخ المُدخل")

        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
         strigDate =  dateFormatter.string(from: duedate)
        print(strigDate)
        
        
        if ( alldays2! < 0 ){
            showMessage(title: "خطأ", msg: "يرجى التأكد من التاريخ المُدخل")
        }
        else {
            showMessage(title: "تاريخ ولادتك المتوقع", msg: (" " + strigDate))
        }
        laWe.text = "انضمي معنا بالضفط على الزر التالي"
    }
    
    
    @IBAction func CA(_ sender: Any) {

      //duedate
        let period = date.date
        
        var dateComponent = DateComponents()
        dateComponent.day = 280
      let duedate = Calendar.current.date(byAdding: dateComponent, to: period)!
        
        //dayNO
        let today = Date()
        let calendar = Calendar.current
        let days = calendar.dateComponents([Calendar.Component.day], from:period, to:today)
        let CurrentDay = days.day
 
        //weekNo
        weekNo  =    ( CurrentDay! / 7 )
        print("WEEK\(weekNo)")
        
        if(weekNo > 40 || weekNo < 0){
            showMessage(title: "خطأ", msg: "يرجى التأكد من التاريخ المُدخل")
         //performSegue(withIdentifier: "dateError", sender: self)
        }
        ////////////////////////////
    //   let user = ["Username":self.user, "Email":email, "Password1":pass, "WeekNo":weekNo] as [String:Any]
     //self.ref?.child("User").childByAutoId().setValue(user)
        self.ref?.child("User").child(Auth.auth().currentUser!.uid).child("WeekNo").setValue(weekNo)
        self.ref?.child("User").child(Auth.auth().currentUser!.uid).child("Email").setValue(email)
        self.ref?.child("User").child(Auth.auth().currentUser!.uid).child("Username").setValue(username)
        self.ref?.child("User").child(Auth.auth().currentUser!.uid).child("BirthDate").setValue(strigDate)



        ////////////
        

        performSegue(withIdentifier: "home", sender: self)


    }
    
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "MySegue") {
            let des: ViewController2 = segue.destination as! ViewController2
           // des.text2 = "HELLO!!!"
          //  des.week = weekNo
        des.weeek = weekNo
         // des.d = strigDate
            
        }
        
        
  
    }

    
}
