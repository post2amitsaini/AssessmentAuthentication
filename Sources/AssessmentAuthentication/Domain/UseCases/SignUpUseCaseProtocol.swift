//
//  SignUpUseCaseProtocol.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

protocol SignUpUseCaseProtocol {
    func execute(credentials: AuthCredentials) async throws -> Bool
}
