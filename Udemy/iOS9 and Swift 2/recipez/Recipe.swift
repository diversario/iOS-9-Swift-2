//
//  Recipe.swift
//  recipez
//
//  Created by Ilya Shaisultanov on 1/11/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
}
