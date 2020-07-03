//
//  ProfileView.swift
//  GitHubGetter
//
//  Created by Sam Mendelson on 7/2/20.
//  Copyright © 2020 iamtheyammer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    let profile: GitHubProfile
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    WebImage(url: URL(string: profile.avatar_url))
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1).shadow(radius: 2))
                        .padding(.trailing)
                    if profile.name != nil {
                        VStack(alignment: .leading) {
                            Text(profile.name!)
                                .font(.title)
                            Text(profile.login)
                                .font(.subheadline)
                        }
                    } else {
                        VStack(alignment: .trailing) {
                            Text(profile.login)
                                .font(.title)
                        }
                    }
                }.padding([.horizontal, .top])
                if profile.bio != nil {
                    HStack {
                        Image(systemName: "quote.bubble")
                        Text(profile.bio!)
                    }.padding([.horizontal])
                }
                
                if profile.company != nil {
                    HStack {
                        Image(systemName: "person.3")
                        Text(profile.company!)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }.padding([.horizontal])
                }
                
                if profile.location != nil {
                    HStack {
                        Image(systemName: "mappin")
                        Text(profile.location!)
                    }.padding([.horizontal])
                }
                
                if profile.blog != nil {
                    HStack {
                        Image(systemName: "link")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            OpenInSafari(urlString: self.profile.blog!)
                        }) {
                            Text(profile.blog!)
                            .font(.subheadline)
                        }
                    }.padding([.horizontal])
                }
                
                HStack {
                    Image(systemName: "arrow.up.right")
                        .font(.subheadline)
                    Button (action: {
                        OpenInSafari(urlString: self.profile.html_url)
                    }) {
                        Text("github/" + profile.login)
                            .font(.subheadline)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }
                }
                
            }
            List {
                ListItem(title: "Repositories", value: String(profile.public_repos))
                ListItem(title: "Followers", value: String(profile.followers))
                ListItem(title: "Following", value: String(profile.following))
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView(profile: GitHubProfile(json: [
                "login": "iamtheyammer",
                "avatar_url": "https://avatars2.githubusercontent.com/u/32084206?v=4",
                "html_url": "https://github.com/iamtheyammer",
                "name": "I Yam Who I Yam",
                "company": "formerly GoGuardian",
                "blog": "https://twitter.com/iamtheyammer",
                "location": "SF Bay Area",
                "bio": "Along for the ride",
                "public_repos": 1,
                "followers": 1,
                "following": 2
            ])!)
            ProfileView(profile: GitHubProfile(json: [
                "login": "aidenappl",
                "avatar_url": "https://avatars2.githubusercontent.com/u/32084206?v=4",
                "html_url": "https://github.com/aidenappl",
                "company": "formerly GoGuardian",
                "blog": "https://twitter.com/iamtheyammer",
                "location": "SF Bay Area",
                "public_repos": 1,
                "followers": 1,
                "following": 2
            ])!)
        }
        
    }
}
