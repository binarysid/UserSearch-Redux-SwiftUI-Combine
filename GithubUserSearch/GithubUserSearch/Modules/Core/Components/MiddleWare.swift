//
//  MiddleWare.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>
