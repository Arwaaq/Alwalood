//
//  ViewController.swift
//  Alwalood
//
//  Created by Mashael Gm on 2/7/18.
//  Copyright © 2018 Mashael Gm. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController  {
    
    var ref:DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passTF2: UITextField!
    @IBOutlet weak var passTF1: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
 
    //textfields strings
    var usernameNEW: String = ""
    var emailNEW:String = ""
    var  pass1NEW:String = ""
    var  pass2NEW:String = ""
    
    //validate info
    var findUser:Bool = true
    var flag : Bool = true
    var un : String = ""
    
    @IBOutlet weak var regButton: UIButton!
    
    @IBAction func toreg(_ sender: Any) {
          performSegue(withIdentifier: "toReg", sender: self)
    }
    
    @IBAction func loginBut(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func reg1(_ sender: Any) {
        //user info
        usernameNEW = usernameTF.text!
        emailNEW = emailTF.text!
        pass1NEW = passTF1.text!
        pass2NEW = passTF2.text!

        //check empty field
        if (usernameNEW.isEmpty || emailNEW.isEmpty || pass1NEW.isEmpty || pass2NEW.isEmpty) {
            self.changeFlag()
            showMessage(title: "خطأ", msg: "يرجى التأكد من تعبئة جميع الحقول ") }
    
    //same pass
    if(pass1NEW != pass2NEW) {
    self.changeFlag()
    showMessage(title: "خطأ", msg: "يرجى التأكد من مطابقة كلمة المرور")

    
    }

       //Register
         
        
            ref = Database.database().reference().root
        Auth.auth().createUser(withEmail: emailNEW,password:pass1NEW, completion: { (user,error) in
            if error == nil
            {
 
                print("success")
                self.performSegue(withIdentifier: "Segue2", sender: self)
            }else{
                let myError = error?.localizedDescription
                
                self.showMessage(title: "خطأ", msg: "يرجى التأكد من البريد الإلكتروني المدخل")

                  print(myError)

            }
        })
 

        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Segue2")
        {
            let obj : SViewController  = segue.destination as! SViewController
            obj.username = usernameNEW
            obj.email = emailNEW
            obj.pass = pass1NEW
        }
    }

    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func changeFlag() {
        flag = false
    }
    
   
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


