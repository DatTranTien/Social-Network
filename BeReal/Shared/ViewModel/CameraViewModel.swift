//
//  CameraViewModel.swift
//  BeReal
//
//  Created by Admin on 11/08/2023.
//

import UIKit
import Firebase
import FirebaseStorage

@available(iOS 15, *)
class CameraViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
    }
    
    func takePhoto(backImage: UIImage, frontImage: UIImage, completion: @escaping(String,String)->Void){
        ImageUploader.uploadImage(image: backImage, type: .post){
            urlBackImage in
            ImageUploader.uploadImage(image: frontImage, type: .post){
                urlFrontImage in
                completion(urlBackImage,urlFrontImage)
            }
        }
    }
    
    func postBereal(frontImageUrl: String, backImageUrl: String) async {
        let db = Firestore.firestore()
        
        let date = Date.now
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yy"
        
        let dateString = formatter.string(from: date)
        do{
            try await db.collection("posts").document("\(dateString)").collection("bereals").document(user.id!)
                .setData([
                    "frontImageUrl": frontImageUrl,
                    "backImageUrl": backImageUrl,
                    "userId": user.id,
                    "userName": user.name,
                ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
}


