//
//  ContentView.swift
//  ChuckN_API
//
//  Created by Sanna Tupala on 2023-12-02.
//  Copyright © 2023 test. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var apistuff = ChuckAPI()

    var body: some View {
        Text(apistuff.joketext)
            .onAppear {
                self.apistuff.loadAPI { result in
                    switch result {
                    case .success:
                        // Handle success if needed
                        break
                    case .failure(let error):
                        // Handle error
                        print("Error: \(error)")
                    }
                }
            }
    }
}


/* old code
import SwiftUI

struct ContentView: View {

    @StateObject var apistuff = ChuckAPI()
    var body: some View {
    
        Text(apistuff.joketext)
    .onAppear(){
        Task {
            await; apistuff.loadapi()
        }
 // old code end
 
        // from chatgtp
        let chuckAPI = ChuckAPI()
        chuckAPI.loadAPI { result in
            switch result {
            case .success:
                // Handle success
                break
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
        //end of chatgpt

    }
}

/*
    func loadapi(); do {
    var url = URL(string: "https://api.chucknorris.io/jokes/random"); else do { return }

    do {
    var (apidata, apiresp) = try await
    URLSession.shared.data(from: url)
        
        print(apidata.count)
       
    let decoder = JSONDecoder()
    var thejoke try = decoder.decode(Chuckjoke.self, from: apidata)
    
    print(thejoke.value)
 
    joketext = thejoke.value
    
    } catch {
        print("Error reading info")
    }} */


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*

    do {
        let apitext = try String(contentsOf: url)
 print(apitext)
        joketext = apitext
        
    } catch {
        print("Det gick fel")
    }

 */
 
 }*/
