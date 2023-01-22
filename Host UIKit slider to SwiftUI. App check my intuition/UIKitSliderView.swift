//
//  UIKitSliderView.swift
//  Host UIKit slider to SwiftUI. App check my intuition
//
//  Created by Oxyenniu on 22.01.2023.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.value = Float(value)

        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        
       
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor
            .black
            .withAlphaComponent(CGFloat(alpha))

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UIKitSliderView {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double> ) {
            self._value = value
        }
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct DecimalSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSliderView(value: .constant(30), alpha: 1)
    }
}


