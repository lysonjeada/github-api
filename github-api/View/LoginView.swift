//
//  ProfileViewController.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation
import UIKit

class LoginView: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        button.center = view.center
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }
    
    @objc func didTapButton() {
        let tabBarVc = UITabBarController()
        let vc1 = UINavigationController(rootViewController: UserView())
        vc1.title = "Profile"
        
        let viewControllers = [
                    createNavController(for: UserView(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!),
                    createNavController(for: RepositoriesView(), title: NSLocalizedString("Repositories", comment: ""), image: UIImage(systemName: "laptopcomputer")!)
                ]
        
        tabBarVc.setViewControllers(viewControllers, animated: true)
        tabBarVc.modalPresentationStyle = .fullScreen
        
        present(tabBarVc, animated: true)
    }
    
    func configureViews() {
        view.addSubview(button)
        
    }
}
