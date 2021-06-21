//
//  CustomRowList.swift
//  NewsApp
//
//  Created by keva on 21/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomRowList: View {
    var news: NewsModel
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment:.center) {
                WebImage(url: URL(string: news.image), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 375,height: 200)
                    .cornerRadius(25)
                
            }
            
            VStack(alignment:.leading){
                Text(news.title)
                    .font(.headline)
                    .bold()
                    .padding(5)
                
                Text(news.content)
                    .lineLimit(2)
                    .font(.subheadline)
                    .padding(5)
                
                HStack {
                    Text(news.publishedAt)
                        .padding(5)
                        .font(.caption2)
                    
                    Spacer()
                }
            }
            .padding(.bottom)
            .padding(.top)
        }
    }
}
