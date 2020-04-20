import Foundation

class NasaRequest: Decodable {
    let identifier: String
    let caption: String
    let image: String
    let date: String
    
    func getImageURL() -> URL {
        let strUrl = "https://epic.gsfc.nasa.gov/archive/natural/2015/10/31/jpg/\(image).jpg"
        return URL(string: strUrl)!
    }
}
