import Foundation
import SwiftUI
import Combine

protocol ProfilePhotoRepository {
    func uploadProfilePhoto(_ image: UIImage) -> AnyPublisher<URL, Error>
    func deleteProfilePhoto(_ imageURL: URL) -> AnyPublisher<Void, Error>
    func updateProfilePhotoURL(_ photoURL: URL) -> AnyPublisher<Void, Error>
}
