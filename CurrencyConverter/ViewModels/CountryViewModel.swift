//
//  CountryViewModel.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 26.08.24.
//

import Foundation
import SwiftUI

@Observable
class CountryViewModel {
   let currencies:[String] = ["USD", "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG",
							  "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB",
							  "BRL", "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP",
							  "CNY", "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD",
							  "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "FOK", "GBP", "GEL", "GGP",
							  "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG",
							  "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD",
							  "JOD", "JPY", "KES", "KGS", "KHR", "KID", "KMF", "KRW", "KWD", "KYD",
							  "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA",
							  "MKD", "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR",
							  "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN",
							  "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF",
							  "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SLL", "SOS",
							  "SRD", "SSP", "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP",
							  "TRY", "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "UYU", "UZS", "VES",
							  "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR",
							  "ZMW", "ZWL"]

   var image: UIImage? = nil

   func loadImage(from url: URL?) {
	  guard let url = url else {
		 self.image = nil
		 return
	  }
	  Task {
		 do {
			let (data, _) = try await URLSession.shared.data(from: url)
			if let uiImage = UIImage(data: data) {
			   DispatchQueue.main.async {
				  self.image = uiImage
			   }
			} else {
			   DispatchQueue.main.async {
				  self.image = nil
			   }
			}
		 } catch {
			DispatchQueue.main.async {
			   self.image = nil
			}
		 }
	  }
   }

}
