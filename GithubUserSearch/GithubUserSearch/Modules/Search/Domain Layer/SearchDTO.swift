//
//  SearchDTO.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import Foundation

struct SearchDTO:Identifiable{
    var id:Int
    var name:String
    var avatar:URL?
    var repos:URL?
}

