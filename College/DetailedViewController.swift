//
//  DetailedViewController.swift
//  College
//
//  Created by Zachary Rutherford on 7/26/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var college = CollegeClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = college.enrollment
        imageView.image = college.image
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = enrollmentTextField.text!
    }
    
}