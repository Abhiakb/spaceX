import Foundation
import Combine

class LaunchesViewModel: ObservableObject {
    @Published var launches: [Launch] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchLaunches() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://api.spacexdata.com/v3/launches") else {
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Launch].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] launches in
                self?.launches = launches
            }
            .store(in: &cancellables)
    }
}
