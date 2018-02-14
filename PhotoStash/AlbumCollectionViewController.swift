//
//  AlbumCollectionViewController.swift
//  PhotoStash
//
//  Created by Ifeoma Ufondu on 2/13/18.
//  Copyright © 2018 photostash. All rights reserved.
//

import UIKit
import FirebaseDatabase


private let reuseIdentifier = "albumCell"

class AlbumCollectionViewController: UICollectionViewController {
    var ref: DatabaseReference?
    var handle:DatabaseHandle?
    var albums:[String] = []  //an array to hold all the albums
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        //Sync with Firebase Database
        /*
        handle = ref?.child("Album").observe(.value, with: {(snapshot) in
            if let item = snapshot.value as? String {
                self.myList.append(item)
                self.view.reloadInputViews(); //FIXME
                self.ref?.keepSynced(true)
            }
        })
         */
        
//        handle = self.ref?.child("Album").observe(of: .value, with: {(snapshot) in
//            for child in snapshot.children {
//                let albumName = snapshot.value as! String
//                //let key = snap.key
//                //let value = snap.value
//                self.albums.append(albumName)
//            }
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albums.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        cell.backgroundColor = UIColor.black
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
