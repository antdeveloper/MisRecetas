//
//  Recipe.swift
//  Mis Recetas
//
//  Created by Nicolas Tello on 09/12/16.
//  Copyright © 2016 Alain Nicolas Tello. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isFavorite: Bool = false
    var rating: String = "good"
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
}
