//
//  ErrorServer.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 29.04.2024.
//

import Foundation

struct ErrorServer: Codable {
    let errorCode: String
    let errorTitle: String
    let errorMessage: String
}
