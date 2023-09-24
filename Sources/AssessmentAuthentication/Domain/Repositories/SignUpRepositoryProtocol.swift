//
//  File.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

protocol SignUpRepositoryProtocol {
    func signUp(credentials: AuthCredentials) async throws -> Bool
}
