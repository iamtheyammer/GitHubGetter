//
//  ListItem.swift
//  GitHubGetter
//
//  Created by Sam Mendelson on 7/3/20.
//  Copyright © 2020 iamtheyammer. All rights reserved.
//

import SwiftUI

struct ListItem: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(title: "Repositories", value: "10")
    }
}
