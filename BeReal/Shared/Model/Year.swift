//
//  Year.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import Foundation
import SwiftUI

public struct Year {
    public var day: String
    public var month: String
    public var year: String
    
    public init(day: String, month: String, year: String) {
        self.day = day
        self.month = month
        self.year = year
    }
    var date: String {
        return "\(day)/\(month)/\(year)"
    }
}
