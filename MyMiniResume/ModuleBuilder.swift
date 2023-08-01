//
//  ModuleBuilder.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import UIKit

protocol Builder {
    static func createProfileModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createProfileModule() -> UIViewController {
        let dataManager = DataManager.shared
        let profile = Profile(photo: dataManager.photo, name: dataManager.name, secondName: dataManager.secondName, surname: dataManager.surname, positionAtWork: dataManager.positionAtWork, experience: dataManager.experience, location: dataManager.location, skills: dataManager.skills, aboutMe: dataManager.aboutMe)
        let view = ProfileViewController()
        let presenter = ProfileViewPresenter(view: view, profile: profile)
        view.presenter = presenter
        return view
    }
}
