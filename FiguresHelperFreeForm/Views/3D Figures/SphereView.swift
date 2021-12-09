//
//  SphereView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct SphereView: View {
    
    // MARK: Stored properties
    // what ever the user adds to the text field
    @State var providedRadius = ""
    
    // MARK: Computed properties
    
    //Check the input given by the user
    // If possible, return a double
    //otherwise (bad input) return nil
    
    var radius: Double? {
      
        //Test on the provided input
        //1. Ensure that we can simply change the input into a Double
        //2. Ensure that the value as a Double is more then 0
        //with a guard statement we list the things we wish to be true... provide an action to carry out when those
        //conditions are not met.
        
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            //when we test our failed, we do not have a valid radius
            return nil
        }
        //if we get here then we know our radius is good
        return radius
    }
   
    // attempts to calculate the area
    //and if cant... returns nil
    var area: Double? {
        //is the input actually a double, or is it Double?(might be nil)
        
        guard let radius = radius
        else {
            //we didnt have a valid radius, we cant calculate the area...
            return nil
        }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "sphere",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                Slider(value: $radius,
                       in: 0.0...100.0,
                       step: 0.1,
                       label: {
                    Text("Radius")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                
                // Output: Radius
                SliderValueView(value: radius)
                
                SectionLabelView(text: "Surface Area", variable: "")
                
                // Output: Area
                OutputValueView(value: surfaceArea, suffix: "cubed units")
                
            }
            
        }
        .navigationTitle("Sphere")
        .padding()
    }
}

struct SphereView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SphereView()
        }
    }
}
