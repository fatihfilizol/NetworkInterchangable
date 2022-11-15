//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Fatih Filizol on 15.11.2022.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource : String) async throws -> [User] 
    
    var type : String {get}
}
