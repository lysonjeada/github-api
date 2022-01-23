//
//  UserViewModel.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation

class UserViewModel {
        private let service = UserService()
        private var completion: ((Profile?, Error?) -> Void)?
        
        init() { }
        
        func loadUser(_ completion: @escaping (Profile?, Error?) -> Void) {
            self.completion = completion
            service.fetchUser { user, err in
                self.handle(user, err)
            }
        }
        
        private func handle(_ user: Profile?, _ error: Error?) {
            DispatchQueue.main.async {
                if let e = error {
                    self.completion?(nil, e)
                }
                
                if let user = user {
                    self.completion?(user, nil)
                }
            }
        }
}
