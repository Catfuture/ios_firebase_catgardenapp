//
//  HomeViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Firebase
import FirebaseDatabase
class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //tao mang chua cac doi tuong
    var products:[Product] = []
    let user = UserDefaults.standard
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductSellerCollectionViewCell
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

    }
    @IBOutlet weak var collectionBestSeller: UICollectionView!
    
    @IBOutlet weak var btndelivery: UIButton!
    
    
    
    @IBOutlet weak var btnAddressstore: UIButton!
    
    @IBOutlet weak var txtAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref.child("product").observeSingleEvent(of: .value) {Snapshot in
            let dicdata : Dictionary<String,Any> = Snapshot.value as! Dictionary<String,Any>
            
            for i in dicdata{

                if Product(object: i.value).quatily < 100 {
                    self.products.append(Product(object: i.value))
                }
            }
            DispatchQueue.main.async {
                self.collectionBestSeller.reloadData()
            }
            
        }
        collectionBestSeller.dataSource = self
        collectionBestSeller.delegate = self
        
        if user.object(forKey: "user_id") != nil{
            
            let _user_id : String = user.object(forKey: "user_id") as! String
            ref.child("users").child(_user_id).observeSingleEvent(of: .value) { [self] Snapshot in
                txtAddress.text =  User(object: Snapshot.value).address
                
            }
        }
        
    }
    
    @IBAction func btnAddressStore(_ sender: Any) {
        txtAddress.text =  "53 Vo Van Ngan,Thu Duc,Ho Chi Minh"
        
    }
    @IBAction func btnDelivery(_ sender: UIButton) {
        
        let _user_id : String = user.object(forKey: "user_id") as! String
        ref.child("users").child(_user_id).observeSingleEvent(of: .value) { [self] Snapshot in
            txtAddress.text =  User(object: Snapshot.value).address
            
        }
            
    }
}
