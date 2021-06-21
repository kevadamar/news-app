//
//  NewsList.swift
//  NewsApp
//
//  Created by keva on 21/06/21.
//

import SwiftUI

struct NewsList: View {
    
    @ObservedObject var list = ApiService()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(list.news) { item in
                    VStack {
                        NavigationLink(
                            destination: NewsDetail(news: item)
                                .environmentObject(self.list)
                        ) {
                            CustomRowList(news: item)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("NewsApp"))
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: Profile()) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .clipShape(Circle())
                            .padding(.top)
                            .padding(.bottom)
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.blue)
    }
}
