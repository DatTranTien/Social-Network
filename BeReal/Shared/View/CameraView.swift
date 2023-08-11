//
//  CameraView.swift
//  BeReal
//
//  Created by Admin on 11/08/2023.
//

import SwiftUI

@available(iOS 15, *)
struct CameraView: View {
    @State var switchingCamera = false
    @State var takePhotoCliked = false
    @State var selectedBackImage: UIImage?
    @State var selectedFrontImage: UIImage?
    @State var chooseFrontPhoto = false
    @State var backImage: Image?
    @State var photoTaken = false
    @State var frontImage: Image?
    @ObservedObject var viewModel: CameraViewModel
    init(viewModel: CameraViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("BeReal")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }.padding(.horizontal)
                Spacer()
            }
            
            VStack{
             Text("04:57:11")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                
                ZStack(alignment: .topLeading){
                    GeometryReader {
                        g in
                        VStack{
                            if frontImage != nil {
                                HStack{
                                 RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 125, height: 165)
                                        .overlay(
                                            VStack{
                                                if let imageFront = frontImage {
                                                    imageFront.resizable()
                                                        .cornerRadius(8)
                                                        .frame(width: 120,height: 160)
                                                        .scaledToFit()
                                                }
                                            }
                                        ).padding(.leading)
                                    Spacer()
                                }.padding(.top,18)
                            }
                            Spacer()
                        }.sheet(isPresented: $chooseFrontPhoto){
                            loadFrontImage()
                            self.photoTaken.toggle()
                            self.switchingCamera.toggle()
                        } content: {
                            ImagePicker(image: $selectedFrontImage)
                        }
                    }.zIndex(1)
                    if let image = backImage {
                        image.resizable().cornerRadius(12).scaledToFit()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
                            .overlay(
                                VStack{
                                 ProgressView()
                                    Text("Wait, wait, wait, now smile")
                                }
                                    .foregroundColor(.white)
                                    .opacity(self.switchingCamera ?1:0)
                            ).sheet(isPresented: $takePhotoCliked){
                                loadBackImage()
                                self.switchingCamera.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                    self.chooseFrontPhoto.toggle()
                                }
                            } content: {
                                ImagePicker(image: $selectedBackImage)
                            }
                    }else {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.gray)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
                            .overlay(
                                VStack{
                                 ProgressView()
                                    Text("Wait, wait, wait, now smile")
                                }
                                    .foregroundColor(.white)
                                    .opacity(self.switchingCamera ?1:0)
                            ).sheet(isPresented: $takePhotoCliked){
                                loadBackImage()
                            } content: {
                                ImagePicker(image: $selectedBackImage)
                            }
                    }
                }
                
//                if let image = backImage {
//                    image.resizable().cornerRadius(12).scaledToFit()
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
//                        .overlay(
//                            VStack{
//                             ProgressView()
//                                Text("Wait, wait, wait, now smile")
//                            }
//                                .foregroundColor(.white)
//                                .opacity(self.switchingCamera ?1:0)
//                        ).sheet(isPresented: $takePhotoCliked){
//                            loadBackImage()
//                            self.switchingCamera.toggle()
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
//                                self.chooseFrontPhoto.toggle()
//                            }
//                        } content: {
//                            ImagePicker(image: $selectedBackImage)
//                        }
//                }else {
//                    RoundedRectangle(cornerRadius: 12)
//                        .foregroundColor(.gray)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
//                        .overlay(
//                            VStack{
//                             ProgressView()
//                                Text("Wait, wait, wait, now smile")
//                            }
//                                .foregroundColor(.white)
//                                .opacity(self.switchingCamera ?1:0)
//                        ).sheet(isPresented: $takePhotoCliked){
//                            loadBackImage()
//                        } content: {
//                            ImagePicker(image: $selectedBackImage)
//                        }
//                }
                VStack{
                    if photoTaken {
                        Button(action: {
                            send()
                        }, label: {
                            HStack{
                             Text("SEND")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40,weight: .black))
                                Image(systemName: "location.north.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20,weight: .black))
                                    .rotationEffect(.degrees(90))
                            }
                        })
                    }else {
                        HStack(alignment: .center,spacing: 18){
                            Image(systemName: "bolt.slash.fill")
                                .font(.system(size: 28))
                            
                            Button(action: {
                                self.takePhotoCliked.toggle()
                            }, label: {
                                Image(systemName: "circle")
                                    .font(.system(size: 70))
                            })
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 24))
                        }.foregroundColor(.white)
                    }
                }.offset(y: -20)
                Spacer()
            }.padding(.top, 50)
            
            
            
        }
    }
    func loadBackImage(){
        guard let selectedBackImage = selectedBackImage else { return }
        backImage = Image(uiImage: selectedBackImage)
    }
    func loadFrontImage(){
        guard let selectedFrontImage = selectedFrontImage else { return }
        frontImage = Image(uiImage: selectedFrontImage)
    }
    func send(){
        if selectedBackImage != nil && selectedFrontImage != nil {
            viewModel.takePhoto(backImage: selectedBackImage!, frontImage: selectedFrontImage!){
                backImageUrl, frontImageUrl in
                do {
                    Task{
                        await viewModel.postBereal(frontImageUrl:frontImageUrl,backImageUrl:backImageUrl)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
