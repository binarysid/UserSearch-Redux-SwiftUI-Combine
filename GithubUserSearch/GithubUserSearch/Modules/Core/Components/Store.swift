//
//  Store.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 10/4/23.
//

import Foundation
import Combine

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private var middleWares: [Middleware<State, Action>]
    private var reducer: Reducer<State, Action>
    private var middleWareCancellables: Set<AnyCancellable> = []

    init(state: State, middleWares: [Middleware<State, Action>], reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.middleWares = middleWares
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        let newState = reducer(state, action)
        for middleWare in middleWares {
            middleWare(state, action)
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middleWareCancellables)
        }
        DispatchQueue.main.async {
            self.state = newState
        }
    }
}
