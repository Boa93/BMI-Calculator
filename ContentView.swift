//
//  ContentView.swift
//  BMIswift
//
//  Created by Boa on 13/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText = ""
    @State private var HeightText = ""
    @State private var bmi: Double = 0
    @State private var clasfied = "(:"
    
    var body: some View {
        VStack {
            Spacer()
            Text("BMI Calculator")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter your Weight (in kilograms like: 75)", text: $weightText )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            
            TextField("Enter your Height (in meters, like: 1.7)", text: $HeightText )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            Spacer()
            Button(action:{
                let weight = Double(weightText)!
                let height = Double(HeightText)!
                bmi = weight / (height * height)
                
                if bmi < 18.5 {
                    clasfied = "Underweight"
                }
                else if bmi < 24.9 {
                    clasfied = "healthy weight"
                }
                else if bmi < 29.9 {
                    clasfied = "Overweight"
                }
                else {
                    clasfied = "Obese"
                }
            })
            {
                Text("Calculate")
            }
            .foregroundColor(.white)
            .padding(10)
            .background(Color.red)
            .cornerRadius(10)
            
            
            Text("Your BMI: \(bmi,specifier: "%.1f") ,\(clasfied)")
                .font(.title2)
                .padding(.top, 200)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
