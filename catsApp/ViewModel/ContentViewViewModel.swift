//
//  ContentViewViewModel.swift
//  catsApp
//
//  Created by Harold Villacob on 18/05/23.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    
    @Published var catBreeds: [CatModel] = []
    
    func fetchData() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("bda53789-d59e-46cd-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Datos inválidos")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let breeds = try decoder.decode([CatModel].self, from: data)
                DispatchQueue.main.async {
                    self.catBreeds = breeds
                }
                
            } catch let error {
                print("Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
