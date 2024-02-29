import SwiftUI

struct RadioModel: Hashable {
    var imageName: String
    var category: String?
    var title: String
    var subTitle: String?
}

extension RadioModel {
    static var models: [String: [RadioModel]] = [
        "mainStations": [
            RadioModel(imageName: "1", category: "Новый выпуск",  title: "Музыкальный базар с Бастой", subTitle: "Новое шоу"),
            RadioModel(imageName: "2", category: "ЭКСКЛЮЗИВ", title: "Коллекция радиошоу Beats 1"),
            RadioModel(imageName: "3", category: "Избранная радиостанция", title: "ХИП-ХОП", subTitle: "Идеальные биты и рифмы."),
            RadioModel(imageName: "4", category: "Избранная радиостанция", title: "Только поп-музыка", subTitle: "Все топ-хиты"),
            RadioModel(imageName: "5", category: "Избранная радиостанция", title: "Классика рока", subTitle: "Гении гитарного звука."),
            RadioModel(imageName: "6", category: "Избранная радиостанция", title: "Танцевальная музыка", subTitle: "Современные и будущие хиты.")
        ],
        "stations": [
            RadioModel(imageName: "7", title: "Популярное", subTitle: "То, что слушают прямо сейчас."),
            RadioModel(imageName: "3", title: "ХИП-ХОП", subTitle: "Идеальные биты и рифмы."),
            RadioModel(imageName: "4", title: "Только поп-музыка", subTitle: "Все топ-хиты"),
            RadioModel(imageName: "5", title: "Классика рока", subTitle: "Гении гитарного звука."),
            RadioModel(imageName: "6", title: "Танцевальная музыка", subTitle: "Современные и будущие хиты.")
        ]
    ]
}
