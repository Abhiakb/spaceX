
import SwiftUI



class SpaceXRocketViewModel: ObservableObject {
    @Published var rockets: [SpaceXRocket] = []
    
    func fetchRockets() {
        guard let url = URL(string: "https://api.spacexdata.com/v3/rockets") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(String(describing: error))")
                return
            }
            
            do {
                let rockets = try JSONDecoder().decode([SpaceXRocket].self, from: data)
                DispatchQueue.main.async {
                    self.rockets = rockets
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}




