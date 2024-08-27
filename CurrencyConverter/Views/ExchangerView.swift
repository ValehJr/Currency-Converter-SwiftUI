//
//  ExchangerView.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 24.08.24.
//

import SwiftUI

struct ExchangerView: View {
   @State private var selectedCurrency1 = "USD"
   @State private var selectedCurrency2 = "AZN"
   @State private var exchangeRate = ""

   @State var exchangeVM = ExchangerViewModel()

   var body: some View {
	  VStack {
		 VStack {
			CountryView(amount: $exchangeVM.amount1, selectedCurrency: $selectedCurrency1, imageURL: exchangeVM.flagURL(for: selectedCurrency1))
			   .onChange(of:exchangeVM.amount1) {
				  if exchangeVM.amount1 == "" {
					 exchangeVM.amount2 = ""
				  }
			   }

			CountryView(amount: $exchangeVM.amount2, selectedCurrency: $selectedCurrency2, imageURL: exchangeVM.flagURL(for: selectedCurrency2))
			   .onChange(of:exchangeVM.amount2) {
				  if exchangeVM.amount2 == "" {
					 exchangeVM.amount1 = ""
				  }
			   }

		 }
		 .frame(maxWidth: 320, maxHeight: 270)
		 .background(.white)
		 .clipShape(
			RoundedRectangle(cornerRadius: 20)
		 )
		 .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 4)
		 .overlay(
			ZStack {
			   Divider()
				  .background(.dividerGray)
				  .frame(maxWidth: 280)

			   Circle()
				  .frame(width: 44, height: 44)
				  .foregroundStyle(.customBlue)
			},
			alignment: .center
		 )

		 HStack {
			VStack(alignment:.leading) {
			   Text("Indicative Exchange Rate")
				  .font(.custom("Roboto-Regular", size: 16))
				  .foregroundStyle(.customGray)

			   Text(exchangeRate)
				  .font(.custom("Roboto-Medium", size: 16))
				  .padding(.vertical, 1)

			}
			Spacer()
		 }
		 .padding(.horizontal, 20)
		 .padding(.vertical, 20)
	  }
	  .onAppear {
		 Task {
			await updateExchangeRate()
		 }
	  }
	  .onChange(of: selectedCurrency1) {
		 Task {
			await updateExchangeRate()
		 }
	  }
	  .onChange(of: selectedCurrency2) {
		 Task {
			await updateExchangeRate()
		 }
	  }
   }

   private func updateExchangeRate() async {
	  await exchangeVM.fetchData(withURL: "\(Config.baseURL)/pair/\(selectedCurrency1)/\(selectedCurrency2)/1")

	  if let rate = exchangeVM.postData {
		 exchangeRate = "1 \(rate.base_code) = \(rate.conversion_rate) \(rate.target_code)"
	  }

	  exchangeVM.amount1 = ""
	  exchangeVM.amount2 = ""
   }
}

#Preview {
   ExchangerView()
}
