//
//  ViewController.swift
//  FathersKickMarathonV3
//
//  Created by Геннадий Ведерников on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var blueView: UIView!
    @IBOutlet var slider: UISlider!
    
    let blueViewFrame: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup slider
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        setSliderValue(value)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        blueView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        blueView.layoutMarginsDidChange()
        slider.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        slider.layoutMarginsDidChange()
    }
    
    @IBAction func reverseSlider(_ sender: UISlider) {
        
        let maxValue = sender.maximumValue
        
        sender.setValue(maxValue, animated: true)
        
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.setSliderValue(CGFloat(maxValue))
        }
    }
    
    private func setSliderValue(_ value: CGFloat) {
        
        let layoutFrame = blueView.layoutMargins.left + blueView.layoutMargins.right + 20
        
        let translationX = (UIScreen.main.bounds.width - blueViewFrame - layoutFrame) * value
        let rotation = value * .pi / 2
        let scale = value * 0.5 + 1.0
        
        blueView.transform = CGAffineTransform.identity
            .translatedBy(x: translationX, y: 0)
            .rotated(by: rotation)
            .scaledBy(x: scale, y: scale)
    }
}

