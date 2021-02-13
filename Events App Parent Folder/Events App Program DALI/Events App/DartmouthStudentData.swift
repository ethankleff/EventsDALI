//
//  DartmouthStudentData.swift
//  Events App
//
//  Created by Ethan Rackleff on 2/11/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct DartmouthStudentData: View {
    
    
    var body: some View {
       Home()
    }
}

struct DartmouthStudentData_Previews: PreviewProvider {
    static var previews: some View {
        DartmouthStudentData()
    }
}

struct Home : View {
    
    @ObservedObject var DartmouthStudents = getData()
    
    var body : some View {
        List(DartmouthStudents.data) {i in
            Text(i.id)
        }
    }
}

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
            
            let items = json[].array!
            
            for i in items {
                
                let id = i["name"].stringValue
                
                let year = i["year"].stringValue
                
                DispatchQueue.main.async {
                    
                    self.data.append(DartmouthStudents(id: id, year: ""))
                }
            }
        }.resume()
    }
}

struct DartmouthStudents : Identifiable {
    
    var id : String
    var year : String
}
