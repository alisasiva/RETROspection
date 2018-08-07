//
//  CollectionViewController.swift
//  RETROspection
//
//  Created by Ally Siva on 8/3/18.
//  Copyright © 2018 Ally Siva. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController  {

    var photos : [Photo] = []
    let photo : Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(photos.count)
        getPhotos()
    }
    
    func getPhotos() {
        print("get photos calllllllllled")
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                if let unwrappedPhotos = coreDataPhotos {
                    photos = unwrappedPhotos
                    tableView.reloadData()
                }
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("HEELLLLLLOOOOOOO")
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("in cellforrow At")
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage
            }
        }
        return cell
    }
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "moveToDetail"{
////            if let photoDetailView = segue.destination as? PhotoDetailViewController {
//                if let photoToSend = sender as? Photo {
//                    photoDetailView.photo = photoToSend
//                }
//            }
//        }
//    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


