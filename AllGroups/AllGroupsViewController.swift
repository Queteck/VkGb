//
//  AllGroupsViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit
import RealmSwift

class AllGroupsViewController: UITableViewController {
    var notificationToken: NotificationToken? = nil
    
    var groupsList: [VKGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGroups()

    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func prepareRealm() {
        let realm = try! Realm()
        let results = realm.objects(VKGroup.self)
        
        // Observe Results Notifications
        notificationToken = results.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsList.count
        
    }
    
    func loadGroups() {
        let service: AllGroupsService = AllGroupsService()
        service.searchGroups()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Groups", for: indexPath) as! AllGroupsViewCell
        let group = groupsList[indexPath.row]
        cell.groupName.text = group.name
        
        
        let photo: String = group.photo_50
        do {
            try cell.groupAvatar.image = UIImage(data: Data(contentsOf: URL(string:photo)!))!
        } catch {
            print(error)
        }
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
//            guard let id = groupsList[indexPath.row].id else { return }
            
//            groupsList!.leaveFromGroup(groupID: id) {}
            
        }
    }
}

