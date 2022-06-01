

import UIKit


public class SettingsViewController: UIViewController {
    
    @IBOutlet weak var vehicleTypeUI: UISegmentedControl!
    @IBOutlet weak var obstructionTypeUI: UISegmentedControl!
    @IBOutlet weak var speedTypeUI: UISegmentedControl!
    @IBOutlet weak var userNameTextField: UITextField!
   
    
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
    
    private var user: Results!
    let onSaveButton = UIButton()
    
    @IBAction func onSaveButton(_ sender: Any) {
        
        let vc = ViewController()
        vc.userName = userNameTextField.text!
        UserDefaults.standard.set(vc.userName, forKey: "userName")
        self.dismiss(animated: true)
//        print(userNameTextField.text)
//        userNameTextField.resignFirstResponder()
        
//        guard   let userName = userNameTextField.text
////            let userDistance = vc.userDistance,
////            let userTime = vc.userTime,
////            let date = vc.userDate
//
//        else { return }

//        user = Results(name: userName, time: userTime, distance: userDistance, date: date)
//        UserDefaults.standard.set(user, forKey: "ResultKey")
    }
   
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        
         view.backgroundColor = .systemGray
        
        vehicleTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "vehicle")
        obstructionTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "obstruction")
        speedTypeUI.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "difficulty")
        
    }
   

    
}

