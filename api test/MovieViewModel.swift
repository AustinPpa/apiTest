//
//  MovieViewModel.swift
//  api test
//
//  Created by Austin Xu on 2023/9/3.
//



import Foundation

class MovieViewModel: ObservableObject{
    @Published var movieTitle: String = ""
    
//    init(){
//        getFacts()
//    }
    
//    func getFacts() {
//
//        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    if let safeData = data {
//                        print("yes")
//                        self.dataFetch(safeData)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
    func getFacts() {
        if let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=9a39c854") {
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
            let result = try decoder.decode(Movie.self, from: data)
            print(result)
            self.movieTitle = result.Title
        } catch {
            print(error)
        }
    }
    
}


