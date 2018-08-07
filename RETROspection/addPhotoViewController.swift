//
//  addPhotoViewController.swift
//  RETROspection
//
//  Created by Ally Siva on 8/3/18.
//  Copyright © 2018 Ally Siva. All rights reserved.
//

import UIKit

class addPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

        var imagePicker = UIImagePickerController()
    
        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var titleInput: UITextField!
        @IBOutlet weak var captionInput: UITextField!
        @IBOutlet weak var emojiInput: UITextField!
        @IBOutlet weak var dateInput: UITextField!
    
    
        override func viewDidLoad() {
                    super.viewDidLoad()
                    imagePicker.delegate = self
        }
// keyboard dismissing
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
//camrea stuff
        @IBAction func cameraTapped(_ sender: Any) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    
        @IBAction func libraryTapped(_ sender: Any) {
            imagePicker.sourceType = .savedPhotosAlbum
            present(imagePicker, animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            //update photo w/ the photo the usre selected
            if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage {
//                imageView.image = selectedPhoto
                let fixedImage =
                imageUtilities.fixImageOrientation(imageSource: selectedPhoto)
                imageView.image = fixedImage
            }
            //go to our viewcontroller so the user can see the updater photo
            dismiss(animated: true, completion: nil)
        }
//save button
    @IBAction func saveTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            let photoToSave = Photo(entity: Photo.entity(), insertInto: context)
            photoToSave.caption = captionInput.text
            photoToSave.emoji = emojiInput.text
            photoToSave.title = titleInput.text
            photoToSave.date = dateInput.text
            
            if let userImage = imageView.image {
                if let userImageData = UIImagePNGRepresentation(userImage) {
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
