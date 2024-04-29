import Combine

protocol MotorcycleRepository {
    func fetchMotorcycles() -> AnyPublisher<[Motorcycle], Error>
}
