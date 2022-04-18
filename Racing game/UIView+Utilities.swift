

import Foundation
import UIKit

extension UIView {
    func rounded(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
        gradient.opacity = 0.6   // прозрачность
        gradient.startPoint = CGPoint(x:0.0, y: 0.0)
        gradient.endPoint = CGPoint(x:1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func dropShadow() {
        layer.masksToBounds = false // вью не будет обрезан. Тень распространяется за пределы контейнера
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5 // просвечиваемость
        layer.shadowOffset = CGSize(width: 10, height: 10) // сдвиг тени по осям
        layer.shadowRadius = 10 //насколько тень будет выходить за границы view
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true // размытие тени
    }
}

