//
//  ContentView.swift
//  ChuckN_API
//
//  Created by Sanna Tupala on 2023-12-02.
//  Copyright © 2023 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Chuck API")
    .onAppear(){
    loadapi()
    }

    }
}

func loadapi() {
    guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else { return }

    do {
        let apitext = try String(contentsOf: url)
 print(apitext)
    } catch {
        print("Det gick fel")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

