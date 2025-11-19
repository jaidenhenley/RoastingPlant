//
//  ContentView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/13/25.
// testing

import SwiftUI


struct ContentView: View {
    let food: [Food] = [
        Food(name: "Croissant", assetName: "Croissant"),
        Food(name: "Choc Croissant", assetName: "ChocCroissant")
    ]
    let coffee: [Coffee] = [
        Coffee(name: "Dark Coffee", assetName: "DarkDrip", coffeeType: .drips),
        Coffee(name: "Medium Coffee", assetName: "LightDrip", coffeeType: .drips),
        Coffee(name: "Light Coffee", assetName: "MediumDrip",coffeeType: .drips),
        Coffee(name: "Cappuccino", assetName: "Capp",coffeeType: .espresso),
        Coffee(name: "Latte", assetName: "Latte", coffeeType: .espresso),
        Coffee(name: "Americano", assetName: "Americano", coffeeType: .espresso)
    ]
    
    var body: some View {
        NavigationStack { // makes the user able to go to customization view
            //   CoffeeTitleView()
            ScrollView {
                HStack {
                    Text("Order")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                .padding(.vertical)
                
                
                VStack {
                    Text("Espresso:")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(coffee, id: \.name) { Coffee in
                                NavigationLink {
                                    CustomizationView(coffee: Coffee,)
                                        .navigationTitle("\(Coffee.name)")
                                        .toolbar {
                                            ToolbarItem(placement: .navigationBarTrailing) {
                                                Image("Logo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 40)
                                                
                                                
                                            }
                                        }
                                } label: {
                                    if Coffee.coffeeType == .espresso {
                                        CoffeeTileView(coffee: Coffee)
                                    }
                                }
                                
                                
                            }
                            
                        }
                    }
                    Text("Drip Coffee:")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(coffee, id: \.name) { Coffee in
                                NavigationLink {
                                    CustomizationView(coffee: Coffee,)
                                        .navigationTitle("\(Coffee.name)")
                                        .toolbar {
                                            ToolbarItem(placement: .navigationBarTrailing) {
                                                Image("Logo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 40)
                                                
                                                
                                            }
                                        }
                                } label: {
                                    if Coffee.coffeeType == .drips {
                                        CoffeeTileView(coffee: Coffee)
                                    }
                                }
                                
                                
                            }
                        }
                    }
                    Text("Food Options:")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(food, id: \.name) { Food in
                                NavigationLink {
                                    FoodCustomizationVIew()
                                        .navigationTitle("\(Food.name)")
                                        .toolbar {
                                            ToolbarItem(placement: .navigationBarTrailing) {
                                                Image("Logo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 40)
                                                
                                                
                                            }
                                        }
                                    
                                } label: {
                                    FoodTileView(food: Food)
                                }
                            }
                        }
                                
                            
                            
                            }
                        }
                    }
                }
            }
        }
    #Preview {
        ContentView()
    }
    

