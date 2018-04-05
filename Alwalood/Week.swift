//
//  Week.swift
//  Picker
//
//  Created by Arwa  on 2/15/18.
//  Copyright © 2018 Arwa . All rights reserved.
//

import Foundation

class Week {
    
    var weekNo: String?
    var imageV: String?
    var header: String?
    var content: String?
    
    init(weekNo:String?) {
        self.weekNo = weekNo
    }
    init(weekNo:String?, imageV:String?, header:String?, content:String? ) {
        self.weekNo = weekNo
        self.imageV = imageV
        self.header = header
        self.content = content
        
    }
    
 
}
