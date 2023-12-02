//
//  ContentView.swift
//  test
//
//  Created by Sanna Tupala on 2023-11-09.
//  Copyright © 2023 test. All rights reserved.
//

import SwiftUI

struct ContentView:

View {
var body: some View {
    
    VStack {
    
        Text("Susanna Tupala")
            .foregroundColor(Color.white)
            .padding(.all, 20.0)
            .frame(width: 200.0)
            .background(Color.green)
        
    
    Text("Uppgift 1")
        
        Spacer()
        
        Text("Botten")
            .foregroundColor(Color.blue)
            .padding(.bottom)
    }}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
