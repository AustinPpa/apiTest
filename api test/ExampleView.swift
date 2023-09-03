//
//  ExampleView.swift
//  api test
//
//  Created by Austin Xu on 2023/9/2.
//

import SwiftUI

struct ExampleView: View {
    @ObservedObject var news = FactViewModel()

    var body: some View {
        List{
            ForEach(news.facts, id: \.self){ fact in
                VStack {
                    Text(fact.author)
                    Text("hello")
                }
            }
        }.onAppear{ news.getFacts() }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
