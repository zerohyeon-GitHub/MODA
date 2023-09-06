//
//  MainViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    var videos: [Video] = []
    let apiManager = YoutubeAPIManager()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        // API 관리자를 사용하여 인기 동영상 가져오기
        apiManager.fetchPopularVideos { [weak self] videos in
            DispatchQueue.main.async {
                self?.videos = videos
                self?.mainView.collectionView.reloadData()
            }
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshVideos), for: .valueChanged)
        mainView.collectionView.refreshControl = refreshControl
    }
    
    @objc func refreshVideos() {
        apiManager.fetchPopularVideos { [weak self] newVideos in
            DispatchQueue.main.async {
                if newVideos.count > 0 {
                    self?.videos = newVideos
                }
                print("새로고침 완료, 새로운 영상 개수: \(newVideos.count)")
                self?.mainView.collectionView.reloadData()
                self?.mainView.collectionView.refreshControl?.endRefreshing()
            }
        }
    }

}


extension MainViewController: UICollectionViewDelegate {
    
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
        let itemWidth = collectionView.bounds.width / 2 - 4 // 2칸으로 나누고 간격을 뺌
        let itemHeight = itemWidth * 4/3 // 4:3 비율

        return CGSize(width: itemWidth, height: itemHeight)
    }
}
