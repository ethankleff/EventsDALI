//
//  EventsView.swift
//  Events App
//
//  Created by Ethan Rackleff on 2/12/21.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        VStack {
            EventsHeader()
            ScrollView {
                ForEach(postData) { item in
                    EventPost(post: item)
                        .padding(.top, 24)
                        .padding(.bottom, 8)
                }
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}

struct EventsHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Rectangle()
                    .frame(width: 40.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                Rectangle()
                    .frame(width: 28.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                Rectangle()
                    .frame(width: 16.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
            }
            .padding(.top, 8)
            .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 0.0) {
                Text("Events")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Rectangle()
                    .frame(width: 64.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)//find out how to add blur to shadow
            }
            .padding(.top, 8)
            .padding(.horizontal, 4)
            Spacer()
            
            Image(systemName: "gearshape.fill")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                .padding(.top, 8)
                .padding(.trailing, 8)
        }
    }
}

struct EventPost: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.trailing, 8)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Feb 29")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .opacity(0.7)
                    Text("2 P.M.")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .opacity(0.7)
                    
                }
            }
                Text("@Ava.nothstine and 27 other friends are going")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .opacity(0.5)
                    .padding(.bottom, 0.3)
            VStack (alignment: .leading) {
                Text(post.text)
                .font(.system(size: 16, weight: .regular, design: .rounded))
                HStack {
                    Image("ProfilePhoto")
                        .resizable()
                        .frame(width:38, height: 38)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("EthanAre123")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .fontWeight(.semibold)
                        Text("2 min ago")
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .opacity(0.5)
                    }
                    Spacer()
                }
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: "text.bubble.fill" )
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.trailing, 4)
                        .opacity(0.5)
                    Text("233")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .padding(.trailing, 8)
                        .opacity(0.5)
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.trailing, 4)
                        .opacity(0.5)
                    Text("14")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .padding(.trailing, 8)
                        .opacity(0.5)
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .opacity(0.5)
                }
                Rectangle()
                    .frame(width: 316, height: 1)
                    .padding(.top, 8)
                    .opacity(0.3)
                Spacer()
                HStack {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                    Text("123")
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                       
                    Spacer()
                    Image(systemName: "questionmark.square.fill")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Color("QuestionBlue"))
                    Text("123")
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .foregroundColor(Color("QuestionBlue"))
                    Spacer()
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Color("CheckGreen"))
                    Text("123")
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .foregroundColor(Color("CheckGreen"))
                }
                .padding(.vertical, 12)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .background(Color("OffWhiteBackground"))
        .cornerRadius(20)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .shadow(radius: 10)
        
    }
}

struct Post: Identifiable {
    var id = UUID() //gives unique id to data
    var title: String
    var text: String
    
}//data sorter for further development

let postData = [
    Post(title: "Party at my place 123 Grove St. Come over guys!", text: "I have a lot of snacks. We can watch movies. It'll be awessome!"),
    Post(title: "Workout tonight! Chest day who's joining?", text: "Grinding out somee gym time let's goo get it yayayayayaya"),
    Post(title: "Another headline of something super awesome that I can't do because of COVID", text: "Man COVID isn't very cool."),
    Post(title: "", text: "OliverTiptonisCool")
    ]//data areea for further development
