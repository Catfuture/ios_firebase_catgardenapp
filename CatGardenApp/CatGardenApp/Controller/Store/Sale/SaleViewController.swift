//
//  SaleViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/3/23.
//

import UIKit
import Firebase
import FirebaseDatabase
class SaleViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    var products:[Product] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SaleCollectionViewCell
        cell.setup(with: products[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productItem:ProductViewController = storyboard?.instantiateViewController(withIdentifier: "productitem") as! ProductViewController
        productItem.item = products[indexPath.row]
        self.navigationController?.pushViewController(productItem, animated: true)
        self.view.makeToast("thanh cong")
    }
    //custom sale
    
    @IBAction func btnNewCollection(_ sender: Any) {
       
    }
    @IBAction func btnBestSeller(_ sender: Any) {
       
    }
    @IBOutlet weak var collectionViewSale: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref.child("product").observeSingleEvent(of: .value) { [self]Snapshot in
            let dicdata : Dictionary<String,Any> = Snapshot.value as! Dictionary<String,Any>
            
            for i in dicdata{
                if  (Product(object: i.value).sale) != 0{
                    self.products.append(Product(object: i.value))
                }
            }
            DispatchQueue.main.async {
                  self.collectionViewSale.reloadData()
            }
        }
        collectionViewSale.dataSource = self
        collectionViewSale.delegate = self
    
    }
    
}
