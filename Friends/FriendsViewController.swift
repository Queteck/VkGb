//
//  FriendsViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FriendsViewController: UITableViewController {
    
    let baseUrl = "https://api.vk.com/method/"
    let protocolVersion = "5.74"
    var friendsList: [VKFriend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriends()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsList.count
       
    }
    
    func loadFriends() {
        let parameters: Parameters = [
            "access_token": token,
            "fields": "first_name, photo_50",
            "lang": "ru",
            "count": "3",
            "v": protocolVersion
        ]
        let path = "friends.get"
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let value):
                print(String(data: value, encoding: .utf8))
                let friendResponse = try! JSONDecoder().decode(FriendResponse.self, from: value)
                self.friendsList = friendResponse.response.items
                self.tableView.reloadData()
            case .failure(_):
                break
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VKFriendCell", for: indexPath) as! FriendsViewCell
        let friend = friendsList[indexPath.row]
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
                destVC.id = friendsList[indexPath.row].id
            }
        }
    }
}

