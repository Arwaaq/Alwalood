//
//  User.swift
//  Alwalood
//
//  Created by Mashael Gm on 3/25/18.
//  Copyright © 2018 Mashael Gm. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

struct User {
    var username : String!
    var weekNo : String?
    var uid : String!
    var ref : DatabaseReference?
    var key : String?
    
    init (snapshot: DataSnapshot){
        key = snapshot.key
        ref = snapshot.ref
        username = snapshot.value!["Username"] as? NSString
        weekNo = snapshot.value!["WeekNo"] as? Int

        
    }
    
}
