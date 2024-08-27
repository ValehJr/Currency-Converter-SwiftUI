//
//  NetworkErrors.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 24.08.24.
//

import Foundation

enum NetworkError: Error {
   case badUrl
   case invalidRequest
   case badResponse
   case badStatus
   case failedToDecodeResponse
}
