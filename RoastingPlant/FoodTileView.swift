//
//  FoodTileView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 11/10/25.
//

import SwiftUI

struct FoodTileView: View {
    var food: Food // brings all of the coffee parameters into the view
    
    var body: some View {
        VStack {
            Image(food.assetName) // inserts coffee image
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
                .padding()

            VStack {
                Text(food.name) // inserts coffee name
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


#Preview {
    FoodTileView(food: Food(name: "Croissant", assetName: "Croissant", temp: true))
}
