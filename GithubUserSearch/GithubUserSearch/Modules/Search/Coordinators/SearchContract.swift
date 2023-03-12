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
    var data:[SearchDTO]{get}
}
protocol SearchUseCaseProtocol{
    func search(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>
}
protocol SearchRepositoryProtocol{
    func getData(by name:String) async-> Result<[SearchDTO],APIManager.CustomError>
}
protocol SearchAPIClientProtocol{
    func getData(by name:String) async ->
    Result<[GitHubUser],APIManager.CustomError>
}

