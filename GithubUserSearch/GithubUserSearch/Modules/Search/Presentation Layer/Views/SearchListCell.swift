//
//  SearchListCell.swift
//  GithubUsers
//
//  Created by Linkon Sid on 13/3/23.
//

import SwiftUI

struct SearchListCell: View {
    
    typealias Action = ()->Void
    @State var item: SearchViewData
    var action:Action?
    
    var body: some View {
        HStack{
            AsyncImage(url: item.avatar
                       , content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 35)
                    .clipShape(Circle())
            }, placeholder: {
                ProgressView()
            })
            .padding(.leading,8)
            
            Text(item.name)
                .padding(.leading,8)
        }
        .padding(16)
        .onTapGesture {
            if let action = action{
                action()
            }
        }
    }
}
