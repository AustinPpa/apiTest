//
//  FactViewModel.swift
//  api test
//
//  Created by Austin Xu on 2023/9/2.
//

import Foundation

class FactViewModel: ObservableObject{
    @Published var facts: [Fact] = []    

    func getFacts() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error fetching data: \(error)")
                } else if let data = data {
                    print("Data received successfully")
                    self.dataFetch(data)
                }
            }
            task.resume()
        } else {
            print("Invalid URL")
        }
    }

    
    func dataFetch(_ data : Data) {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(FaceDecode.self, from: data)
            print(result)
            self.facts = result.hits
        } catch {
            print(error)
        }
    }
    
}

