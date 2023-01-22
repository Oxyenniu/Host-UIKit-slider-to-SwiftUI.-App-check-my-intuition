//
//  ContentView.swift
//  Host UIKit slider to SwiftUI. App check my intuition
//
//  Created by Oxyenniu on 22.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    @State private var showingAlert = false
    @State private var alpha = 0.1
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Move the slider as close as possible to: \(targetValue)")
                .font(.body)
            HStack {
                Text("0")
                UIKitSliderView(value: $currentValue, alpha: alpha)
                    .onChange(of: currentValue) { _ in
                        alpha = Double(computeScore()) / 100
                    }
                Text("100")
            }
            Button("Check result") {
                showingAlert.toggle()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your score is "),
                      message: Text(computeScore().formatted()),
                      dismissButton: .default(Text("OK")))
            }
            .buttonAppearance(.green)
            .foregroundColor(.black)
            Button(action: {
                self.targetValue = Int.random(in: 0..<100)
            }) {
                Text("New value")
            }
            .buttonAppearance(.yellow)
            .foregroundColor(.black)
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
