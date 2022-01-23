//
//  UserTableViewCell.swift
//  github-api
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 22/01/22.
//

import Foundation
import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var login: UILabel = {
        let login = UILabel()
        login.textColor = .white
        return login
    }()
    
    lazy var name: UILabel = {
        let name = UILabel()
        name.textColor = .white
        return name
    }()
    
    lazy var company: UILabel = {
        let company = UILabel()
        return company
    }()
    
    lazy var followers: UILabel = {
        let followers = UILabel()
        return followers
    }()
    
    lazy var following: UILabel = {
        let following = UILabel()
        return following
    }()
    
    lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.borderWidth = 1
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.black.cgColor
        avatar.layer.cornerRadius = 30
        avatar.clipsToBounds = true
        return avatar
    }()
    
    func configureViews() {
        contentView.addSubview(view)
        contentView.addSubview(followers)
        contentView.addSubview(following)
        view.addSubview(company)
        view.addSubview(login)
        view.addSubview(name)
        view.addSubview(avatar)
        
        view.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
            make.size.equalTo(400)
        }
        
        avatar.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(130)
            make.centerX.equalToSuperview()
            
        }
        
        name.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(avatar.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        login.snp.makeConstraints { login in
            login.height.equalTo(50)
            login.left.equalTo(contentView)
            login.top.equalToSuperview().offset(180)
        }
        
        company.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(180)
        }
        
    }
    
}
