//
//  NotificationsView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

@available(iOS 15.0, *)
struct NotificationsView: View {
    @Environment(\.dismiss) var dismiss
    @State var mentions = false
    @State var comments = false
    @State var friendRequests = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("Other")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        })
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("On Bereal, you're in control of your push notifications.").fontWeight(.semibold)
                    Spacer()
                }
                HStack{
                    Text("You can choose the type of notifications you want to receive.").fontWeight(.semibold)
                    Spacer()
                }.font(.system(size: 16)).foregroundColor(.white)
                
                VStack(spacing: 14){
                    VStack{
                     NotificationButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                        HStack{
                            Text("Ercrimmival just sent you a friend request")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }
                
                
                VStack(spacing: 14){
                    VStack{
                     NotificationButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                        HStack{
                            Text("Ercrimmival commented on your BeReal")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }
                
                
                VStack(spacing: 14){
                    VStack{
                        NotificationButtonView(icon: "person.2.fill",text: "Friend requests", toggle: $friendRequests)
                        HStack{
                            Text("Ercrimmival just sent you a friend request")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }
                
                
                VStack(spacing: 14){
                    VStack{
                     NotificationButtonView(icon: "timer",text: "Late BeReal", toggle: $lateBeReal)
                        HStack{
                            Text("Ercrimmival just sent you a friend request")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }
                
                
                VStack(spacing: 14){
                    VStack{
                        NotificationButtonView(icon: "face.smiling.fill", text: "RealMojis", toggle: $realMojis)
                        HStack{
                            Text("just reacted to your BeReal.")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }.padding(.top,8)
                Spacer()
            }.padding(.horizontal).padding(.top,50)
            
            VStack{
             Spacer()
                
                WhiteButtonView(buttonActive: $buttonActive, text: "Save").onChange(of: mentions || comments || friendRequests || lateBeReal || realMojis, perform: {
                    _ in
                    self.buttonActive = true
                })
            }
            
        }
    }
}

@available(iOS 15.0, *)
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
