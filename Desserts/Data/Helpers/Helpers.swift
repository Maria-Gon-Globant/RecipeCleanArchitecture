//
//  Helpers.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            let loadedData = try decoder.decode(T.self, from: data)
            return loadedData
        } catch {
            print("Decoding error: \(error)")
            fatalError("Could not decode \(file) from bundle.")
        }
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    // If there is an error, return the error.
                    if let error = error { failure(error) }
                    return }
                
                do {
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    // Return the data successfully from the server
                    completion((serverData))
                } catch {
                    // If there is an error, return the error.
                    failure(error)
                }
            }.resume()
    }
    func encode<T: Encodable>(data: T, to file: String, key: String) {
        let existingObjects = [key: data]
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            
            let jsonData = try encoder.encode(existingObjects)
            var jsonString = String(data: jsonData, encoding: .utf8)!
            guard let fileURL = self.url(forResource: file, withExtension: nil) else {
                fatalError("Could not find \(file) in bundle.")
            }
            try jsonData.write(to: fileURL)
            print("Data saved successfully to \(file)")
        } catch {
            print("Encoding error: \(error)")
            fatalError("Could not encode data to \(file)")
        }
    }
}
