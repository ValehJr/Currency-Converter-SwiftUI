//
//  ExchangerViewModel.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 24.08.24.
//

import Foundation

@Observable
class ExchangerViewModel {
   var postData: CurrencyRate?
   var conversionRate: Double = 1.0
   private var isUpdating = false

   var amount1: String = "" {
	  didSet {
		 if !isUpdating {
			isUpdating = true
			let sanitizedAmount1 = amount1.replacingOccurrences(of: ",", with: ".")
			if let amount = Double(sanitizedAmount1) {
			   let result = amount * conversionRate
			   amount2 = result == floor(result) ? String(result) : String(format: "%.2f", result)
			}
			isUpdating = false
		 }
	  }
   }

   var amount2: String = "" {
	  didSet {
		 if !isUpdating {
			isUpdating = true
			let sanitizedAmount2 = amount2.replacingOccurrences(of: ",", with: ".")
			if let amount = Double(sanitizedAmount2) {
			   let result = amount / conversionRate
			   amount1 = result == floor(result) ? String(result) : String(format: "%.2f", result)
			}
			isUpdating = false
		 }
	  }
   }
   
   func fetchData(withURL url: String) async {
	  guard let downloadedRates: CurrencyRate = await NetworkManager().downloadData(fromURL: url) else { return }
	  postData = downloadedRates
	  conversionRate = downloadedRates.conversion_rate
   }

   func flagURL(for countryCode: String) -> URL? {
	  let shortCode = String(countryCode.prefix(2)).uppercased()
	  let urlString = "https://flagsapi.com/\(shortCode)/\("flat")/\("64").png"
	  return URL(string: urlString)
   }
}
