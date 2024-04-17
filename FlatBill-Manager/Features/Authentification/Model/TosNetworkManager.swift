//
//  TosNetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import Foundation

struct TosNetworkManager {
    let url: URL? = URL(string: ApiKeys.tosKey)
    
    func fetchTos() async throws -> TosModel {
        do {
            let data = try await fetchData()
            let decoder = JSONDecoder()
            let tos = try decoder.decode(TosModel.self, from: data)
            return tos
        } catch {
            throw TosNetworkError.errorConversion
        }
    }
    
    private func fetchData() async throws -> Data {
        guard let url else {
            throw TosNetworkError.badUrl
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw TosNetworkError.dataError
        }
    }
}
