//
//  DetailedViewController.swift
//  College
//
//  Created by Zachary Rutherford on 7/26/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit
import SafariServices

class DetailedViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var college = CollegeClass()
    var imagePicker = UIImagePickerController()
    var urlString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = college.enrollment
        imageView.image = college.image
        siteTextField.text = college.url
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action : "dismissKeyboard")
        view.addGestureRecognizer(tap)
        var urlString = "\(siteTextField.text)"
        var imagePicker = UIImagePickerController()
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func helper1(){
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func helper2(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
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
        college.url = siteTextField.text!
    }
    
    @IBAction func onTappedChangePictureButton(sender: UIButton) {
        
        let actionController = UIAlertController(title: "Select an option", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let takePicture = UIAlertAction(title: "Take Photo", style: .Default) { (action) in
            self.helper2()
        }
        let selectPicture = UIAlertAction(title: "Select Photo", style: .Default) { (action) in
            self.helper1()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionController.addAction(takePicture)
        actionController.addAction(cancelAction)
        actionController.addAction(selectPicture)
        
        self.presentViewController(actionController, animated: true, completion: nil)
        
        
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onTappedVisitButton(sender: UIButton) {
        let url = NSURL(string: urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
        dvc.college = college
    }
    
    
}
