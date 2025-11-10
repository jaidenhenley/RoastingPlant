//
//  CustomizationView.swift
//  RoastingPlant
//
//  Created by Jaiden Henley on 10/14/25.
//

import SwiftUI

struct CustomizationView: View {
    
    @State var showingConfirmation = false
    @State var showingAlert: Bool = false
    @State var showingSheet: Bool = false
    
    @State var coffee: Coffee
    @State private var customerName: String = ""
    @State private var sRequests: String = ""
    
    
    var body: some View { 
        ScrollView {
            VStack{
                ZStack {
                    Color.main
                        .frame(width: 190, height: 190)
                        .cornerRadius(16)
                    
                    Image(coffee.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                }
                
                
                HStack {
                    Text("Size")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .padding(.horizontal)
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Caffeine Content"),
                            message: Text("1 Shot = 65mg\nSmall(12oz) = 1 Shot\nMedium(16oz) = 2 Shots\nLarge(20oz) = 3 Shots")
                        )
                    }
                    
                    
                }
                
                Picker("", selection: $coffee.size) {
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
                
                
                Text("Type of Milk")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .padding(.horizontal)
                
                Picker("", selection: $coffee.milkType) {
                    ForEach(MilkType.allCases, id:\.self) { milk in
                        Text(milk.rawValue)
                        
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                    Stepper("Extra Shots:   \(coffee.extraShot)", value:$coffee.extraShot, in:0...3)
                        .font(.title)
                
                .padding(.horizontal)
                
                Toggle("Decaf", isOn:$coffee.decaf)
                    .padding(.horizontal)
                    .font(.title)
                
           
                    Stepper("Sugar Packets:   \(coffee.sugar)", value:$coffee.sugar, in:0...5)
                    .font(.title)
                .padding(.horizontal)
                
                
                Toggle("Iced", isOn:$coffee.iced)
                    .padding(.horizontal)
                    .font(.title)
                
                VStack(spacing: 30) {
                    TextField("Enter your name", text:$customerName)
                        .frame(width: 250)
                        .textFieldStyle(UnderlineTextFieldStyle())
                        .multilineTextAlignment(.leading)
                    
                    TextField("Special Requests", text:$sRequests)
                        .frame(width: 250)
                        .textFieldStyle(UnderlineTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }
                
                
                Button("Order") {
                    
                    updateOrder()
                    showingSheet.toggle()
                }
                .foregroundStyle(.black)
                .frame(width: 100, height: 44)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 1.0, green: 0.6, blue: 0.0),
                                    .purple,
                                    .blue
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
                .padding()
                
            }
            .sheet(isPresented: $showingSheet) {
                
                OrderConfirmationView(coffee: coffee, customerName: customerName)
                
                
            }
        }
            
        
    }
    
    func updateOrder() {
        if sRequests != "" {
            coffee.specialRequests = sRequests
        }
        if customerName != "" {
            coffee.customerName = customerName
        }
   
    }
}

struct UnderlineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    CustomizationView(coffee: Coffee(name: "Latte", assetName: "Latte"))
}
