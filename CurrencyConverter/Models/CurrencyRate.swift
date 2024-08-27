//
//  CurrencyRate.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 24.08.24.
//

import Foundation

struct CurrencyRate: Codable {
   var result: String
   var base_code: String
   var target_code: String
   var conversion_rate: Double
   var conversion_result: Double
}
