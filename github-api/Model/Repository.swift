//
//  Repository.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

class Repository: Decodable {
    
    let projectName: String?
    let visibility: String?
    let language: String?
    let url: String?
    
    init(projectName: String, visibility: String, language: String, url: String) {
        self.projectName = projectName
        self.visibility = visibility
        self.language = language
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case projectName = "name"
        case visibility = "visibility"
        case language = "language"
        case url = "html_url"
    }
    
    
}
