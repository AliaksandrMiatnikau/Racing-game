

import UIKit

class StartScreen: UIViewController {
    
    private var onStartButton = UIButton()
    private var userName = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onStartButton.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 40, width: 200, height: 80)
        onStartButton.addGradient()
        onStartButton.rounded(radius: 10)
        onStartButton.clipsToBounds = true
        onStartButton.titleLabel?.font = UIFont(name: "Bicubik", size: 38)
        onStartButton.setTitle("Start", for: .normal)
        onStartButton.setTitleColor(.black, for: .normal)
        view.addSubview(onStartButton)
        
        onStartButton.addTarget(self, action: #selector(startGameVC), for: .touchUpInside)
    }
    
    @objc private func startGameVC () {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
}

