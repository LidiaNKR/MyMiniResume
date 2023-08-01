//
//  ProfileViewController.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {
    func configureProfileViewController(imageName: String, name: String, work: String, location: String, aboutMe: String)
    func showAlert(with title: String, and message: String)
}

final class ProfileViewController: UIViewController{
    
    // MARK: - Public properties
    var presenter: ProfileViewPresenterProtocol!
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    
    //MARK: - Private properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemGray6
        return contentView
    }()
    
    private lazy var secondContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "MyPhoto")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var workExperienceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.textColor = .gray
        return label
    }()
    
    private lazy var skillsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pencil"), for: .normal)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private lazy var aboutMeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var aboutMeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setScrollViewConstraint()
        setFirstContentViewConstraint()
        setSecondContentViewConstraint()
        view.backgroundColor = .systemGray6
    }
    
    // MARK: - Private methods
    private func setScrollViewConstraint() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setFirstContentViewConstraint() {
        
        scrollView.addSubview(contentView)
        
        contentView.anchor(top: scrollView.topAnchor, left: view.leftAnchor,
                           right: view.rightAnchor, height: 300)
        
        contentView.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: scrollView.topAnchor, paddingTop: 24,
                                width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        contentView.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 16, width: 250)
        
        contentView.addSubview(workExperienceLabel)
        workExperienceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        workExperienceLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 4)
        
        contentView.addSubview(locationLabel)
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationLabel.anchor(top: workExperienceLabel.bottomAnchor, paddingTop: 0)
    }
    
    private func setSecondContentViewConstraint() {
        scrollView.addSubview(secondContentView)
        secondContentView.anchor(top: contentView.bottomAnchor,
                                 left: scrollView.leftAnchor,
                                 bottom: view.bottomAnchor,
                                 right: scrollView.rightAnchor
        )
        secondContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        secondContentView.addSubview(skillsTitleLabel)
        skillsTitleLabel.anchor(top: secondContentView.topAnchor, left: secondContentView.leftAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        secondContentView.addSubview(editButton)
        editButton.anchor(top: secondContentView.topAnchor, right: secondContentView.rightAnchor, paddingTop: 20, paddingRight: 16)
        
        secondContentView.addSubview(collectionView)
        collectionView.anchor(top: skillsTitleLabel.bottomAnchor,
                              left: secondContentView.leftAnchor,
                              right: secondContentView.rightAnchor,
                              paddingTop: 24,
                              paddingBottom: 24,
                              height: 200
        )
        //        collectionView.heightAnchor.constraint(equalToConstant: collectionView.contentSize.height).isActive = true
        
        secondContentView.addSubview(aboutMeTitleLabel)
        aboutMeTitleLabel.anchor(top: collectionView.bottomAnchor, left: secondContentView.leftAnchor, right: secondContentView.rightAnchor, paddingTop: 24, paddingLeft: 16, paddingRight: 16)
        
        secondContentView.addSubview(aboutMeLabel)
        aboutMeLabel.anchor(top: aboutMeTitleLabel.bottomAnchor, left: aboutMeTitleLabel.leftAnchor, bottom: scrollView.bottomAnchor, right: aboutMeTitleLabel.rightAnchor, paddingTop: 8, paddingBottom: 24)
    }
}

// MARK: - Extensions
extension ProfileViewController: ProfileViewControllerProtocol {
    func configureProfileViewController(imageName: String, name: String, work: String, location: String, aboutMe: String) {
        profileImageView.image = UIImage(named: imageName)
        nameLabel.text = name
        workExperienceLabel.text = work
        locationLabel.text = location
        aboutMeLabel.text = aboutMe
    }
    
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let skill = alert.textFields?.first?.text, !skill.isEmpty else { return }
            self.presenter.profile?.skills.append(skill)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addTextField()
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.skillsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as? CollectionViewCell else { return UICollectionViewCell() }
        
        let currentSkill = presenter.profile?.skills[indexPath.row]
        cell.configure(skill: currentSkill)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
