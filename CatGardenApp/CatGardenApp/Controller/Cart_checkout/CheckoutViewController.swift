//
//  CheckoutViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class CheckoutViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CheckoutTableViewCell
        
        cell.setup(with: carts[indexPath.row])
        return cell
    }
    let user = UserDefaults.standard
    
    var  carts : [ItemCart] = []
    @IBOutlet weak var txtPhone: UITextField!

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var lbNote: UITextField!
    @IBOutlet weak var tbViewCheckout: UITableView!
    @IBOutlet weak var lbTotal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user.object(forKey: "user_id") != nil{
            let _user_id : String = user.object(forKey: "user_id")! as! String
            //lay thong tin cua khach hang
            ref.child("users").child(_user_id).observeSingleEvent(of: .value) { [self] Snapshot in
                txtFullName.text =  User(object: Snapshot.value).fullname
                txtPhone.text =  User(object: Snapshot.value).phone
                txtAddress.text =  User(object: Snapshot.value).address
            }
            //thong tin mat hang
            
            var total : Int = 0
            //kiem tra trai khoan
            ref.child("carts").child(_user_id).observeSingleEvent(of:     .value, with: { [self] Snapshot in
                guard let dicdata : Dictionary<String,Any> = Snapshot.value as? Dictionary<String,Any>  else{
                    return
                }
                for i in dicdata{
                    self.carts.append(ItemCart(object: i.value))
                    total = total + (ItemCart(object: i.value).price * Int(ItemCart(object: i.value).quantity)!)
                }
                DispatchQueue.main.async {
                    self.tbViewCheckout.reloadData()
                }
                total = total + 30
            lbTotal.text = String(total) + ".000 VND"
            })
            tbViewCheckout.dataSource = self
            tbViewCheckout.delegate = self
            
            
        }
       
    }
    let ran = Int.random(in: 10000...99999)
    @IBAction func btnPlace(_ sender: UIButton) {
        let _user_id : String = user.object(forKey: "user_id")! as! String
        ref.child("bills").child(_user_id).child(String(ran)).setValue(["bill_id": ran,"fullname": txtFullName.text,"address": txtAddress.text,"phone": txtPhone.text,"total":lbTotal.text,"note":lbNote.text ,"status": "dang xu ly","date": String(describing: Date())])
        self.view.makeToast("thanh cong")
        
        ref.child("carts").child(_user_id).removeValue()
        
        let src = self.storyboard?.instantiateViewController(withIdentifier: "PageHome") as! UITabBarController
        self.view.window?.rootViewController = src
        self.view.window?.makeKeyAndVisible()
    }
}
