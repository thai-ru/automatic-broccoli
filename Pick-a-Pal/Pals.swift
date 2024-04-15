//
//  Pals.swift
//  Pick-a-Pal
//
//  Created by Robinson Thairu on 15/04/2024.
//

import Foundation
import SwiftData

@Model
class Pal {
    
let firstName: String
let lastName:String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
