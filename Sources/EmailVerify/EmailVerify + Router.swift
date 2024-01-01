//
//  File.swift
//  
//
//  Created by mslm on 01/01/2024.
//

import Foundation
import MslmNetworkManager

extension EmailVerify {
    public enum Router {

        /// Endpoint for a single verification request.
        ///
        /// - Parameters:
        ///   - email: The email to be verified.
        ///   - method: The HTTP method to be used for the request.
        case singleVerify(email: String, method: HTTPMethod)
    }
}
