//
//  TosNetworkManager.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import Foundation

struct TosNetworkManager {
    let url: URL? = URL(string: "http://localhost:8080/courses")
    
    func fetchTos() async throws -> TosModel {
        do {
            let data = try await fetchData()
            print(data.nicePrintedJSONString)
            let decoder = JSONDecoder()
            let tos = try decoder.decode(TosModel.self, from: data)
            return tos
        } catch {
            throw URLError(.backgroundSessionWasDisconnected)
        }
    }
    
    private func fetchData() async throws -> Data {
        guard let url else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            // TODO: Add custom errors for validation
            throw URLError(.badServerResponse)
        }
    }
}
