//
//  UserService.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

private let user = "lysonjeada"
private let apiURL = "https://api.github.com/users/\(user)"

class UserService {
    
    func fetchUser(completion: @escaping (Profile?, Error?) -> Void) {
            guard let api = URL(string: apiURL) else {
                return
            }
            
            let session = URLSession.shared
            let task = session.dataTask(with: api) { (data, response, error) in
                guard let jsonData = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(Profile.self, from: jsonData)
                    
                    completion(decoded, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
            
            task.resume()
        }
    
}
