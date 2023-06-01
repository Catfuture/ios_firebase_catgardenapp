//
//  CartViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Firebase
import FirebaseDatabase

class CartViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    
    var  carts : [ItemCart] = []
    
    
    let user = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartTableViewCell
        
        cell.setup(with: carts[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let _user_id : String = user.object(forKey: "user_id") as! String
            ref.child("carts").child(_user_id).child((carts[indexPath.row]).id).removeValue()
            carts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }else if editingStyle == .insert{
            
        }
    }
    
    @IBOutlet weak var tbViewCart: UITableView!
    
    @IBOutlet weak var lbPriceTotal: UILabel!
    
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = editButtonItem
        if user.object(forKey: "user_id") != nil{
            //tong so tien thanh toan san pham trong gio hang
            var total : Int = 0
            //kiem tra trai khoan
            let _user_id : String = user.object(forKey: "user_id") as! String
            ref.child("carts").child(_user_id).observeSingleEvent(of:	 .value, with: { [self] Snapshot in
                guard let dicdata : Dictionary<String,Any> = Snapshot.value as? Dictionary<String,Any>  else{
                    return
                }
                for i in dicdata{
                    self.carts.append(ItemCart(object: i.value))
                    total = total + (ItemCart(object: i.value).price * Int(ItemCart(object: i.value).quantity)!)
                }
                DispatchQueue.main.async {
                    self.tbViewCart.reloadData()
                }
            lbPriceTotal.text = String(total) + ".000 VND"
            })
        } else{
                self.view.makeToast("")
    }
        tbViewCart.dataSource = self
        tbViewCart.delegate = self
    }
     
    
    @IBAction func barbtncancel(_ sender: UIBarButtonItem) {
        let src = self.storyboard?.instantiateViewController(withIdentifier: "PageHome") as! UITabBarController
        self.view.window?.rootViewController = src
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func barbtnedit(_ sender: UIBarButtonItem) {
        
    }
}
