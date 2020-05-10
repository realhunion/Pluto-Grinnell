//
//  UserInterestFetcher.swift
//  Pluto
//
//  Created by Hunain Ali on 4/22/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import Firebase

protocol InterestsFetcherDelegate:class {
    func interestArrayFetched(array : [Interest])
}

class InterestsFetcher {
    
    var db = Firestore.firestore()
    
    weak var delegate : InterestsFetcherDelegate?
    
    var interestIDArray : [String]
    init(interestIDArray : [String]) {
        self.interestIDArray = interestIDArray
    }
    
    
    
    
    
    //MARK: - Fetch
    
    func fetchInterests() {
        
        let fetchDispatchGroup = DispatchGroup()
        
        var interestArray : [Interest] = []
        
        for interestID in self.interestIDArray {
            
            fetchDispatchGroup.enter()
            
            db.collection("Interest-Profile").document(interestID).getDocument { (snap, err) in
                guard let doc = snap else { return }
                
                if let name = doc.data()?["name"] as? String, let description = doc.data()?["description"] as? String, let imageURL = doc.data()?["imageURL"] as? String {
                    
                    var metaUserArray : [MetaUser] = []
                    let likedBy = doc.data()?["likedBy"] as? [Any] ?? []
                    for object in likedBy {
                        if let o = object as? [String:Any] {
                            if let uid = o["userID"] as? String, let name = o["name"] as? String {
                                let mUser = MetaUser(userID: uid, name: name)
                                metaUserArray.append(mUser)
                            }
                        }
                    }
                    
                    let interest = Interest(interestID: interestID, name: name, description: description, imageURL: imageURL, likedBy: metaUserArray)
                    interestArray.append(interest)
                    
                }
                fetchDispatchGroup.leave()
            }
        }
        
        fetchDispatchGroup.notify(queue: .main) {
            self.delegate?.interestArrayFetched(array: interestArray)
        }
        
        
    }
    
    
}
