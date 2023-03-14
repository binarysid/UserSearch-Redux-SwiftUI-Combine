//
//  SearchContract.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// All the contracts that builds the workflow View->ViewModel->UseCase->Repository->DataSource

typealias SearchViewModelProtocol = SearchViewDataQueryProtocol & SearchViewTaskProtocol & SearchViewNavigatorProtocol

protocol SearchViewDataQueryProtocol:ObservableObject{
    var searchQuery: String{get set}
    var viewData:[SearchViewData]{get}
}

protocol SearchViewNavigatorProtocol{
    func navigateToDetail(reposURL:URL?,followersURL:URL?)
}

protocol SearchViewTaskProtocol{
    func cancelSearchTask()
}

protocol SearchRouterProtocol{
    func presentDetailView(reposURL:URL,followersURL:URL?)
}

protocol SearchUseCaseProtocol{
    func search(by name:String, limit: Int) async-> Result<[SearchDTO],APIManager.CustomError>
}

protocol SearchRepositoryProtocol{
    func getData(by name:String, limit: Int) async-> Result<[SearchDTO],APIManager.CustomError>
}

protocol SearchAPIDataSourceProtocol{
    func getSearchData(by name:String, limit: Int) async ->
    Result<[GitHubUser],APIManager.CustomError>
}

