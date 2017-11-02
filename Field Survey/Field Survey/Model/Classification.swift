//
//  Classification.swift
//  Field Survey
//
//  Created by Aidan Madden on 11/1/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import UIKit

enum Classification: String {
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
