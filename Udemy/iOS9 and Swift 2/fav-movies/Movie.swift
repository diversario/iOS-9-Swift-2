//
//  Movie.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/13/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {
    func setMovieImage(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getMovieImage () -> UIImage {
        return UIImage(data: self.image!)!
    }
    
    static func getAll () -> [Movie] {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
        let fetchReq = NSFetchRequest(entityName: "Movie")
        
        do {
            return try context.executeFetchRequest(fetchReq) as! [Movie]
        } catch let e as NSError {
            print(e.debugDescription)
            return [Movie]()
        }
    }
}
