//
//  Coffee.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/13/25.
//

import Foundation
struct Food {
    var name: String
    var assetName: String
    var foodType: FoodType
    var toasted: Bool = false
    var topping: Topping = .None
}
struct Coffee {
    var decaf: Bool = false
    var extraShot: Int = 0
    var name: String
    var assetName: String
    var iced: Bool = false
    var sugar: Int = 0
    var size: Size = .Small
    var milkType: MilkType = .Whole
    var specialRequests: String?
    var customerName: String?
    var coffeeType: CoffeeType = .espresso
    
    func caffineAmount() -> Int {  // calculating the amount of caffine in the drink
        var caffineAmount = size.caffineAmount
        if extraShot == 1 {
            caffineAmount += 65
        }
        if extraShot == 2 {
            caffineAmount += 130
        }
        if extraShot == 3 {
            caffineAmount += 195
        }
        if decaf == true {
            caffineAmount -= caffineAmount
        }
        return caffineAmount
    }
    
    func basePrice() -> Double { // Adding 50¢ when iced = true
        var price = size.basePrice
        if iced == true {
            price += 0.5
        }
        return price
    }

    func calculateCaffeinePrice() -> Double { // calculating the price of the extra shots
        var price = 0.0
        
        if extraShot == 1 {
            price += 1.5
        }
        if extraShot == 2 {
            price += 2.5
        }
        if extraShot == 3 {
            price += 3.5
        }
        
        return price
    }

    func calculateDrinkPrice() -> Double { // calculating final drink price before tax
        var price = (basePrice() + calculateCaffeinePrice())
        if milkType == .Oat {
            price += 0.65
        }
        if milkType == .Soy {
            price += 0.75
        }
        if milkType == .Almond {
            price += 0.5
        }
        if milkType == .Whole {
            price += 0
        }
        return price
    }

    func milkPrice() -> Double {    // calculating the price of the milk by itself
        let price = calculateDrinkPrice() - size.basePrice
        return price
    }

    func calculateTaxPrice() -> Double {  // calculating the tax price
        let taxRate = 0.06
        let drinkPrice = calculateDrinkPrice()
        return drinkPrice * taxRate
    }

    func calculateFinalPrice() -> Double {  // calculating the final price of the drink including tax
        let drinkPrice = calculateDrinkPrice()
        let taxPrice = calculateTaxPrice()
        let caffeinePrice = calculateCaffeinePrice()
        return (drinkPrice + taxPrice)
    }
    
}
