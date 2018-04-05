//
//  SecondRegisterationViewController.swift
//  Alwalood
//
//  Created by Mashael Gm on 2/8/18.
//  Copyright © 2018 Mashael Gm. All rights reserved.
//

import UIKit

class SecondRegisteration: UIViewController{

    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func CA(_ sender: Any) {
        
        //duedate
        let period = date.date
        
        var dateComponent = DateComponents()
        dateComponent.day = 280
        let duedate = Calendar.current.date(byAdding: dateComponent, to: period)
        
        //dayNO
        let today = Date()
        let calendar = Calendar.current
        let days = calendar.dateComponents([Calendar.Component.day], from:period, to:today)
        let CurrentDay = days.day
        
        //weekNo
        let weekNo  =   CurrentDay! / 7
        print("WEEK\(weekNo)")
        
      //  laaa.text = "MY WEEK\(weekNo)"
        
    }
    
    
    @IBAction func NEXT(_ sender: Any) {
        
        performSegue(withIdentifier: "MySegue", sender: self)
    }
    
  
    
  //  @IBAction func calcBut(_ sender: Any) {
        
    //    print("weeeeeeek")

   //    var w = calcu()
        //duedate
        /*
        let period = date.date
        
        var dateComponent = DateComponents()
        dateComponent.day = 280
        let duedate = Calendar.current.date(byAdding: dateComponent, to: period)
        
        //dayNO
        let today = Date()
        let calendar = Calendar.current
        let days = calendar.dateComponents([Calendar.Component.day], from:period, to:today)
        let CurrentDay = days.day
        
        //weekNo
    let weekNo  =   CurrentDay! / 7
        
   // return weekNo
*/
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    /*
    @IBAction func butRe(_ sender: Any) {
        
        
        week = calcu()
        print("Week\(week)")
    }
    
   
    
    func calcu() -> Int {
        //duedate
        let period = date.date
        
        var dateComponent = DateComponents()
        dateComponent.day = 280
        let duedate = Calendar.current.date(byAdding: dateComponent, to: period)
        
        //dayNO
        let today = Date()
        let calendar = Calendar.current
        let days = calendar.dateComponents([Calendar.Component.day], from:period, to:today)
        let CurrentDay = days.day
        
        //weekNo
        let weekNo  =   CurrentDay! / 7
        print("WEEK\(weekNo)")
        
        return weekNo
        
    }
 
   

 
*/
  
}
