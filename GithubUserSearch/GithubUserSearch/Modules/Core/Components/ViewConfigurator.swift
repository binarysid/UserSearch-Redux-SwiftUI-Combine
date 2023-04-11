//
//  ViewConfigurator.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI

// This is for configuring views. Wiring dependencies and relationships between each component of a domain, required to build the View
protocol ViewConfigurator {
    associatedtype ViewType: View
    func configure() -> ViewType
}
