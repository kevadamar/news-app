//
//  NewsModel.swift
//  NewsApp
//
//  Created by keva on 21/06/21.
//

import Foundation

struct NewsModel: Identifiable {
    var id : Int
    var title: String
    var description: String
    var image: String
    var url: String
    var publishedAt: String
    var content: String
}
