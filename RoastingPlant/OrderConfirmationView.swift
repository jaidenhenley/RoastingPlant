//
//  OrderConfirmationView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/16/25.
//

import SwiftUI

struct OrderConfirmationView: View {
    let coffee: Coffee
    @State private var selectedOption: String = "Select an Option"

    @State private var showingAlert = false
    @State var customerName: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            VStack {
            
                if let customerName = coffee.customerName {
                    Text("Thanks \(customerName) for your order!")
                        .padding(.horizontal)
                        .font(.title)
                        .fontWeight(.medium)
                } else {
                    
                    Text("Thanks for your order!")
                        .padding(.horizontal)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                Divider()
                    .frame(height: 0.7)
                    .overlay(.black.opacity(0.6))
                
                if coffee.iced == true {
                    
                    HStack {
                        VStack {
                            Text("\(coffee.size.rawValue) Iced \(coffee.name)")
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            
                            if coffee.extraShot == 0 {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                            } else if coffee.extraShot == 1 {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar, \(coffee.extraShot) Extra Shot")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)

                            } else {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar, \(coffee.extraShot) Extra Shots")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                            }
                        }
                        if coffee.milkPrice() == 0 {
                            VStack {
                                Text("$\(coffee.basePrice(), specifier: "%.2f")")

                            }
                            .padding(.horizontal)
                        } else {
                            VStack {
                                Text("$\(coffee.basePrice(), specifier: "%.2f")")
                                Text("$\(coffee.milkPrice(), specifier: "%.2f")")
                                    .font(.caption)
                            }
                            .padding(.horizontal)
                        }
                     
                    }
                    
                } else {
                    HStack {
                        VStack {
                            Text("\(coffee.size.rawValue) \(coffee.name)")
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            
                            
                            if coffee.extraShot == 0 {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                            } else if coffee.extraShot == 1 {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar, \(coffee.extraShot) Extra Shot")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)

                            } else {
                                Text("\(coffee.milkType) Milk, \(coffee.sugar) Sugar, \(coffee.extraShot) Extra Shots")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)

                            }
                        }
                        
                        if coffee.milkPrice() == 0 {
                            VStack {
                                Text("$\(coffee.basePrice(), specifier: "%.2f")")

                            }
                            .padding(.horizontal)
                        } else {
                            VStack {
                                Text("$\(coffee.basePrice(), specifier: "%.2f")")
                                Text("$\(coffee.milkPrice(), specifier: "%.2f")")
                                    .font(.caption)
                            }
                            .padding(.horizontal)
                        }

                        
                    }
                }
                
                Divider()
                    .frame(height: 0.7)
                    .overlay(.black.opacity(0.6))
                
                if let specialRequests = coffee.specialRequests {
                    Text("Special Requests: \(specialRequests)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                } else {
                    
                    Text("No special requests")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
                
                Text("Caffeine Amount: \(coffee.caffineAmount())mg")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Text("Subtotal          $\(coffee.calculateDrinkPrice(), specifier: "%.2f")")                .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .font(.caption)
                
                Text("Tax          $\(coffee.calculateTaxPrice(), specifier: "%.2f")")                .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .font(.caption)
                
                Text("Order Total     $\(coffee.calculateFinalPrice(), specifier: "%.2f")")                .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(8)
                    .font(.title3)
                
                VStack {
                    Divider()
                        .frame(height: 0.7)
                        .overlay(.black.opacity(0.6))
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Payment Method")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(selectedOption)")
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(15)
                        
                        Menu {
                            Button("Credit") {
                                selectedOption = "Credit Card"
                            }
                            Button("Gift Card") {
                                selectedOption = "Gift Card"
                            }
                            Button("Pay in store") {
                                selectedOption = "Pay in store"
                            }
                        } label: {
                            Label("", systemImage: "chevron.right")
                                .tint(.black)
                        }
                    }
                    .padding()
                    
                    
                    
                    Divider()
                        .frame(height: 0.7)
                        .overlay(.black.opacity(0.6))
                }
                
            }
            .navigationTitle("Confirm Order")
                .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        // Label containing the SF Symbol
                        Label("Settings", systemImage: "multiply")
                            .buttonStyle(.borderedProminent)
                            .tint(.gray)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        // Label containing the SF Symbol
                        Label("Settings", systemImage: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                 
                }
            }
        }
        .alert("Your order will be ready soon!", isPresented: $showingAlert) {
                 Button("Okay") {
                     dismiss()
                 }
             } message: {
                 Text("Thank you for ordering from Roasting Plant Coffee!")
             }
        
        Spacer()
        
    }
}

    #Preview {
        OrderConfirmationView(coffee: Coffee(name: "Latte", assetName: "Latte", iced: true), customerName: "Jaiden")
    }
