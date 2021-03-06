//
//  SearchController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit

private let reuseIdentifier = "UserCell"

enum SearchControllerConfiguration {
    case messages
    case userSearch
}

class SearchController: UITableViewController {
    
    // MARK: - Properties
    
    private let config: SearchControllerConfiguration
    
    private var users = [User]() {
        didSet { tableView.reloadData() }
    }
    
    // User 배열을 필터링
    private var filteredUsers = [User]() {
        didSet { tableView.reloadData() }
    }
    
    // 검색모드에 있는지 여부
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    
    init(config: SearchControllerConfiguration) {
        self.config = config
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
        configureSeachController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default // 기본값
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - API
    
    func fetchUsers() {
        UserService.shared.fetchUsers { users in
            self.users = users
        }
    }
    
    // MARK: - Action
    
    @objc func handleDisMissal() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = config == .messages ? "New Message" : "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
        if config == .messages {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDisMissal))
        }
    }
    
    // search bar 생성
    func configureSeachController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a user"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

    // MARK: - UITableViewDataSource/Delegate

extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        cell.user = user
        return cell
    }
    // 선택 프로필로 이동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}

    // MARK: - UISearchResultsUpdating
//  text를 칠 때마다 반응
extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        // filter된 사용자로 채우기
        filteredUsers = users.filter({ $0.username.contains(searchText) })
    }
}
