//
//  ContentView.swift
//  Events App
//
//  Created by Ethan Rackleff on 2/10/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import SDWebImage

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var showPostView = false

    @State var title = ""
    @State var text = ""
    
    let tabBarImages = ["calendar", "plus.rectangle.fill", "person.fill"]
    
    var body: some View {
        VStack{
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $showPostView, content: {
                        VStack {
                            HStack {
                                Button(action: {showPostView.toggle()}, label: {
                                Text("Cancel")
                                })
                                .padding(.leading, 16)
                                Spacer()
                            }
                            .padding(.bottom, 16)
                            HStack {
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Text("Post")
                                        .font(.system(size: 30, weight: .bold, design: .rounded))
                                    Rectangle()
                                        .frame(width: 48.0, height: 4.0)
                                        .foregroundColor(Color("AccentColor"))
                                        .cornerRadius(10)
                                        .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)//find out how to add blur to shadow
                                }
                                .padding(.top, 8)
                                .padding(.horizontal, 24)
                                Spacer()
                            }
                            .padding(.bottom, 24)
                                VStack {
                                    HStack {
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color("AccentColor"))
                                            .frame(width:44, height:44)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                            .shadow(color: .gray, radius: 4)
                                            .padding(.leading)
                                            .padding(.bottom, 4)
                                        TextField("Event Name", text: $title)
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .padding(.leading)
                                            .padding(.trailing)
                                    }
                                    
                                    Divider()
                                        .padding(.horizontal, 16)
                                    
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                            .foregroundColor(Color("AccentColor"))
                                            .frame(width:44, height:44)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                            .shadow(color: .gray, radius: 4)
                                            .padding(.leading)
                                            .padding(.top, 4)
                                        TextField("Event Description", text: $text)
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                            .padding(.leading)
                                            .padding(.trailing)
                                    }
                                }
                                .frame(height: 136)
                                .frame(width: 340)
                                .background(Color("OffWhiteBackground"))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: Color.black.opacity(0.2), radius:20, x:0, y: 20)
                                .padding(.horizontal, 16)
                            Spacer()
                        }//Post Screen
                    })
                switch selectedIndex {
                    case 0:
                        EventsView()
                    case 1:
                        Text("Remaining Ttabs")
                    default:
                         ProfileFriendView()
                }
                
                
            }//conrols what view is displayed
                Spacer()
            Divider()
                .offset(y:-10)
                
                HStack {
                    ForEach(0..<3) { number in
                        Button(action: {
                            
                            if number == 1 {
                                showPostView.toggle()
                                return
                            }
                            
                            selectedIndex = number
                        }, label: {
                        Spacer()
                            
                            if number == 1 {
                                Image(systemName: tabBarImages[number])
                                    .font(.system(size: 44, weight: .bold))
                                    .foregroundColor(Color("AccentColor"))
                                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 2, y: 2)
                            }
                            
                            
                            else {
                        Image(systemName: tabBarImages[number])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(selectedIndex == number ? Color(.black) : .init(white: 0.8))
                            }
                            
                            
                        Spacer()
                    })
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}

}
