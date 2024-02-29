import SwiftUI
import UIKit

struct NewSearchView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: NewSearchViewController())
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
    
class NewSearchViewController: UIViewController {
    private var models = GenreSearchModel.models
    
    // MARK: - Outlets
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.systemGray6
        textField.textColor = UIColor.gray
        textField.layer.cornerRadius = 8
        textField.placeholder = " Поиск"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CellHeader")
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Поиск"
    }
    
    private func setupHierarchy() {
        view.addSubview(textField)
        view.addSubview(collection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            collection.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extensions

extension NewSearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell
            item?.configureCell(item: models[indexPath.item])
            return item ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as? CellHeader else { return UICollectionReusableView() }
        return header
    }
}

extension NewSearchViewController {
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.8)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 8,
                leading: 0,
                bottom: 8,
                trailing: 0)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(100)
            )
            
            let group: NSCollectionLayoutGroup
            
            if #available(iOS 16.0, *) {
                group = NSCollectionLayoutGroup.horizontal ( //горизонтальная группа
                    layoutSize: groupSize,
                    repeatingSubitem: item,
                    count: 2 //2 cтолбца
                )
            } else {
                group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitem: item,
                    count: 2
                )
            }
        
            group.interItemSpacing = .fixed(8)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = .zero
            section.orthogonalScrollingBehavior = .none
            
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 4,
                bottom: 4,
                trailing: 4
            )
            
            let sectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .absolute(self.view.frame.width),
                heightDimension: .estimated(40)
            )
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: sectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading
            )
            
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
        return layout
    }
}

