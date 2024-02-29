import UIKit

final class Cell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    // MARK: - Outlets
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(photoImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor)
        ])
    }
    
    func configureCell(item: GenreSearchModel) {
        photoImageView.image = UIImage(named: item.imageName)
    }
}




