//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by waheedCodes on 08/07/2021.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlaybackButton(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    // MARK: - STATIC PROPERTIES
    
    static let cellIdentifier = "TeamTableViewCell"
    
    // MARK: - PROPERTIES
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var playbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var foundedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private weak var delegte: TeamTableViewCellDelegate?
    private var team: Team?
}

// MARK: - EXTENSIONS

extension TeamTableViewCell {
    
    // MARK: - TABLEVIEWCELL LIFE CYCLE METHOD
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .tertiarySystemBackground
        containerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegte = nil
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    // MARK: - HELPER METHODS
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate) {
        
        self.team = item
        self.delegte = delegate
        
        containerView.backgroundColor = item.id.background
        
        badgeImageView.image = item.id.badge
        nameLabel.text = item.name
        foundedLabel.text = item.founded
        jobLabel.text = "Current \(item.manager.job.rawValue): \(item.manager.name)"
        infoLabel.text = item.info
        playbackButton.setImage(item.isPlaying ? Assets.pause : Assets.play,
                                for: .normal)
        
        playbackButton.addTarget(self,
                                 action: #selector(didTapPlaybackButton),
                                 for: .touchUpInside)
        
        layoutCell()
        
    }
    
    private func layoutCell() {
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(badgeImageView)
        containerView.addSubview(contentStackView)
        containerView.addSubview(playbackButton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        let spacing: CGFloat = 8
        let doubleSpacing: CGFloat = 20
        let imageWidthAndHeight: CGFloat = 50
        let iconWidthAndHeight: CGFloat = 44
        
        NSLayoutConstraint.activate([
            // Layout the container view
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            
            badgeImageView.heightAnchor.constraint(equalToConstant: imageWidthAndHeight),
            badgeImageView.widthAnchor.constraint(equalToConstant: imageWidthAndHeight),
            badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: spacing),
            
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: doubleSpacing),
            contentStackView.trailingAnchor.constraint(equalTo: playbackButton.leadingAnchor, constant: -spacing),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -doubleSpacing),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: spacing),
            
            playbackButton.heightAnchor.constraint(equalToConstant: iconWidthAndHeight),
            playbackButton.widthAnchor.constraint(equalToConstant: iconWidthAndHeight),
            playbackButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -spacing),
            playbackButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    @objc func didTapPlaybackButton() {
        if let team = team {
            delegte?.didTapPlaybackButton(for: team)
        }
    }
}
