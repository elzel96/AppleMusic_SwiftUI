import UIKit

class CellHeader: UICollectionReusableView {
    
    static let identifier = "CellHeader"

     // MARK: - Outlets

     private let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         label.textAlignment = .left
         label.text = "Поиск по категориям"
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     // MARK: - Initializers

     override init(frame: CGRect) {
         super.init(frame: frame)
         isUserInteractionEnabled = true
         setupHierarchy()
         setupLayout()
     }

     required init?(coder: NSCoder) {
         fatalError("Error in Cell")
     }

     // MARK: - Setups

     private func setupHierarchy() {
         addSubview(titleLabel)
     }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
 }

