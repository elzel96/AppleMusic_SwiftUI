import SwiftUI

struct Model: Hashable {
    var isPicked: Bool = false
    var icon: String
    var text: String
    var image: Image {
        Image(systemName: icon)
    }
}

extension Model {
    static var models: [Model] = [
        Model(icon: "music.note.list", text: "Плейлисты"),
        Model(icon: "music.mic", text: "Артисты"),
        Model(icon: "rectangle.stack", text: "Альбомы"),
        Model(icon: "music.note", text: "Песни"),
        Model(icon: "tv", text: "Телешоу и фильмы"),
        Model(icon: "music.note.tv", text: "Видеоклипы"),
        Model(icon: "music.quarternote.3", text: "Жанры")
    ]
}
