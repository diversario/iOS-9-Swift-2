//
//  AddMovieVC.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/13/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var movieImage: RoundedImage!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieURL: UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    
    var tap: UITapGestureRecognizer!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        tap = UITapGestureRecognizer(target: self, action: "onImgTap:")
        tap.delegate = self
        
        movieImage.userInteractionEnabled = true
        movieImage.addGestureRecognizer(tap)
    }
    
    func onImgTap(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }
    
    @IBAction func onSaveTapped(sender: UIBarButtonItem) {
        if
            let title = movieTitle.text where title != "",
            let desc = movieDesc.text where desc != "",
            let url = movieURL.text where url != "",
            let plot = moviePlot.text where plot != "",
            let image = movieImage.image
        {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.title = title
            movie.desc = desc
            movie.url = url
            movie.plot = plot
            
            movie.setMovieImage(image)
            
            context.insertObject(movie)
            
            do {
                try context.save()
                navigationController?.popViewControllerAnimated(true)
            } catch let e as NSError {
                print(e.debugDescription)
            }
        } else {
            
        }
    }
    
    @IBAction func onCancelTapped(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
}
