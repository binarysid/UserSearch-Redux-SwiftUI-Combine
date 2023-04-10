//
//  SearchBar.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            searchTextField()
            if isEditing {
                cancelActionButton()
            }
        }
    }
}

// MARK: View Components
extension SearchBar{
    private func cancelActionButton()->some View{
        Button(action: {
            self.isEditing = false
            self.text = ""
            
        }) {
            Text(AppConstants.Search.ActionTitle.cancel)
        }
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
    }
    private func searchTextField()->some View{
        TextField(AppConstants.Common.Title.searchBar, text: $text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(overlayStyle())
            .padding(.horizontal, 10)
            .onTapGesture {
                self.isEditing = true
            }
    }
    private func overlayStyle()->some View{
        HStack {
            Image(systemName: AppConstants.Common.Images.magnifyingGlass)
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            
            if isEditing {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: AppConstants.Common.Images.circleFill)
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}
