//
//  ViewConfigurator.swift
//  GithubUsers
//
//  Created by Linkon Sid on 12/3/23.
//

import SwiftUI

// This protocol is for configuring views. Defines relationships between each component of a domain
protocol ViewConfigurator{
    associatedtype T:View
    func configure()->T
}
