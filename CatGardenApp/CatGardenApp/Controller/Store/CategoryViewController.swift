//
//  CategoryViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Firebase
import FirebaseDatabase
public let ref : DatabaseReference! = Database.database().reference()
class CategoryViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    
    //tao bien userdefaul
    
    
    //tao mang product
    var  products:[Product] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryTableViewCell
        
        cell.setup(with: products[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productItem:ProductViewController = storyboard?.instantiateViewController(withIdentifier: "productitem") as! ProductViewController
        productItem.item = products[indexPath.row]
        self.navigationController?.pushViewController(productItem, animated: true)
        //let src = storyboard?.instantiateViewController(withIdentifier: "productItem") as! ProductViewController
    }
   
    @IBOutlet weak var tbViewCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.child("product").observeSingleEvent(of: .value) {Snapshot in
            let dicdata : Dictionary<String,Any> = Snapshot.value as! Dictionary<String,Any>
            
            for i in dicdata{
                
                self.products.append(Product(object: i.value))
                
            }
            DispatchQueue.main.async {
                self.tbViewCategory.reloadData()
            }
            
        }
        tbViewCategory.dataSource = self
        tbViewCategory.delegate = self
        
    }
//
    
    
}

