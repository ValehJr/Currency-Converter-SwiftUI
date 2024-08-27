//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Valeh Ismayilov on 23.08.24.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
	  ZStack {
		 Color.backgroundWhite.ignoresSafeArea()
		 VStack {
			
			Text("Currency Converter")
			   .font(.custom("Roboto-Bold", size: 25))
			   .foregroundStyle(.headerBlue)
			   .padding(.bottom,12)
			
			Text("Check live rates, set rate alerts, receive notifications and more.")
			   .font(.custom("Roboto-Regular", size: 16))
			   .minimumScaleFactor(0.8)
			   .allowsTightening(true)
			   .foregroundStyle(.customGray)
			   .multilineTextAlignment(.center)
			   .padding(.bottom,30)
			
			ExchangerView()
			
			Spacer()
		 }
		 .padding()
	  }
   }
}

#Preview {
   ContentView()
}
