//
//  MusicViewController.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-28.
//

import UIKit
import MediaPlayer

class MusicViewController: UIViewController {
    
    let padCnst = CGFloat(5)
    
    let musicImageView = UIImageView()
    let stackView = UIStackView()
    let stackButtons = [UIButton]()
    let slider = UISlider()
    let musicTitleLabel = PaddingLabel(withInsets: 0, 0, 5, 5)
    
    let playPauseButton = UIButton()
    let nxtButton = UIButton()
    let prevButton = UIButton()
    let playlistsButton = UIButton()
    let showButton = UIButton()
    
    
     
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        changeMusicImage(imageURL: "JinxTestImage.jpeg")
        
        let mediaItems = MPMediaQuery.playlists().collections
        
        for item in mediaItems! {
            print(item.value(forProperty: MPMediaPlaylistPropertyName))
        }
    }
    
    // MARK: Action
    func changeMusicImage(imageURL :String) {
        musicImageView.image = UIImage(named: imageURL)
    }
    
    @objc func showPlaylists() {
        present(UINavigationController(rootViewController: PlaylistViewController()), animated: true, completion: nil)
    }
    
    
    // MARK: Setup
    func setupUI() {
        setupMusicImageView()
        setupButtonsAndStackView()
        setupSlider()
        setupMusicTitleLabel()
    }
    
    func setupMusicTitleLabel() {
        view.addSubview(musicTitleLabel)
                
        musicTitleLabel.setEdgeConstraints(bottom: slider.topAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0))
        musicTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        musicTitleLabel.backgroundColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)

        musicTitleLabel.text = "Welcome to the Playground"
        musicTitleLabel.layer.masksToBounds = true
        musicTitleLabel.layer.cornerRadius = 10
        musicTitleLabel.textColor = .white
        musicTitleLabel.font = .systemFont(ofSize: 20)
    }
    
    func setupSlider() {
        
        view.addSubview(slider)
   
        slider.setEdgeConstraints(bottom: stackView.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: padCnst, bottom: padCnst*2, right: padCnst))
        slider.heightAnchor.constraint(equalToConstant: padCnst).isActive = true
        slider.thumbTintColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
        
        slider.value = 0
        slider.tintColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
        
    }
    
    func setupButtonsAndStackView() {
        view.addSubview(stackView)

        let stackButtons = [showButton, prevButton, playPauseButton, nxtButton, playlistsButton]
        let buttonImages = ["square.stack.3d.up.fill", "backward.fill", "play.fill", "forward.fill", "music.note.list"]
        let buttonWidth = (UIScreen.main.bounds.size.width - 6*padCnst) / 5
        let buttonHeight = buttonWidth
        let stackHeight = buttonHeight + 2*padCnst
        
        stackView.spacing = padCnst       //Spacing b/w elements
        
        for (n, stackButton) in stackButtons.enumerated() {
            stackButton.layer.cornerRadius = buttonHeight/2
            stackButton.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.1)
            stackButton.tintColor = .white
            stackButton.setImage(UIImage(systemName: buttonImages[n]), for: .normal)
            stackButton.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 0.1)
            stackButton.layer.borderWidth = 5
            stackView.addArrangedSubview(stackButton)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        //StackView Constraints
        stackView.setEdgeConstraints(bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        stackView.heightAnchor.constraint(equalToConstant: stackHeight).isActive = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padCnst, leading: padCnst, bottom: padCnst, trailing: padCnst)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        playlistsButton.addTarget(self, action: #selector(showPlaylists), for: .touchUpInside)
        
    }
    
    func setupMusicImageView() {
        view.addSubview(musicImageView)
        musicImageView.setEdgeConstraints(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        musicImageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    
    
    
}
