//
//  UserView.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation
import UIKit
import SDWebImage
import SnapKit

class UserView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var user: Profile?
    var viewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        viewModel = UserViewModel()
        
        configureViews()
    }
    
    init() {
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserTableViewCell()
        viewModel?.loadUser { user, error in
                let url = URL.init(string: user?.avatarUrl ?? "")
                cell.avatar.sd_setImage(with: url, completed: nil)
                cell.backgroundColor = .black
                cell.login.attributedText = NSAttributedString(string: user?.login ?? "erro")
                cell.name.attributedText = NSAttributedString(string: user?.name ?? "erro")
                cell.company.attributedText = NSAttributedString(string: user?.company ?? "erro")

            }
        return cell
    }
    
    lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.rowHeight = UITableView.automaticDimension
            tableView.register(UserTableViewCell.self, forCellReuseIdentifier: String(describing: UserTableViewCell.self))
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = .white
            return tableView
        }()
    
    private lazy var tabBarViewController: UITabBarController = {
            let tabBarViewController = UITabBarController()
            tabBarViewController.setViewControllers([LoginView()], animated: true)
                
            return tabBarViewController
            }()
    
    func configureViews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
}
