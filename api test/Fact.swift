//
//  Fact.swift
//  api test
//
//  Created by Austin Xu on 2023/9/2.
//

import Foundation

struct FaceDecode: Codable{
    var hits: [Fact]
}

struct Fact: Codable, Hashable{
    var objectID: String
    var title: String
    var author: String


}
