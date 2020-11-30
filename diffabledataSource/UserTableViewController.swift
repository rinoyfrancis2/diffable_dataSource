//
//  UserTableViewController.swift
//  diffabledataSource
//
//  
//

import UIKit

class UserTableViewController: UITableViewController {

    private var users = [User]()
    private var datasource : UITableViewDiffableDataSource<Section, User>!
    private var alertservice = AlertServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.configureDatasources()
    }

    private func configureDatasources() {
        datasource = UITableViewDiffableDataSource<Section, User>(tableView: tableView, cellProvider: { (tableview, indexpath, user) -> UITableViewCell? in
            //here we can set the initialize the tableview cell
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexpath)
            cell.textLabel?.text = user.name
            return cell
        })
    }
    
    @IBAction func addnewUserAction(_ sender: Any) {
        let alert = alertservice.createUserAlert { [weak self] (name) in
            self?.addNewUser(with: name)
        }
        present(alert, animated: true, completion: nil)
    }
    
    private func addNewUser(with name: String) {
        let user = User(name: name)
        users.append(user)
        createSnapShot(from: users)
    }
    
    private func createSnapShot(from users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        datasource.apply(snapshot, animatingDifferences: true) {
            //HERE WE CAN  add any of the animations
        }
    }
}

extension UserTableViewController {
    fileprivate enum Section {
        case main
        case favorite
    }
}

