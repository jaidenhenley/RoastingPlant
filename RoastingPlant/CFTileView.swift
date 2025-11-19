//
//  CoffeeTileView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/13/25.
//
// This view is to create the tiles for the content view

import SwiftUI
struct FoodTileView: View {
    var food: Food // brings all of the food parameters into the view
    var body: some View {
        VStack {
            Image(food.assetName)
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
                .padding()
            VStack {
                Text(food.name) // inserts food name
                    .frame(maxWidth: 150, alignment: .leading)
                    .foregroundStyle(.white)
                    .font(.body)
                
               Text("Hot or Cold")
                .frame(maxWidth: 150, alignment: .leading)
                .padding(.bottom)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.light)
            }
            .padding(.leading)
        }
        .background(RoundedRectangle(cornerRadius: 16))
        .foregroundStyle(Color.main)
      .frame(width: 196, height: 218)
    }
    
}


struct CoffeeTileView: View {
    var coffee: Coffee // brings all of the coffee parameters into the view
    
    var body: some View {
        VStack {
            Image(coffee.assetName) // inserts coffee image
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
                .padding()

            VStack {
                Text(coffee.name) // inserts coffee name
                    .frame(maxWidth: 150, alignment: .leading)
                    .foregroundStyle(.white)
                    .font(.body)
                
               Text("Hot or Iced")
                .frame(maxWidth: 150, alignment: .leading)
                .padding(.bottom)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.light)
            }
            .padding(.leading)
            

            
            
        }
        .background(RoundedRectangle(cornerRadius: 16))
        .foregroundStyle(Color.main)
      .frame(width: 196, height: 218)

    }

    
    }


#Preview("Coffee Tile") {
    CoffeeTileView(coffee: Coffee(name: "Cappuccino", assetName: "Capp"))
    FoodTileView(food: Food(name: "Croissant", assetName: "Croissant"))

}
