//
//  RepositoriesView.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation
import UIKit
import SnapKit

class RepositoriesView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var repository: [Repository]?
    var viewModel: RepositoryViewModel?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()

        viewModel = RepositoryViewModel()
        configureViews()
    }
    
    lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.rowHeight = UITableView.automaticDimension
            tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = .white
            return tableView
        }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryTableViewCell
//        let cell = RepositoryTableViewCell()
        viewModel?.loadRepository({ repository, error in
            let repositories = repository?[indexPath.row - 1]
            cell.name.text = repositories?.projectName
            cell.language.text = repositories?.language
            cell.visibility.text = repositories?.visibility
            cell.url.text = repositories?.url
        })
        
        return cell
    }
    
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
