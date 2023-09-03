//
//  ContentView.swift
//  api test
//
//  Created by Austin Xu on 2023/9/2.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var news = FactViewModel()
    @StateObject private var facts = FactViewModel()
    
    var body: some View {

        List(facts.facts, id: \.self){ fact in
            Text(fact.author)
        }.onAppear(perform: facts.getFacts)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
