//
//  ViewController.swift
//  SwiftBookCourse
//
//  Created by Татьяна Дубова on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redTrafficLight: UIView!
    @IBOutlet weak var orangeTrafficLight: UIView!
    @IBOutlet weak var greenTrafficLight: UIView!
    @IBOutlet weak var colorSelectionButton: UIButton!
    
    private var color: Colors = .none
    
    private enum Colors {
        case none
        case red
        case orange
        case green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTrafficLight.backgroundColor = .systemRed
        orangeTrafficLight.backgroundColor = .systemOrange
        greenTrafficLight.backgroundColor = .systemGreen
        
        updateTrafficLight()
        
        colorSelectionButton.layer.cornerRadius = 20
        colorSelectionButton.setTitle("START", for: .normal)
    }
    
    @IBAction func colorSelectionButtonPressed(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        next()
        updateTrafficLight()
    }
    
    private func next() {
        switch color {
        case .red:
            color = .orange
        case .orange:
            color = .green
        case .green, .none:
            color = .red
        }
    }
    
    private func updateTrafficLight() {
        switch color {
        case .red:
            redTrafficLight.alpha = 1
            orangeTrafficLight.alpha = 0.3
            greenTrafficLight.alpha = 0.3
        case .orange:
            orangeTrafficLight.alpha = 1
            redTrafficLight.alpha = 0.3
            greenTrafficLight.alpha = 0.3
        case .green:
            greenTrafficLight.alpha = 1
            redTrafficLight.alpha = 0.3
            orangeTrafficLight.alpha = 0.3
        case .none:
            greenTrafficLight.alpha = 0.3
            redTrafficLight.alpha = 0.3
            orangeTrafficLight.alpha = 0.3
        }
    }
    
    private func updateCornerRadius() {
        let width = redTrafficLight.frame.width
        redTrafficLight.layer.cornerRadius = width / 2
        orangeTrafficLight.layer.cornerRadius = width / 2
        greenTrafficLight.layer.cornerRadius = width / 2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCornerRadius()
    }
}
