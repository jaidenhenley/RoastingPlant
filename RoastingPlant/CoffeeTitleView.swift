//
//  CoffeeTitleView.swift
//  RoastingPlant
//  Header and Order word only
//  Created by Jaiden Henley on 10/13/25.
//
// This view is for creating a consistent header on the ContentView
import SwiftUI
struct CoffeeTitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Order")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .padding()
            }
            .padding(.vertical)
    

        }
    }
}

#Preview {
    CoffeeTitleView()

 
}
