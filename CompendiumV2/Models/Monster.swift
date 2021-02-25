import Foundation

struct Monster: Codable{
    let ID: Int
    let name: String
    let region: String
    let classification: String
    let description: String
    let imageName: String
    
    init(ID: Int, name: String, region: String, classification: String,
         description: String, imageName: String){
        self.ID =  ID;                  self.name = name;
        self.region = region;           self.classification = classification;
        self.description = description; self.imageName = imageName
    }
}
