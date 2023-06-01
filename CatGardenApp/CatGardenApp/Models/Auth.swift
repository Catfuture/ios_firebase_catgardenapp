//
//  Auth.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/2/23.
//

import Foundation
import UIKit
import FirebaseAuth

class Auth : ObservableObject{
    
    let auth = Auth.auth()
    
    var isSignedIn : Bool{
        return auth.currentUser != nil
    }
}
