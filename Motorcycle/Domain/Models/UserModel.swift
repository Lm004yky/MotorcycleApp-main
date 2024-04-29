import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var uid: String?
    let email: String
    let firstName: String
    let lastName: String
    let profilePhotoURL: String?

    enum CodingKeys: String, CodingKey {
        case uid
        case email
        case firstName
        case lastName
        case profilePhotoURL
    }
}
