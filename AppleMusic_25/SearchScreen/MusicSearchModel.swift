import SwiftUI

struct MusicSearchModel: Hashable {
    var imageName: String
    var title: String
    var author: String
    var type: String
}

extension MusicSearchModel {
    static var models: [MusicSearchModel] = [
        MusicSearchModel(imageName: "свободен", title: "Я свободен", author: "Кипелов", type: "Песня"),
        MusicSearchModel(imageName: "психи", title: "Психи попадают в топ", author: "Макс Корж", type: "Альбом"),
        MusicSearchModel(imageName: "герой", title: "Герой асфальта", author: "Ария", type: "Альбом"),
        MusicSearchModel(imageName: "игра", title: "Игра с огнем", author: "Ария", type: "Альбом"),
        MusicSearchModel(imageName: "воля", title: "Воля", author: "Макс Корж", type: "Песня"),
        MusicSearchModel(imageName: "вомне", title: "Во мне", author: "yaskraviy", type: "Песня"),
        MusicSearchModel(imageName: "мияги", title: "YAMAKASI", author: "Miyagi & Andy Panda", type: "Песня")
    ]
}
