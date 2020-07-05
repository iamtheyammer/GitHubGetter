//
//  ContentView.swift
//  GitHubGetter
//
//  Created by Sam Mendelson on 7/2/20.
//  Copyright © 2020 iamtheyammer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("GitHub Getter")
                    .font(.title)
                    .padding([.horizontal, .top])
                Spacer()
            }
            HStack {
                TextField("Enter a GitHub username", text: $state.login)
                    .padding([.horizontal])
                Button(action: state.getProfile) {
                Text("Get profile")
                    .padding([.horizontal])
                }
            }
            .padding([.bottom])
            if state.profile != nil {
                ProfileView(profile: state.profile!)
            }
            
            if state.error.count > 0 {
                Text(state.error)
                    .foregroundColor(Color.red)
                    .padding([.horizontal])
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(AppState())
    }
}
