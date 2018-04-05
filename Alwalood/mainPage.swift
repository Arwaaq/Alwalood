//
//  ViewController.swift
//  alwalood
//
//  Created by reem alsaud on 23/06/1439 AH.
//  Copyright © 1439 KSU. All rights reserved.
//

import UIKit
import Firebase

class mainPage: UIViewController,UITextFieldDelegate {

    
    var ref: DatabaseReference!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    @IBOutlet weak var emailToSend: UITextField!

    @IBAction func sendPassword(_ sender: Any) {
        let enteredMail = emailToSend.text
        if enteredMail == ""{
            self.showMessage(title: "خطأ", msg: "يرجى إدخال البريد الإلكتروني")
        }else{
            Auth.auth().sendPasswordReset(withEmail: enteredMail!, completion: { (error) in
                
                if error == nil{
                    self.showMessage(title: "خطأ", msg: "لم يتم العثور على البريد الإلكتروني المُدخل")
                }else{
                    self.showMessage(title: "حالة الرسالة" , msg: "تم ارسال كلمة المرور الجديدة إلى البريد الإلكتروني بنجاح")
                    self.performSegue(withIdentifier: "goBackToHome", sender: self)

                }
            })
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.ref = Database.database().reference().child("User")
        
       // EmailTF.delegate = self
        //PasswordTF.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func signinPressed(_ sender: Any) {
        let enteredEmail = EmailTF.text
        let enteredPass = PasswordTF.text
        
        if enteredEmail == "" || enteredPass == "" {
            self.showMessage(title: "خطأ", msg: "الرجاء ادخال البريد الإلكتروني و كلمة المرور")
        }else{
            Auth.auth().signIn(withEmail: enteredEmail!, password: enteredPass!, completion: { (user, error) in
                if error == nil {
                    print("success")
                   self.performSegue(withIdentifier: "goToHome", sender: self)
                   //self.performSegue(withIdentifier: "testseg", sender: self)

                }else{
                    self.showMessage(title: "خطأ", msg: "تم ادخال البريد الإلكتروني او كلمة المرور بشكل خاطئ ")
                }
            })
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

}

