//
//  File.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation

protocol AuthRepositoryProtocol {
    func signIn(credentials: AuthCredentials) async throws -> Bool
}
