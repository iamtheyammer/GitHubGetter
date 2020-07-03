//
//  AppState.swift
//  GitHubGetter
//
//  Created by Sam Mendelson on 7/2/20.
//  Copyright © 2020 iamtheyammer. All rights reserved.
//

import SwiftUI
import Combine

struct GitHubProfile {
    var login: String
    var avatar_url: String
    var html_url: String
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var bio: String?
    var public_repos: Int
    var followers: Int
    var following: Int
    
    init?(json: [String: Any]) {
        let login = json["login"] as! String
        let avatar_url = json["avatar_url"] as! String
        let html_url = json["html_url"] as! String
        let name = json["name"] as? String
        let company = json["company"] as? String
        let blog = json["blog"] as? String
        let location = json["location"] as? String
        let bio = json["bio"] as? String
        let public_repos = json["public_repos"] as! Int
        let followers = json["followers"] as! Int
        let following = json["following"] as! Int
        
        self.login = login
        self.avatar_url = avatar_url
        self.html_url = html_url
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.bio = bio
        self.public_repos = public_repos
        self.followers = followers
        self.following = following
            }
}


final class AppState: ObservableObject {
    @Published var login = ""
    @Published var error = ""
    @Published var profile: GitHubProfile?
    
    func getProfile() {
        let baseURL = URL(string: "https://api.github.com/users/" + login)!
        
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            if error != nil {
                print("There was an error: ", error!)
                
                DispatchQueue.main.async {
                    self.error = error.debugDescription
                }
            }
            
            if let data = data {                
                let rawJSON = try? JSONSerialization.jsonObject(with: data)
                let json = rawJSON as? [String: Any]
                
                DispatchQueue.main.async {
                    self.profile = GitHubProfile.init(json: json!)
                }
                
            }
        }
        
        task.resume()
    }
}
