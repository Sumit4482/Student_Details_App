import Foundation
import UIKit

struct Student {
    let name: String
    let rollNo: String
    let image: UIImage
    let dob: Date
    let contactNo: String
    let standard: String
    
    init(name: String, rollNo: String, image: UIImage, dob: Date, contactNo: String, standard: String) {
        self.name = name
        self.rollNo = rollNo
        self.image = image
        self.dob = dob
        self.contactNo = contactNo
        self.standard = standard
    }
}
