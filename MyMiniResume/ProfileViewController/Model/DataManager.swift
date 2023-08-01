//
//  DataManager.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let photo = "MyPhoto"
    let name = "Лидия"
    let secondName = "Некрасова"
    let surname = "Михайловна"
    let positionAtWork = "Trainee iOs-developer"
    let experience = "опыт более 1 года"
    let location = "Москва/Бали"
    var skills = ["UIKit", "MVC", "MVP", "StoryBoard, Xib, code", "ООП и S.O.L.I.D."]
    let aboutMe = "Привет! На текущий момент я имею опыт разработки собственных pet-проектов. Есть огромное желание применять свои навыки на реальных проектах. получать новый опыт, решать интересные задачи, расти и развиваться в рамках данной позиции."
    
    private init() {}
}

