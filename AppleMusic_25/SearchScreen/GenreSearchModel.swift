import SwiftUI

struct GenreSearchModel: Hashable {
    var imageName: String
    var category: String
}

extension GenreSearchModel {
    static var models: [GenreSearchModel] = [
        GenreSearchModel(imageName: "01", category: "Tанцевальная"),
        GenreSearchModel(imageName: "02", category: "K-pop"),
        GenreSearchModel(imageName: "03", category: "Альтернативная"),
        GenreSearchModel(imageName: "04", category: "Электроника"),
        GenreSearchModel(imageName: "05", category: "Инди"),
        GenreSearchModel(imageName: "06", category: "Хип-хоп на русском"),
        GenreSearchModel(imageName: "07", category: "Хип-хоп"),
        GenreSearchModel(imageName: "08", category: "Поп на русском")
    ]
}
