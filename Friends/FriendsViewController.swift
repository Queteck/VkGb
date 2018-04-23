//
//  FriendsViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsViewController: UITableViewController {
    var notificationToken: NotificationToken? = nil

    private var friendsList: Results<VKFriend>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareRealm()
        loadFriends()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func prepareRealm() {
        let realm = try! Realm()
        friendsList = realm.objects(VKFriend.self)
        
        // Observe Results Notifications
        notificationToken = friendsList?.observe { [weak self] (changes: RealmCollectionChange) in
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
        return friendsList?.count ?? 0
        
    }
    
    func loadFriends() {
        let service: FriendsService = FriendsService()
        service.loadFriends()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VKFriendCell", for: indexPath) as! FriendsViewCell
        let friend = friendsList![indexPath.row]
        cell.friendsName.text = friend.first_name + " " + friend.last_name
        
        
        let photo: String = friend.photo_50
        do {
            try cell.friendAvatar.image = UIImage(data: Data(contentsOf: URL(string:photo)!))!
        } catch {
            print(error)
        }
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! FriendsPhotoViewController
                destVC.id = friendsList![indexPath.row].id
            }
        }
    }
}

