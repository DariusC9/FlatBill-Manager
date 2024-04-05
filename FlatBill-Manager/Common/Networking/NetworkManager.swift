//
//  NetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import Foundation

/// Protocol needed for  NetworkManager
protocol NetworkService {
    var url: URL? { get }
    func fetchData() async throws -> Data
}
/// Protocol needed for NetworkManager
protocol ApiHandler {
    var decoder: JSONDecoder { get }
    func decodeHandler<T: Codable>(with data: Data) throws -> [T]
}

/// Main class responsable for API calls
class NetworkManager<T: Codable> {
    private let networkService: NetworkService
    private let apiHandler: ApiHandler
    
    init(networkService: NetworkService, apiHandler: ApiHandler) {
        self.networkService = networkService
        self.apiHandler = apiHandler
    }
    
    func fetchData() async throws -> [T] {
        let data = try await networkService.fetchData()
        return try apiHandler.decodeHandler(with: data)
    }
}
