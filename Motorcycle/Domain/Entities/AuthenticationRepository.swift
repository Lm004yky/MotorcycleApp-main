import Foundation
import Combine

protocol AuthenticationRepository {
    func register(email: String, password: String, firstName: String, lastName: String) -> AnyPublisher<User, Error>
    func login(email: String, password: String) -> AnyPublisher<User, Error>   
}
