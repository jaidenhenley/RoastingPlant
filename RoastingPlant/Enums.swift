//
//  PickerSelection.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/15/25.
//

import Foundation

enum Topping: String, CaseIterable {
    case CreamCheese
    case Butter
    case None
}


enum Size: String, CaseIterable {
    case Small
    case Medium
    case Large
    var caffineAmount: Int {
        switch self {
        case .Small:
            return 65
        case .Medium:
            return 130
        case .Large:
            return 195
        }
    }
    var basePrice: Double {
        switch self {
        case .Small:
            return 6.49
        case .Medium:
            return 6.99
        case .Large:
            return 7.79
            
        }
    }
}

enum MilkType: String, CaseIterable {
    case Whole
    case Oat
    case Almond
    case Soy
}

enum CoffeeType: String, CaseIterable {
    case espresso
    case drips
}

enum FoodType: String, CaseIterable {
    case croissant
    case bagel
}
