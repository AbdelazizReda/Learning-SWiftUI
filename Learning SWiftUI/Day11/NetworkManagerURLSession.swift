//
//  NetworkManagerURLSession.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 30/01/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case invalidData
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}



struct NetworkManager {
    static func request<T: Decodable>(urlString: String,
                                      method: HTTPMethod = .get,
                                      parameters: [String: Any]? = nil,
                                      completion: @escaping (Result<T, Error>) -> Void) {
        var urlStringWithParams = urlString
        
        // Append parameters to URL if they exist
        if let parameters = parameters, !parameters.isEmpty {
            let queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\(String(describing: $0.value))") }
            var urlComponents = URLComponents(string: urlStringWithParams)
            urlComponents?.queryItems = queryItems
            urlStringWithParams = urlComponents?.url?.absoluteString ?? urlString
        }
        
        guard let url = URL(string: urlStringWithParams) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method == .post || method == .put {
            if let parameters = parameters {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}


 //Do: Calling for this network

//
//let postURL = "https://jsonplaceholder.typicode.com/posts"
//
//let parameters = ["userId": 1, "title": "New Post", "body": "This is the body of the new post"] as [String : Any]
//
//NetworkManager.request(urlString: postURL, method: .post, parameters: parameters) { (result: Result<Post, Error>) in
//    switch result {
//    case .success(let post):
//        print("Post title: \(post.title)")
//    case .failure(let error):
//        print("Error: \(error.localizedDescription)")
//    }
//}
//




//DO:- This Test Model
struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
