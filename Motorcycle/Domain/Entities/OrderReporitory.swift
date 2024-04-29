import Combine

protocol OrderRepository {
    func createOrder(_ order: Order) -> AnyPublisher<Void, Error>
    func getOrders() -> AnyPublisher<[Order], Error>
    func cancelOrder(_ orderID: String) -> AnyPublisher<Void, Error>
    // Add more methods for updating and deleting orders as needed
}
