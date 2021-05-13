//
//  PlayerViewController.swift
//  Spotify
//
//  Created by 강민성 on 2021/03/11.
//

import UIKit
import SDWebImage

protocol PlayerViewControllerDelegate: AnyObject {
    func didTapPlayPause()
    func didTapNext()
    func didTapBack()
    func didSlideSlider(_ value: Float)
}

class PlayerViewController: UIViewController {
    
    weak var dataSource: PlayerDataSource?
    weak var delegate: PlayerViewControllerDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let controlsView = PlayerControlsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        controlsView.delegate = self
        configureBarButtons()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.width
        )
        controlsView.frame = CGRect(
            x: 10,
            y: imageView.bottom + 10,
            width: view.width - 20,
            height: view.height - imageView.height
                - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 15
        )
    }
    
    private func configure() {
        imageView.sd_setImage(with: dataSource?.imageURL, completed: nil)
        controlsView.configure(with: PlayerControlsViewViewModel(
            title: dataSource?.songName,
            subtitle: dataSource?.subtitle
        )
        )
    }
    
    private func configureBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self, action: #selector(didTapAction))
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapAction() {
        // Actions
    }
    
    func refreshUI() {
        configure()
    }
    
}

extension PlayerViewController: PlayerControlsViewDelegate {
    
    func playerControlsViewDidTapPlayPauseButton(_ playerCotrolsView: PlayerControlsView) {
        delegate?.didTapPlayPause()
    }
    
    func playerControlsViewDidTapNextButton(_ playerCotrolsView: PlayerControlsView) {
        delegate?.didTapNext()
    }
    
    func playerControlsViewDidTapBackButton(_ playerCotrolsView: PlayerControlsView) {
        delegate?.didTapBack()
    }
    
    func playerControlsView(_ playerCotrolsView: PlayerControlsView, didSlideSlider value: Float) {
        delegate?.didSlideSlider(value)
    }
    
    
}
