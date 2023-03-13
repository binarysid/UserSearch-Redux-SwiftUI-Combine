//
//  SearchContract.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

// all the contracts that builds the workflow View->ViewModel->UseCase->Repository->DataSource
protocol SearchViewModelProtocol:ObservableObject{
    var searchQuery: String{get set}
    var viewData:[SearchViewData]{get}
    func cancelSearchTask()
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

