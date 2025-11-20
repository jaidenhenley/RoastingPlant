//
//  FoodCustomizationVIew.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 11/19/25.
//

import SwiftUI

struct FoodCustomizationVIew: View {
    @State var food:Food
    
    @State private var customerName = ""
    @State private var specialRequests = ""
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Color.main
                        .frame(width: 190, height: 190)
                        .cornerRadius(16)
                    
                    Image(food.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                }
                Picker("", selection: $food.topping) {
                    ForEach(Size.allCases, id:\.self) { size in
                        Text(size.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .onAppear{
                    UISegmentedControl.appearance()
                        .selectedSegmentTintColor = .main
                    UISegmentedControl.appearance()
                        .setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
                }
                
                VStack(spacing: 30) {
                    TextField("Enter your name", text:$customerName)
                        .frame(width: 250)
                        .textFieldStyle(UnderlineTextFieldStyle())
                        .multilineTextAlignment(.leading)
                    
                    TextField("Special Requests", text:$specialRequests)
                        .frame(width: 250)
                        .textFieldStyle(UnderlineTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }
                
            }

        }
        
        
    }
}

#Preview {
    FoodCustomizationVIew(food: Food(name: "Bagel", assetName: "Bagel", foodType: .croissant))
}
