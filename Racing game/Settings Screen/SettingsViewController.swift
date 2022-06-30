

import UIKit



public class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var vehicleTypeUI: UISegmentedControl!
    @IBOutlet weak var obstructionTypeUI: UISegmentedControl!
    @IBOutlet weak var speedTypeUI: UISegmentedControl!
    
    // MARK: - Properties
    
    private let settingsLabel = UILabel()
    
    // MARK: - Set segment control UserDefaults
    
    @IBAction func vehicleType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:        // sport
            UserDefaults.standard.set(0, forKey: "vehicle")
        case 1:        // police
            UserDefaults.standard.set(1, forKey: "vehicle")
        case 2:        // truck
            UserDefaults.standard.set(2, forKey: "vehicle")
        default:
            break
        }
    }
    
    @IBAction func obstructionType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:        // stone
            UserDefaults.standard.set(0, forKey: "obstruction")
        case 1:        // blockpost
            UserDefaults.standard.set(1, forKey: "obstruction")
        default:
            break
        }
    }
    
    @IBAction func gameSpeed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:        // easy
            UserDefaults.standard.set(0, forKey: "difficulty")
        case 1:        // medium
            UserDefaults.standard.set(1, forKey: "difficulty")
        case 2:        // hard
            UserDefaults.standard.set(2, forKey: "difficulty")
        default:
            break
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setSettingsLabel()
        view.backgroundColor = .systemYellow
        view.rounded(radius: 30)
        vehicleTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "vehicle")
        obstructionTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "obstruction")
        speedTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "difficulty")
    }
    
    // MARK: - Set UI
    
    private func setSettingsLabel() {
        settingsLabel.frame = CGRect(x: view.bounds.midX - 150, y: view.bounds.minY + 10, width: 300, height: 80)
        settingsLabel.clipsToBounds = true
        settingsLabel.font = UIFont(name: "Bicubik", size: 30)
        settingsLabel.text = "Settings".localized()
        settingsLabel.textAlignment = .center
        view.addSubview(settingsLabel)
    }
}

