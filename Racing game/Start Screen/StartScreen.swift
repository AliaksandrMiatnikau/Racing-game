

import UIKit

class StartScreen: UIViewController {
    
    // MARK: - Properties
    
    private var onStartButton = UIButton()
    private var onSettingsButton = UIButton()
    private var onHighscoresButton = UIButton()
    private var gameName = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGamenameLabel()
        setStartButton()
        setSettingsButton()
        setHighscoresButton()
        setBackgroundImage()
    }
    
    // MARK: - Set UI methods
    
    private func setGamenameLabel() {
        gameName.frame = CGRect(x: view.bounds.midX - 200, y: view.bounds.midY - 300, width: 400, height: 80)
        gameName.clipsToBounds = true
        gameName.font = UIFont(name: "Bicubik", size: 40)
        gameName.text = "RACING GAME".localized()
        gameName.textAlignment = .center
        view.addSubview(gameName)
    }
    
    private func setStartButton() {
        onStartButton.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.maxY - 290, width: 200, height: 80)
        onStartButton.addGradient()
        onStartButton.rounded(radius: 10)
        onStartButton.clipsToBounds = true
        onStartButton.titleLabel?.font = UIFont(name: "Bicubik", size: 40)
        onStartButton.setTitle("START".localized(), for: .normal)
        onStartButton.setTitleColor(.black, for: .normal)
        view.addSubview(onStartButton)
        onStartButton.addTarget(self, action: #selector(startGameVC), for: .touchUpInside)
    }
    
    private func setSettingsButton() {
        onSettingsButton.frame = CGRect(x: view.bounds.midX - 75, y: view.bounds.maxY - 150, width: 150, height: 40)
        onSettingsButton.backgroundColor = .systemGray
        onSettingsButton.rounded(radius: 10)
        onSettingsButton.clipsToBounds = true
        onSettingsButton.titleLabel?.font = UIFont(name: "Dosis", size: 25)
        onSettingsButton.setTitle("Settings".localized(), for: .normal)
        onSettingsButton.setTitleColor(.black, for: .normal)
        view.addSubview(onSettingsButton)
        onSettingsButton.addTarget(self, action: #selector(startSettingsVC), for: .touchUpInside)
    }
    
    private func setHighscoresButton() {
        onHighscoresButton.frame = CGRect(x: view.bounds.midX - 75, y: view.bounds.maxY - 100, width: 150, height: 40)
        onHighscoresButton.backgroundColor = .systemGray
        onHighscoresButton.rounded(radius: 10)
        onHighscoresButton.clipsToBounds = true
        onHighscoresButton.titleLabel?.font = UIFont(name: "Dosis", size: 25)
        onHighscoresButton.setTitle("Highscores".localized(), for: .normal)
        onHighscoresButton.setTitleColor(.black, for: .normal)
        view.addSubview(onHighscoresButton)
        onHighscoresButton.addTarget(self, action: #selector(startHighscoresVC), for: .touchUpInside)
        
    }
    
    private func setBackgroundImage() {
        let background = UIImage(named: "screen")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
    }
    
    // MARK: - Set Buttons Functions
    
    @objc private func startGameVC () {
        let vc = ViewController()
//        vc.userName = UserDefaults.standard.string(forKey: "userName")
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    @objc private func startSettingsVC () {
        let vc = UIStoryboard(name: "SettingsViewController", bundle: Bundle.main).instantiateInitialViewController() as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func startHighscoresVC () {
        let vc = UIStoryboard(name: "HighscoresViewController", bundle: Bundle.main).instantiateInitialViewController() as! HighscoresViewController
        present(vc, animated: true, completion: nil)
        
    }
    
    
}

