//
//  TosNetworkError.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 17.04.2024.
//

import Foundation

enum TosNetworkError: CustomErrorProtocol {
    case tosNil
    case badUrl
    case dataError
    case errorConversion
    
    var title: String {
        switch self {
        case .tosNil, .badUrl, .dataError, .errorConversion:
            return "Ooops, something went wrong"
        }
    }
    
    var message: String {
        switch self {
        case .tosNil, .badUrl, .dataError, .errorConversion:
            return "There has been a problem. Please make sure you have internet connection and try again."
        }
    }
}
