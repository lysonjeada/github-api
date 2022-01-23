//
//  RepositoriesService.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

private let user = "lysonjeada"
private let apiURL = "https://api.github.com/users/\(user)/repos"

class RepositoriesService {
    
    func fetchRepositories(completion: @escaping ([Repository]?, Error?) -> Void) {
        print("passou no fetchreppsitories")
        print(apiURL)
            guard let api = URL(string: apiURL) else {
                return
            }
            
            let session = URLSession.shared
            let task = session.dataTask(with: api) { (data, response, error) in
                print("aqui foi")
                guard let jsonData = data else {
                    print("aqui nao foi")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([Repository].self, from: jsonData)
                    print("tudo certo")
                    
                    completion(decoded, nil)
                } catch let error {
                    completion(nil, error)
                    print(error.localizedDescription)
                }
            }
            
            task.resume()
        }
    
}
