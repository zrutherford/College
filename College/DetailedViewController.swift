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
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = college.enrollment
        imageView.image = college.image
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action : "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = selectedImage
    }

    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = enrollmentTextField.text!
    }
    
    @IBAction func onTappedChangePictureButton(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onTappedTakePictureButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
}
