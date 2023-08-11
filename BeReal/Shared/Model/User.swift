//
//  User.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    var username: String?
    var profileImageUrl: String?
    var name: String
    var date: String
    var bio: String?
    var location: String?
}
