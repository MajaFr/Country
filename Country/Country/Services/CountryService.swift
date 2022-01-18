//
//  CountryService.swift
//  Country
//
//  Created by Marzena Frąk on 06/01/2022.
//

import Foundation

class CountryService {
    
    func getCountryDetails(completion: @escaping ([Country]?) -> ()) {
        guard let url = URL(string: "https://restcountries.com/v2/all") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) {
            data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { completion(nil); return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let countries = try jsonDecoder.decode([Country].self, from: data)
                completion(countries)
            } catch {
                completion(nil)
                print(error)
            }
        }

        task.resume()
    }
}
