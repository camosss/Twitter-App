//
//  NotificationCell.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/11.
//

import UIKit

protocol NotificationCellDelegate: class {
    func didTapProfileImage(_ cell: NotificationCell)
}

class NotificationCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: NotificationCellDelegate?
    
    var notification: Notification? {
        didSet { configure() } // 설정될때마다 configure 호출
    }
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 40, height: 40)
        iv.layer.cornerRadius = 40 / 2
        iv.backgroundColor = .twitterBlue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Notification Message"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, notificationLabel])
        stack.spacing = 8
        stack.alignment = .center
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        stack.anchor(right: rightAnchor, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleProfileImageTapped() {
        delegate?.didTapProfileImage(self)
    }
    
    // MARK: - Helpers
    
    func configure() {// viewModel을 사용하여 속성 설정
        guard let notification = notification else { return }
        let viewmodel = NotificationViewModel(notification: notification)
        
        profileImageView.sd_setImage(with: viewmodel.profileImageUrl)
        notificationLabel.attributedText = viewmodel.notificationText
    }
}
