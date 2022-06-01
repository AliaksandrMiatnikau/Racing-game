

import UIKit

class StartScreen: UIViewController {
    
    private var onStartButton = UIButton()
    private var onSettingsButton = UIButton()
    private var onHighscoresButton = UIButton()
    private var welcomeText = UILabel()
//    private var userName = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onStartButton.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 140, width: 200, height: 80)
        onStartButton.addGradient()
        onStartButton.rounded(radius: 10)
        onStartButton.clipsToBounds = true
        onStartButton.titleLabel?.font = UIFont(name: "Bicubik", size: 40)
        onStartButton.setTitle("Start", for: .normal)
        onStartButton.setTitleColor(.black, for: .normal)
        
        view.addSubview(onStartButton)
        onStartButton.addTarget(self, action: #selector(startGameVC), for: .touchUpInside)
        
        
        onSettingsButton.frame = CGRect(x: view.bounds.midX - 75, y: view.bounds.midY + 140, width: 150, height: 40)
        onSettingsButton.backgroundColor = .systemGray
        onSettingsButton.rounded(radius: 10)
        onSettingsButton.clipsToBounds = true
        onSettingsButton.titleLabel?.font = UIFont(name: "Dosis", size: 25)
        onSettingsButton.setTitle("Settings", for: .normal)
        onSettingsButton.setTitleColor(.black, for: .normal)
        view.addSubview(onSettingsButton)
        onSettingsButton.addTarget(self, action: #selector(startSettingsVC), for: .touchUpInside)
        
        
        onHighscoresButton.frame = CGRect(x: view.bounds.midX - 75, y: view.bounds.midY + 200, width: 150, height: 40)
        onHighscoresButton.backgroundColor = .systemGray
        onHighscoresButton.rounded(radius: 10)
        onHighscoresButton.clipsToBounds = true
        onHighscoresButton.titleLabel?.font = UIFont(name: "Dosis", size: 25)
        onHighscoresButton.setTitle("Highscores", for: .normal)
        onHighscoresButton.setTitleColor(.black, for: .normal)
        view.addSubview(onHighscoresButton)
      
//        
//        welcomeText.frame = CGRect(x: view.bounds.midX - 75, y: view.bounds.minY + 100, width: 150, height: 40)
//        let vc = ViewController()
//        vc.userName = UserDefaults.standard.string(forKey: "userName")
//        welcomeText.text = "Let's race, \(vc.userName ?? "Player")"
//        welcomeText.textAlignment = .center
////        welcomeText.clipsToBounds = true
      
        view.addSubview(welcomeText)
        
        
    }
    
    @objc private func startGameVC () {
        let vc = ViewController()

        vc.userName = UserDefaults.standard.string(forKey: "userName")
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    @objc private func startSettingsVC () {
        let vc = UIStoryboard(name: "SettingsViewController", bundle: Bundle.main).instantiateInitialViewController() as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
}

