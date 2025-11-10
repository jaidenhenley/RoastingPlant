//
//  ContentView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/13/25.
//

import SwiftUI


struct ContentView: View {
    
    let coffee: [Coffee] = [
        Coffee(name: "Dark Coffee", assetName: "DarkDrip", coffeeType: .drips),
        Coffee(name: "Medium Coffee", assetName: "LightDrip", coffeeType: .drips),
        Coffee(name: "Light Coffee", assetName: "MediumDrip",coffeeType: .drips),
        Coffee(name: "Cappuccino", assetName: "Capp",coffeeType: .espresso),
        Coffee(name: "Latte", assetName: "Latte", coffeeType: .espresso),
        Coffee(name: "Americano", assetName: "Americano", coffeeType: .espresso)
    ]
    
    let food: [Food] = [
        Food(name: "Croissant", assetName: "Croissant", temp: true)
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

                    }
                }
            }
        }
    }
        

    #Preview {
        ContentView()
    }
    

