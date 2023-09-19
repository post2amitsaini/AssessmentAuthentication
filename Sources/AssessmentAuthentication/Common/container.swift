//
//  File.swift
//  
//
//  Created by Amit Saini on 14/09/23.
//

import Swinject

protocol AuthenticationDependencies {
    func registerDependencies(container: Container)
}


public class DefaultAuthenticationDependencies: AuthenticationDependencies {
    public init() { }
    
    public func registerDependencies(container: Container) {
    }
}


