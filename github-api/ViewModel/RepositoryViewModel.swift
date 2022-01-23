//
//  RepositoryViewModel.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

class RepositoryViewModel {
    private let service = RepositoriesService()
    private var completion: (([Repository]?, Error?) -> Void)?
    
    init() { }
    
    func loadRepository(_ completion: @escaping ([Repository]?, Error?) -> Void) {
        print("passou no view model load repostiory")
        self.completion = completion
        service.fetchRepositories { repository, err in
            self.handle(repository, err)
        }
    }
    
    private func handle(_ repository: [Repository]?, _ error: Error?) {
        DispatchQueue.main.async {
            if let e = error {
                self.completion?(nil, e)
            }
            
            if let repository = repository {
                self.completion?(repository, nil)
            }
        }
    }
}
