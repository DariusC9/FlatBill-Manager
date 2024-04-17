//
//  CustomErrorProtocol.swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 17.04.2024.
//

import Foundation

protocol CustomErrorProtocol: Error {
    var title: String { get }
    var message: String { get }
}
