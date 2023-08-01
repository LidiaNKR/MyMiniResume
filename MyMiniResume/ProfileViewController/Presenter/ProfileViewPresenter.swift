//
//  ProfileViewPresenter.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    var profile: Profile? { get set }
    init(view: ProfileViewControllerProtocol, profile: Profile)
    func setData()
    func skillsCount() -> Int
    func showAlert()
}

final class ProfileViewPresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewControllerProtocol?
    var profile: Profile?
    
    required init(view: ProfileViewControllerProtocol, profile: Profile) {
        self.view = view
        self.profile = profile
        setData()
    }
    
    func setData() {
        guard let profile = profile else { return }
        let fullName: String = "\(profile.name) \(profile.secondName) \(profile.surname)"
        let fullExperience: String = "\(profile.positionAtWork), \(profile.experience)"
        let location: String = "📍" + profile.location
        view?.configureProfileViewController(imageName: profile.photo,
                         name: fullName,
                         work: fullExperience,
                         location: location,
                         aboutMe: profile.aboutMe)
    }
    
    func skillsCount() -> Int {
        profile?.skills.count ?? 0
    }
    
    func showAlert() {
        view?.showAlert(with: "Добавление Навыка", and: "Введите название навыка, которым вы владеете")
    }
}
