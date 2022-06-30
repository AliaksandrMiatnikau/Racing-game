

import UIKit

class HighscoresViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    private var array: [SavedResult] = []
    private let highscoresLabel = UILabel()
    private let onResetButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHighscoresLabel()
        setResetButton()
        setTableView()
        
        view.backgroundColor = .systemYellow
        view.rounded(radius: 30)
        
        guard let newArray = RealmManager.shared.getSomeObject()?.sorted(by: {$0.distance > $1.distance})  else { return }
        self.array = newArray
        
    }
    
    // MARK: - set TableView methods
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HighscoresTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = UIScreen.main.bounds
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setHighscoresLabel() {
        highscoresLabel.frame = CGRect(x: view.bounds.midX - 150, y: view.bounds.minY + 10, width: 300, height: 80)
        highscoresLabel.clipsToBounds = true
        highscoresLabel.font = UIFont(name: "Bicubik", size: 30)
        highscoresLabel.text = "Highscores".localized()
        highscoresLabel.textAlignment = .center
        view.addSubview(highscoresLabel)
    }
    
    private func setResetButton() {
        onResetButton.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.maxY - (view.bounds.maxY / 6), width: 200, height: 40)
        onResetButton.backgroundColor = .systemGray
        onResetButton.rounded(radius: 10)
        onResetButton.clipsToBounds = true
        //        onResetButton.titleLabel?.font = UIFont(name: "Dosis", size: 20)
        onResetButton.setTitle("Reset all".localized(), for: .normal)
        onResetButton.setTitleColor(.black, for: .normal)
        onResetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(onResetButton)
        onResetButton.addTarget(self, action: #selector(resetResults), for: .touchUpInside)
    }
    @objc private func resetResults() {
        RealmManager.shared.deleteAll()
        self.dismiss(animated: true)
        
    }
    
}


extension HighscoresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HighscoresTableViewCell else {  return UITableViewCell() }
        cell.setupCell(result: array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 50
        }
        return 50
    }
    
}



