//
//  resetPassword.swift
//  alwalood
//
//  Created by reem alsaud on 27/06/1439 AH.
//  Copyright © 1439 KSU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class resetPassword: UIViewController,UITextFieldDelegate{
    
    var ref: DatabaseReference!
    @IBOutlet weak var emailToSend: UITextField!
    override func viewDidLoad() {
        
        self.ref = Database.database().reference().child("User")
        emailToSend.delegate = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendPassword(_ sender: Any) {
        let enteredMail = emailToSend.text
        if enteredMail == ""{
            self.showMessage(title: "خطأ", msg: "لم يتم إدخال ايميل")
        }else{
            Auth.auth().sendPasswordReset(withEmail: enteredMail!, completion: { (error) in
                
                if error != nil{
                    self.showMessage(title: "خطأ", msg: "لم يتم العثور على الايميل")
                }else{
                    self.showMessage(title: "حالة الايميل" , msg: "تم ارسال الايميل بنجاح")
                    self.performSegue(withIdentifier: "goBackToHome", sender: self)
                }
            })
        }
    }
    
    //close keyboard after clicking return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

