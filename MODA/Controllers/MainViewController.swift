//
//  MainViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit
import Alamofire
import SwiftyJSON
import YoutubePlayer_in_WKWebView


class MainViewController: UIViewController {
    let mainView = MainView()
    var videos: [Video] = []

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self

        VideoDataManager.shared.fetchYouTubeVideos { [weak self] videos in
            self?.videos = videos
            self?.mainView.collectionView.reloadData()
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.item]
        showVideoDetail(with: selectedVideo)
    }

    func showVideoDetail(with video: Video) {
        let detailViewController = DetailViewController(video: video)
        present(detailViewController, animated: true, completion: nil)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? VideoCell else {
            return UICollectionViewCell()
        }

        // 해당 셀에 데이터 설정
        let video = videos[indexPath.item]
        cell.configure(with: video)

        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / 2 - 4
        let itemHeight = itemWidth * 4/3 

        return CGSize(width: itemWidth, height: itemHeight)
    }
}
