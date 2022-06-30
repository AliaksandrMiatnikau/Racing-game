

import UIKit

class HighscoresTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let mainLabel: UILabel
    private let additionalLabel: UILabel
    
    // MARK: - tableView cell setup methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        mainLabel = UILabel()
        additionalLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(result: SavedResult) {
        
        self.mainLabel.text = result.date
        self.additionalLabel.text = "Distance: ".localized() +  String(result.distance) + "m".localized() + "," + " Time: ".localized() +  result.time + "s".localized()
    }
    
    
    private func setupUI() {
        
        mainLabel.backgroundColor = .clear
        mainLabel.font = UIFont(name: "Dosis", size: 20)
        mainLabel.textAlignment = .center
        contentView.addSubview(mainLabel)
        
        additionalLabel.backgroundColor = .clear
        additionalLabel.font = UIFont(name: "Dosis", size: 25)
        additionalLabel.textAlignment = .center
        contentView.addSubview(additionalLabel)
    }
    override func layoutSubviews() {
        mainLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height / 2)
        additionalLabel.frame = CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
    }
}

