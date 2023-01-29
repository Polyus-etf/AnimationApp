//
//  ViewController.swift
//  AnimationApp
//
//  Created by Сергей Поляков on 27.12.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var springButton: SpringButton!
    @IBOutlet weak var springAnimationView: SpringView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomSettings()
        setSpringAnimationView()
        settingLabel.text = writeLabel()
    }
    
    private var randomView = AnimationSettings()
    
    @IBAction func showAnimationButton(_ sender: SpringButton) {
        setSpringAnimationView()
        settingLabel.text = writeLabel()
        springAnimationView.animate()
        getRandomSettings()
        sender.setTitle("Run \(randomView.animation)", for: .normal)
        
    }
    
    private func getRandomSettings() {
        randomView.animation = getRandomAnimation()
        randomView.curve = getRandomCurve()
        randomView.force = CGFloat.random(in: 0.3...1.4)
        randomView.duration = CGFloat.random(in: 0.8...2.0)
        randomView.delay = CGFloat.random(in: 0.1...0.7)
    }
    
    private func getRandomAnimation() -> String {
        "\(AnimationPreset.allCases.randomElement() ?? .wobble)"
    }
    
    private func getRandomCurve() -> String {
        "\(AnimationCurve.allCases.randomElement() ?? .easeInOutSine)"
    }
    
    private func writeLabel() -> String {
        var label = ""
        label += "preset: \(springAnimationView.animation) \n"
        label += "curve: \(springAnimationView.curve) \n"
        label += String(format: "force: %.2f\n", springAnimationView.force)
        label += String(format: "duration: %.2f\n", springAnimationView.duration)
        label += String(format: "delay: %.2f", springAnimationView.delay)
        return label
    }
    
    private func setSpringAnimationView() {
        springAnimationView.animation = randomView.animation
        springAnimationView.curve = randomView.curve
        springAnimationView.force = randomView.force
        springAnimationView.duration = randomView.duration
        springAnimationView.delay = randomView.delay
    }
}

class AnimationSettings {
    var animation = "wobble"
    var curve = "easeInOutSine"
    var force: CGFloat = 1
    var duration: CGFloat = 1
    var delay:CGFloat = 0.2
}
