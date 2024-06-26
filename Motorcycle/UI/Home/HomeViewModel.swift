import Combine
import Resolver

class HomeViewModel: ObservableObject {
    @Published var uid: String = ""
    @Published var email: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var imageUrl: String = ""
    @Published var motorcycles: [Motorcycle] = []

    // Inject the AuthenticationRepository
    @Injected private var authRepository: AuthenticationRepository
    @Injected private var userRepository: UserRepository
    @Injected private var motorcycleRepository: MotorcycleRepository

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchUserProfile()
        fetchMotorcycles()
    }

    func fetchUserProfile() {
        userRepository.fetchUser()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    // Handle the fetch user error
                    print("Error fetching user: \(error.localizedDescription)")
                }
            }, receiveValue: { user in
                self.uid = user?.uid ?? "default"
                self.firstName = user?.firstName ?? "default"
                self.lastName = user?.lastName ?? "default"
                self.email = user?.email ?? "default"
                self.imageUrl = user?.profilePhotoURL ?? "default"
                // Load the p rofile photo, you can implement this separately
            })
            .store(in: &cancellables)
    }

    var greetingMessage: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())

        switch hour {
        case 0 ..< 12:
            return "Good morning, \(firstName)!"
        case 12 ..< 17:
            return "Good afternoon, \(firstName)!"
        default:
            return "Good evening, \(firstName)!"
        }
    }

    func fetchMotorcycles() {
        motorcycleRepository.fetchMotorcycles()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    // Handle the fetch user error
                    print("Error fetching motorcycles: \(error.localizedDescription)")
                }
            }, receiveValue: { motorcycles in
                // Update the UI with the fetched user data
                self.motorcycles = motorcycles
            })
            .store(in: &cancellables)
    }
}
