//
//  CountryView.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 24.08.24.
//

import SwiftUI

struct CountryView: View {
   @Binding var amount: String
   @Binding var selectedCurrency: String
   let imageURL: URL?

   @State var viewModel = CountryViewModel()

   var body: some View {
	  VStack {
		 HStack {
			Text("Amount")
			   .font(.custom("Roboto-Regular", size: 15))
			   .foregroundStyle(.customGray)
			Spacer()
		 }

		 HStack {
			if viewModel.image != nil {
			   Image(uiImage: viewModel.image!)
				  .resizable()
				  .scaledToFit()
				  .frame(maxWidth: 45, maxHeight: 45)
			} else {
			   Image(systemName: "questionmark.circle")
				  .resizable()
				  .scaledToFit()
				  .frame(width: 40, height: 30)
				  .clipShape(Circle())
				  .onAppear {
					 viewModel.loadImage(from: imageURL)
				  }
			}

			Menu {
			   ForEach(viewModel.currencies, id: \.self) { currency in
				  Button(action: {
					 selectedCurrency = currency
				  }) {
					 Text(currency)
				  }
			   }
			} label: {
			   HStack {
				  Text(selectedCurrency)
					 .font(.custom("Roboto-Medium", size: 20))
					 .foregroundStyle(.customBlue)
					 .lineLimit(1)
					 .minimumScaleFactor(0.9)
					 .padding(.leading, 5)
					 .padding(.trailing, 3)

				  Image(systemName: "chevron.down")
					 .resizable()
					 .scaledToFill()
					 .frame(maxWidth: 12, maxHeight: 8)
					 .fontWeight(.bold)
					 .foregroundStyle(.customGray)
			   }
			}

			Spacer()

			ZStack {
			   RoundedRectangle(cornerRadius: 7)
				  .foregroundStyle(.numberBackground)

			   HStack {
				  Spacer()
				  TextField("", text: $amount)
					 .font(.custom("Roboto-Medium", size: 20))
					 .foregroundStyle(.numberGray)
					 .padding(.trailing, 10)
					 .lineLimit(1)
					 .minimumScaleFactor(0.6)
					 .allowsTightening(true)
					 .multilineTextAlignment(.center)
					 .keyboardType(.decimalPad)
			   }
			}
			.frame(maxWidth: 141, maxHeight: 45)
		 }
		 .padding(.vertical, 10)

		 Spacer()
	  }
	  .padding()
	  .onChange(of: imageURL) {
		 viewModel.loadImage(from: imageURL)
	  }
   }
}

#Preview {
   @State var amount = "123"
   @State var selectedCurrency = "USD"
   return CountryView(amount: $amount, selectedCurrency: $selectedCurrency, imageURL: URL(string: "https://flagsapi.com/AZ/flat/64.png"))
}
