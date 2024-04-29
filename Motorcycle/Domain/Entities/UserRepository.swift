import Foundation
import Combine

protocol UserRepository {
    func fetchUser() -> AnyPublisher<User?, Error>
    func updateUser(firstName: String, lastName: String) -> AnyPublisher<Void, Error>
    func logout() -> AnyPublisher<Void, Error>
}
