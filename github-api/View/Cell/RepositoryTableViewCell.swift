//
//  RepositoryTableViewCell.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation
import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    let cell = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cell)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    lazy var name: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.backgroundColor = .red
        return name
    }()
    
    lazy var visibility: UILabel = {
        let visibility = UILabel()
        return visibility
    }()
    
    lazy var language: UILabel = {
        let language = UILabel()
        return language
    }()
    
    lazy var url: UILabel = {
        let url = UILabel()
        return url
    }()
    
    func configureViews() {
        contentView.addSubview(view)
        view.addSubview(name)
        view.addSubview(visibility)
        view.addSubview(language)
        view.addSubview(url)
        
        view.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
            make.size.equalTo(100)
            
        }
        
        name.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(170)
            make.centerX.equalToSuperview()
        }
        
//        visibility.snp.makeConstraints { make in
//            make.right.equalToSuperview()
//        }
//        
//        language.snp.makeConstraints { make in
//            make.bottom.equalToSuperview()
//        }
//        
//        url.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//        }
    }
}
