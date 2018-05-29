//
//  PostViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 25.05.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func postTap(_ sender: Any) {
        guard let text = textView.text else { return }
        let service = PostService()
        service.post(text: text) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
