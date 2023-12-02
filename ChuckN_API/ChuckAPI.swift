//
//  ChuckAPI.swift
//  ChuckN_API
//
//  Created by Sanna Tupala on 2023-12-02.
//  Copyright © 2023 test. All rights reserved.
//

import Foundation

struct ChuckJoke: Codable {
    var id: String
    var url: String
    var value: String
}

class ChuckAPI: ObservableObject {
    @Published var joketext = ""

    func loadAPI(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let theJoke = try decoder.decode(ChuckJoke.self, from: data)
                print(theJoke.value)

                DispatchQueue.main.async {
                    self.joketext = theJoke.value
                    completion(.success(()))
                }
            } catch {
                print("Error decoding JSON:", error)
                completion(.failure(error))
            }
        }.resume()
    }
}



/*
import Foundation

struct ChuckJoke : Codable {
    var id : String
    var url : String
    var value : String
}

class ChuckAPI : ObservableObject {
    @Published var thejoke = ""
    
    func loadapi(); do {
       var url = URL(string: "https://api.chucknorris.io/jokes/random"); else do { return }

       do {
       var (apidata, apiresp) = try await
       URLSession.shared.data(from: url)
           
           print(apidata.count)
          
       let decoder = JSONDecoder()
       var thejoke try = decoder.decode(Chuckjoke.self, from: apidata)
       
       print(thejoke.value)
    
    DispatchQueue.main.async {
    self.joketext = thejoke.value
    }
       } catch {
           print("Error reading info")
       }}
    
    
}

*/
