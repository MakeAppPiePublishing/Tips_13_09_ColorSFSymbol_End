//
//  SwiftUISFSymbol.swift
//  ColorSFSymbol
//
//  Created by Steven Lipton on 11/15/20.
//

import SwiftUI

struct ButtonLabel:View{
    @Binding var title:String
    @Binding var isTemplate:Bool
    @Binding var isRaining:Bool
    var body: some View{
        HStack{
            Spacer()
            Image(systemName:"\(isRaining ? "cloud.sun.rain.fill" : "cloud.sun.fill")")
                .renderingMode(isTemplate ? .template : .original)
        Text(title)
            .padding()
            Spacer()
            
        }
        .padding()
        .background(Color.secondary)
        .font(.title)
        .cornerRadius(10)
        .padding([.top],30)
        .padding([.leading,.trailing])
    }
}

struct SwiftUISFSymbol: View {
    @State var isTemplate:Bool = true
    @State var isRaining:Bool = false
    
    var body: some View {
        VStack {
            Text("Weather").font(.largeTitle).padding()
            Image(systemName:"\(isRaining ? "cloud.sun.rain.fill" : "cloud.sun.fill")")
                .renderingMode(isTemplate ? .template : .original)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .padding()
                
           
            Button(action:{isRaining.toggle()}){
                ButtonLabel(title: .constant("Image"), isTemplate: $isTemplate, isRaining: $isRaining)
            }
            Button(action:{isTemplate.toggle()}){
                ButtonLabel(title: .constant("Mode"), isTemplate: $isTemplate, isRaining: $isRaining)
            }
            Spacer()
        }
        .background(Color.blue)
        .accentColor(.white)
        .cornerRadius(20)
        .padding(10)
        
    }
}

struct SwiftUISFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISFSymbol()
    }
}
