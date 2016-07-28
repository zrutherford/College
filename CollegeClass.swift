//
//  CollegeClass.swift
//  College
//
//  Created by Zachary Rutherford on 7/26/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit

class CollegeClass: NSObject {

    var name = ""
    var location = ""
    var enrollment = ""
    var image = UIImage(named: "Default")
    var url = ""
    
    convenience init(name: String, location: String, enrollment: String, image: UIImage, url: String) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
        self.url = url
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }

}
