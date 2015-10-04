//
//  ViewController.swift
//  cameraApp3
//
//  Created by Mirko Cukich on 10/3/15.
//  Copyright © 2015 Digital Mirko. All rights reserved.
//

import UIKit

// added UIImagePickerControllerDelegate to conform to the image picker protocols
// added UINavigationControllerDelegate we will need to navigate between the camera 
// view and the photo library, it will be infered and we will be adhering to its protocol
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Image View
    @IBOutlet weak var imageView: UIImageView!
    
    // Created Variable imagePicker and it is a UIImagePickerController(), 
    // we want to call upon this and access the methods and protcols within
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // image loads up when the app does so it isnt blanks
        imageView.image = UIImage(named: "ginger.jpg")
        
        // establishing UIImagePickerControllerDelegate equal to self which is the view controller
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Camera Button, when we want to snap a photo from devices camera
    @IBAction func cameraBtn(sender: UIBarButtonItem) {
        
        // Won't work on simulator, will on devices
        // accessing the camera as the source type
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        // present that camera view controller
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // Photo Library Button, we want to get image from library
    @IBAction func libraryBtn(sender: UIBarButtonItem) {
        
        // Accessing PhotoLibrary
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // present that photo library 
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    // adding the ability now to select image from the camera or the photo library 
    // and display on image view
    
    // when we click on an image whether its one we took with our camera or one thats in the photo library
    // its going to store this imagePickerContoller from our UIImage PickerContoller
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        // setting our imageView.image to the info that is from our image picker original image yes its an optional as a UIImage
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        // dismiss view controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

