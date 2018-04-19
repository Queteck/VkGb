//
//  FriendsPhotoViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.


import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class FriendsPhotoViewController: UICollectionViewController {
    var id: Int!
    
    let baseUrl = "https://api.vk.com/method/"
    let protocolVersion = "5.74"
    var photoList: [VKPhotos] = [] {
        didSet {
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
        }
    func loadPhotos() {
        let parameters: Parameters = [
            "access_token": token,
            "owner_id": id,
            "count": "3",
            "v": protocolVersion
        ]
        let path = "photos.getAll"
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let value):
                print(String(data: value, encoding: .utf8))
                let photoResponse = try! JSONDecoder().decode(PhotoResponse.self, from: value)
                self.photoList = photoResponse.response.items
                self.collectionView?.reloadData()
            case .failure(_):
                break
            }
        }
    }
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    // MARK: UICollectionViewDataSource
//
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//
//
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
//
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhoto", for: indexPath) as! FriendsPhotoViewCell
//        let id = photoList[indexPath.row]
//        cell.friendsName.text = friend.first_name + " " + friend.last_name
        
        let photo: String = photoList[indexPath.row].photo_75
        do {
            try cell.photoView.image = UIImage(data: Data(contentsOf: URL(string:photo)!))!
        } catch {
            print(error)
        }
        return cell
    }
//
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//    
//    }
//    */
//
}
