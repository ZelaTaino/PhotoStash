//
//  CreateAlbumViewController.swift
//  PhotoStash
//
//  Created by Ifeoma Ufondu on 2/13/18.
//  Copyright © 2018 photostash. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateAlbumViewController: UIViewController {
    var ref: DatabaseReference?
    var myList:[String] = []
    var handle:DatabaseHandle?
    
    @IBOutlet weak var albumName: UITextField!
    @IBOutlet weak var albumOwner: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
        //Sync with Firebase Database
        handle = ref?.child("Album").observe(.childAdded, with: {(snapshot) in
            if let item = snapshot.value as? String {
                self.myList.append(item)
                self.view.reloadInputViews(); //FIXME
                self.ref?.keepSynced(true)
            }
        })
    }

    @IBAction func createAlbumBtnTapper(_ sender: Any) {
        if albumName?.text != "" {
            let code = self.ref?.child("Album").child((albumName?.text)!) //create a new album
            code?.child("Owner").setValue(albumOwner?.text)
            
        }
    }
    

}
