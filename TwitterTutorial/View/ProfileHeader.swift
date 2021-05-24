//
//  ProfileHeader.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/22.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let filterBar = ProfileFilterView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                          paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_white_24dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        return iv
    }()
    
    private lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleEditFollow), for: .touchUpInside)
        return button
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "EEEE"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "@vv"
        return label
    }()
    
    private let bioLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "This is a user bio that will span more than one line for test purpose"
        return label
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 4.
        filterBar.delegate = self
            
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 100)
        
        addSubview(profileImageView)
        profileImageView.anchor(top:containerView.bottomAnchor, left: leftAnchor,
                                paddingTop: -24, paddingLeft: 8)
        profileImageView.setDimensions(width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerView.bottomAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 12)
        editProfileFollowButton.setDimensions(width: 100, height: 36)
        editProfileFollowButton.layer.cornerRadius = 36 / 2
        
        let userDetailStack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel, bioLabel])
        userDetailStack.axis = .vertical
        userDetailStack.distribution = .fillProportionally
        userDetailStack.spacing = 4
        
        addSubview(userDetailStack)
        userDetailStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width / 3, height: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleEditFollow() {
        
    }
    
    @objc func handleDismiss() {
        
    }
}

    // MARK: - ProfileFilterViewDelegate
// 3. 원하는 작업 수행
extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
        // 해당 indexPath(경로)에 대한 cell을 얻는다
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else { return }
        
        // xPosition을 얻은 다음 밑줄이 그어진 뷰를 해당 x의 위치로 animate
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
    }
}
