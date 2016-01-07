//
//  DeviledWizard.swift
//  rpgoop
//
//  Created by Ilya Shaisultanov on 1/5/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation

class DeviledWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wang", "Fish Sauce", "Number Two Pencil"]
    }
    
    override var type: String {
        return "Deviled Wizard"
    }
}