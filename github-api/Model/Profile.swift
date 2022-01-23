//
//  User.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

class Profile: Decodable {
    
    let login: String
    let avatarUrl: String
    let name: String
    let company: String
    let followers: Int
    let following: Int
    
    init(login: String, avatarUrl: String, name: String, company: String, followers: Int, following: Int) {
        self.login = login
        self.avatarUrl = avatarUrl
        self.name = name
        self.company = company
        self.followers = followers
        self.following = following
    }
    
    enum CodingKeys: String, CodingKey {
            case login = "login"
            case avatarUrl = "avatar_url"
            case name = "name"
            case company = "company"
            case followers = "followers"
            case following = "following"
        }
    
}
