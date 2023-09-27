//
//  LoadingVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 27.09.2023.
//

import UIKit

class LoadingVC: UIViewController {

    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var endTime: Date?
    var timer = Timer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    var timeLeft: TimeInterval = 2.5

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBgShape()
        drawTimeLeftShape()
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = timeLeft
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        endTime = Date().addingTimeInterval(2.5)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    private func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX-5,
                                                                  y: view.frame.midY-230),
                                               radius:135, startAngle: -90.degreesToRadians,
                                               endAngle: 270.degreesToRadians,
                                               clockwise: true).cgPath
 timeLeftShapeLayer.strokeColor = UIColor(red: 85.0 / 255.0, green: 141.0 / 255.0,
                                          blue: 227.0 / 255.0, alpha: 1).cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 20
        view.layer.addSublayer(timeLeftShapeLayer)
     }
    
    private func drawBgShape() {
        
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX-5,
                                                            y: view.frame.midY-230),
                                         radius:135, startAngle: -90.degreesToRadians,
                                         endAngle: 270.degreesToRadians,
                                         clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor(red: 205.0 / 255.0, green: 225.0 / 255.0,
                                           blue: 254.0 / 255.0, alpha: 1).cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 20
        view.layer.addSublayer(bgShapeLayer)
    }
    
    @objc private func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
        } else {
            timer.invalidate()
            navigationController?.pushViewController(DailyWaterVC.create(), animated: true)
        }
    }

}

extension LoadingVC {
    static func create() -> LoadingVC {
        let vc = LoadingVC(nibName: "LoadingVC", bundle: nil)
        return vc
    }
}

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
