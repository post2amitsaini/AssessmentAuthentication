//
//  File.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation

protocol AuthenticationUseCaseProtocol {
    func signIn(email: String, password: String) async throws
}
