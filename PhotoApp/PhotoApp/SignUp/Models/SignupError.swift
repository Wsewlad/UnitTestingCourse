//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 05.05.2023.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsing
    case invalidUrl
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        default:
            return ""
        }
    }
}
