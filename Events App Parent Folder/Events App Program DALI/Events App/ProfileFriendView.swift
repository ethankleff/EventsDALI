//
//  ProfileFriendView.swift
//  Events App
//
//  Created by Ethan Rackleff on 2/12/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct ProfileFriendView: View {
    @State public var showFriends = false
    @State public var viewFriends = CGSize.zero
    @ObservedObject var DartmouthStudents = getData()
    
    var body: some View {
        ZStack{
            VStack {
                ProfileHeader(showFriends: $showFriends)

                ProfileCard()
                Spacer()
                }
                .gesture(
                        DragGesture().onChanged { value in
                            self.viewFriends = value.translation
                        }
                        .onEnded { value in
                            if self.viewFriends.height < -50 {
                                self.showFriends.toggle()
                            }
                        }
                    )
                .offset(y: showFriends ? -550 : 0)
                .rotation3DEffect(Angle(degrees: showFriends ? -10: 0), axis: (x: 10, y: 0, z: 0))
                .animation(.spring(response:0.5,dampingFraction:0.6,blendDuration:0))
            VStack(spacing: 0.0){ //Friends Screen
                FriendsHeader(showFriends: $showFriends)
                if showFriends {
                    FriendsCard()
                }
            }
                .gesture(
                   DragGesture().onChanged { value in
                       self.viewFriends = value.translation
                   }
                   .onEnded { value in
                       if self.viewFriends.height > 50 {
                           self.showFriends.toggle()
                       }
                   }
                   )
                .offset(y: showFriends ? 20 : 288)
                .animation(.spring(response:0.5,dampingFraction:0.6,blendDuration:0))
        }
    }
}





struct friendsTitle: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("DALI Friends")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Rectangle()
                    .frame(width: 96.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                
            }
            .padding(.top, 24)
            .padding(.bottom, 24)
            .padding(.horizontal, 16)
            Spacer()
        }
    }
}

struct profileTitle: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Profile")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            Rectangle()
                .frame(width: 64.0, height: 4.0)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
                .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)//find out how to add blur to shadow
        }
        .padding(.top, 8)
        .padding(.horizontal, 24)
    }
}

struct ProfileScreen: View {
    var body: some View {
        HStack {
            profileTitle()
            Spacer()

            Image(systemName: "gearshape.fill")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                .padding(.top, 8)
            
            
            
        }
        .padding([.bottom, .trailing], 24)
        VStack(alignment: .leading) {
            HStack {
                Image("ProfilePhoto")
                VStack(alignment: .leading) {
                    Text("EthanAre123")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Blair Academy '21")
                        .opacity(0.5)
                    
                }
                Spacer()
            }
            //text
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 360, height: 518.0)
        .background(Color("OffWhiteBackground"))
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct friendssTitle: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("Friends")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Rectangle()
                    .frame(width: 64.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
        }
    }
}

public struct friendsCardData: View {
    var section: DartmouthStudents
    @ObservedObject var DartmouthStudents = getData()
    @State var follow = false
    public var body: some View {
        let ethnicity1 = section.americanIndianOrAlaskaNative + section.blackOrAfricanAmerican + section.hispanicOrLatino + section.nativHawaiianOrOtherPacificIslander
        let ethnicity2 = section.middleEastern + section.asian + section.white
        let ethnicityFinal = ethnicity1 + ethnicity2
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string: section.picture)!)
                    .resizable()
                    .frame(width:64, height: 64)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(section.id)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(section.major + " " + section.year)
                        .opacity(0.5)
                    
                }
                Spacer()
            }
                
            HStack(alignment: .center, spacing: 2) {
                VStack(alignment: .center) {
                    Text("218").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Friends").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 4)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                Spacer()
                VStack(alignment: .center){
                    Text("21").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Attended").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 4)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                Spacer()
                VStack(alignment: .center){
                    Text("3").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Hosted").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 4)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                
            }
            .padding(.vertical, 8)
            Text(follow ? "Following" : "Follow")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(follow ? .black : Color("AccentColor"))
                .onTapGesture {
                    self.follow.toggle()
                }
                .padding(.bottom, 4)
                .padding(.leading, 16)
                .animation(.easeInOut(duration: 0.25))
            VStack (alignment: .leading, spacing: 4) {
                Text("Description").font(.system(size: 18, weight: .semibold, design: .rounded))
                Group {
                    Text("Gender: " + section.gender)
                    Text("Ethnicity: " + ethnicityFinal)
                    Text("Hometown: " + section.home)
                    Text("Birthday: " + section.birthday)
                    Text("DALI Role: " + section.role)
                    if section.modification.isEmpty {
                        Text("Modification: None")
                    }
                    else {
                        Text("Modification: " + section.modification)
                    }
                    if section.minor.isEmpty{
                        Text("Minor: None")
                    }
                    else {
                        Text("Minor: " + section.minor)
                    }
                }
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .padding(.leading, 16)
                Text("Interests").font(.system(size: 18, weight: .semibold, design: .rounded))
                Group {
                    Text("Favorite Artist: " + section.favoriteArtist)
                    Text("Favorite Shoe: " + section.favoriteShoe)
                    Text("Favorite Color: " + section.favoriteColor)
                }
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .padding(.leading, 16)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 280, height: 518 )
        .background(Color("OffWhiteBackground"))
        .cornerRadius(20)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .shadow(radius: 20)
    }
}

struct Section: Identifiable {
    var id = UUID() //gives unique id to data
    var title: String
    var text: String
    var image: Image
    
}//data sorter for further development

let sectionData = [
    Section(title: "OliverTipton", text: "OliverTiptonisCool", image: Image("ProfilePhoto")),
    Section(title: "EthanRack", text: "EthanisCool", image: Image("ProfilePhoto")),
    Section(title: "OliverTipton", text: "OliverTiptonisCool", image: Image("ProfilePhoto")),
    Section(title: "EthanRack", text: "EthanisCool", image: Image("ProfilePhoto")),
    Section(title: "KathyFong", text: "Go Comp Sci!", image: Image("ProfilePhoto"))
    ]//data areea for further development

class getData : ObservableObject {
    
    @Published var data = [DartmouthStudents]()
    
    init(){
        
        let url = "https://raw.githubusercontent.com/dali-lab/dali-challenges/master/data/DALI_Data.json"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let item = json[].array!
            
            for i in item {
                
                let id = i["name"].stringValue
                let year = i["year"].stringValue
                let picture = i["picture"].stringValue
                let gender = i["gender"].stringValue
                let americanIndianOrAlaskaNative = i["Amereican Indian or Alaska Native"].stringValue
                let asian = i["Asian"].stringValue
                let blackOrAfricanAmerican = i["Black or African American"].stringValue
                let hispanicOrLatino = i["Hispanic or Latino"].stringValue
                let middleEastern = i["Middle Eastern"].stringValue
                let nativHawaiianOrOtherPacificIslander = i["Native Hawaiian or Other Pacific Islander"].stringValue
                let white = i["White"].stringValue
                let other = i["Other"].stringValue
                let major = i["major"].stringValue
                let minor = i["minor"].stringValue
                let modification = i["modification"].stringValue
                let birthday = i["birthday"].stringValue
                let role = i["role"].stringValue
                let home = i["home"].stringValue
                let favoriteShoe = i["favoriteShoe"].stringValue
                let favoriteArtist = i["favoriteArtist"].stringValue
                let favoriteColor = i["favoriteColor"].stringValue
                let phoneType = i["phoneType"].stringValue
                
                DispatchQueue.main.async {
                    
                    self.data.append(DartmouthStudents(id: id, year: year, picture: picture, gender: gender, americanIndianOrAlaskaNative: americanIndianOrAlaskaNative, asian: asian, blackOrAfricanAmerican: blackOrAfricanAmerican, hispanicOrLatino: hispanicOrLatino, middleEastern: middleEastern, nativHawaiianOrOtherPacificIslander: nativHawaiianOrOtherPacificIslander, white: white, other: other, major: major, minor: minor, modification: modification, birthday: birthday, role: role, home: home, favoriteShoe: favoriteShoe, favoriteArtist: favoriteArtist, favoriteColor: favoriteColor, phoneType: phoneType ))
                }
            }
        }.resume()
    }
}//get data from JSON file

struct DartmouthStudents : Identifiable {
    
    var id : String
    var year : String
    var picture : String
    var gender : String
    var americanIndianOrAlaskaNative : String
    var asian : String
    var blackOrAfricanAmerican : String
    var hispanicOrLatino : String
    var middleEastern : String
    var nativHawaiianOrOtherPacificIslander : String
    var white : String
    var other : String
    var major : String
    var minor : String
    var modification : String
    var birthday : String
    var role : String
    var home : String
    var favoriteShoe : String
    var favoriteArtist : String
    var favoriteColor : String
    var phoneType : String
}//Initializee JSON array



struct ProfileFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFriendView()
    }
}

struct ProfileCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("ProfilePhoto")
                    .resizable()
                    .frame(width:64, height: 64)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("EthanAre123")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Blair Academy '21")
                        .opacity(0.5)
                }
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 2) {
                VStack(alignment: .center) {
                    Text("218").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Friends").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 16)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                Spacer()
                VStack(alignment: .center){
                    Text("21").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Attended").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 16)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                Spacer()
                VStack(alignment: .center){
                    Text("3").font(.system(size: 18, weight: .semibold, design: .rounded))
                    Text("Hosted").font(.system(size: 12, weight: .regular, design: .rounded))
                }
                .padding(8)
                .padding(.horizontal, 16)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
            }
            HStack {
                Text("Edit Profile").font(.system(size: 18, weight: .semibold, design: .rounded))
                    .frame(width:310)
                    .padding(8)
                    .background(Color("AccentColor").opacity(0.5))
                    .cornerRadius(16)
                    .padding(.vertical, 8)
            }
            Text("Description").font(.system(size: 18, weight: .semibold, design: .rounded))
            VStack (alignment: .leading, spacing: 4) {
                Group {
                    Text("Gender: Male")
                    Text("Ethnicity: White")
                    Text("Hometown: Frelinghuysen, NJ")
                    Text("Birthday: 01/06/03")
                    Text("DALI Role: None" )
                    Text("Modification: None")
                    Text("Minor: None")
                }
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .padding(.leading, 16)
                Text("Interests").font(.system(size: 18, weight: .semibold, design: .rounded))
                Group {
                    Text("Favorite Artist: Whethan")
                    Text("Favorite Shoe: Sperry's")
                    Text("Favorite Color: Navy")
                }
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .padding(.leading, 16)
                
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 360, height: 518 )
        .background(Color("OffWhiteBackground"))
        .cornerRadius(20)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .shadow(radius: 20)
    }
}

struct ProfileHeader: View {
    @Binding var showFriends: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("Profile")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Rectangle()
                    .frame(width: 64.0, height: 4.0)
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)//find out how to add blur to shadow
            }
            .padding(.top, 8)
            .padding(.horizontal, 24)
            Spacer()
            
            Image(systemName: "gearshape.fill")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                .padding(.top, 8)
        }
        .padding(.bottom, 24)
        .padding(.trailing, showFriends ? -40 : 24 )
    }
}

struct FriendsHeader: View {
    @Binding var showFriends: Bool
    
    var body: some View {
        HStack {// Friends and search and settings button
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("DALI Friends")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Rectangle()
                        .frame(width: 128.0, height: 4.0)
                        .foregroundColor(Color("AccentColor"))
                        .cornerRadius(10)
                        .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                    
                }
                .padding(.top, 24)
                .padding(.horizontal, 24)
                
            }
            Spacer()
            
            Image(systemName: "magnifyingglass.circle.fill")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .shadow(color: Color("AccentColor").opacity(0.5), radius: 2, x: 0, y: 2)
                .padding(.top, 24)
                .padding(.trailing, showFriends ? 24 : -40 )
            
        }
        .animation(.spring(response:0.5,dampingFraction:0.6,blendDuration:0))
    }
}

struct FriendsCard: View {
    @ObservedObject var DartmouthStudents = getData()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{ //Friends Cards
                ForEach(DartmouthStudents.data) { i in
                    GeometryReader { geometry in
                        friendsCardData(section: i)
//                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -100), axis: (x: 0, y: 2, z: 0))
                    }
                }
                .frame(width: 280, height: 518)
                .padding(.horizontal, 16)
            }
            .padding(.trailing, 36)
            .padding(.top, 36)
            .padding(.bottom, 36)
        }
    }
}

