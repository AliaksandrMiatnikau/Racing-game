

import Foundation
import UIKit

extension UIViewController {
        func showAlert (title: String, text: String) {
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Menu".localized(), style: .default) {_ in
                let vc = StartScreen()
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .flipHorizontal
                self.present(vc, animated: true)
            
        }
            alert.addAction(ok)
            
            let cancelAction = UIAlertAction(title: "Restart".localized(), style: .default) {_ in
                let vc = ViewController()
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            }
                       alert.addAction(cancelAction)
                       
            present(alert, animated: true, completion: nil)
        }
    }
