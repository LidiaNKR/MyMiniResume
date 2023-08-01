//
//  CollectionViewCell.swift
//  MyMiniResume
//
//  Created by Лидия Ладанюк on 01.08.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    var presenter: ProfileViewPresenterProtocol!
    static let identifier = "CollectionViewCell"
    
    //MARK: - Private properties
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.text = "Скилы"
        return label
    }()
    
    private lazy var skillButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(addNewSkill), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSkillLabelConstraint()
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func configure(skill: String?) {
        skillLabel.text = skill
    }
    
    // MARK: - Private methods
    private func setSkillLabelConstraint() {
        contentView.addSubview(skillLabel)
        
        skillLabel.anchor(top: contentView.topAnchor,
                          left: contentView.leftAnchor,
                          bottom: contentView.bottomAnchor,
                          paddingTop: 12,
                          paddingLeft: 24,
                          paddingBottom: 12)
        
        contentView.addSubview(skillButton)
        skillButton.anchor(top: skillLabel.topAnchor,
                           left: skillLabel.rightAnchor,
                           bottom: skillLabel.bottomAnchor,
                           right: contentView.rightAnchor,
                           paddingLeft: 10,
                           paddingRight: 24,
                           width: 14,
                           height: 14)
    }

    @objc private func addNewSkill() {
        guard let presenter = presenter else { return }
        presenter.showAlert()
    }
}
