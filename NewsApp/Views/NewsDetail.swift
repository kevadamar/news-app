//
//  NewsDetail.swift
//  NewsApp
//
//  Created by keva on 21/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetail: View {
    var news: NewsModel
    var body: some View {
        ScrollView {
            VStack {
                
                WebImage(url: URL(string: news.image), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 334, height: 223)
                    .clipped()
                    .cornerRadius(9)
                    .padding()
                
                VStack(alignment:.leading){
                    Text(news.title)
                        .bold()
                        .font(.title3)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Text(news.description)
                        .lineLimit(20)
                        .font(.subheadline)
                        .padding(5)
                        .padding(.leading)
                        .padding(.trailing)
                }
                
            }
        }
    }
}
