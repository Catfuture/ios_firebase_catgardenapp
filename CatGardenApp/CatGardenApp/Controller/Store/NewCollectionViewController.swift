//
//  NewCollectionViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var products:[Product] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewCollectionCollectionViewCell
        cell.setup(with: products[indexPath.row])
        return cell
    }
    
    @IBOutlet weak var collectionViewNew: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref.child("product").observeSingleEvent(of: .value) {Snapshot in
            let dicdata : Dictionary<String,Any> = Snapshot.value as! Dictionary<String,Any>
            
            for i in dicdata{

                self.products.append(Product(object: i.value))
            }
            DispatchQueue.main.async {
                self.collectionViewNew.reloadData()
            }
            
        }
        collectionViewNew.dataSource = self
        
    }
        
        
    }


