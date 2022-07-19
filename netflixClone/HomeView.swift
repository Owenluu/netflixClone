//
//  HomeView.swift
//  netflixClone
//
//  Created by Owen Luu on 7/17/22.
//

import SwiftUI

struct HomeView: View {
    var vm: HomeVM = HomeVM()
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            //main VStack
            VStack {
                ForEach(vm.allCategories, id: \.self) { category in
                    VStack {
                        HStack{
                        Text(category)
        //                    .foregroundColor(.blue)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(vm.getMovie(forCat: category)) {
                                    movie in
                                    StandardHomeMovie(movie: movie)
                                        .frame(width: 100, height: 200)
                                        .padding(.horizontal, 20)
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
