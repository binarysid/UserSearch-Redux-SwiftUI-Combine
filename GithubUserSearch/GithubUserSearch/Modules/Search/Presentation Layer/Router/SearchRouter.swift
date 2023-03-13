//
//  SearchRouter.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 13/3/23.
//

import Foundation

protocol SearchRouterProtocol{
    func presentDetailView(reposURL:URL,followersURL:URL)
}

struct SearchRouter:SearchRouterProtocol{
    func presentDetailView(reposURL:URL,followersURL:URL){
//        NavigationLink(destination: DetailView()) {}
    }
}
