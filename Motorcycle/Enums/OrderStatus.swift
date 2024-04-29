enum OrderStatus: String, Codable {
    case pending
    case confirmed
    case shipped
    case delivered
    case canceled
}
