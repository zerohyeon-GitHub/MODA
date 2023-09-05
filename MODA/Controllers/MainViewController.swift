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
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 비디오 데이터 추가 (임의의 데이터 예시)
        let video1 = Video(id: 1, thumbnailImageName: "sticky-notes", title: "Video 1")
        let video2 = Video(id: 2, thumbnailImageName: "sticky-notes", title: "Video 2")
        let video3 = Video(id: 3, thumbnailImageName: "sticky-notes", title: "Video 3")
        let video4 = Video(id: 4, thumbnailImageName: "sticky-notes", title: "Video 4")
        let video5 = Video(id: 5, thumbnailImageName: "sticky-notes", title: "Video 5")
        let video6 = Video(id: 6, thumbnailImageName: "sticky-notes", title: "Video 6")
        let video7 = Video(id: 7, thumbnailImageName: "sticky-notes", title: "Video 7")
        let video8 = Video(id: 8, thumbnailImageName: "sticky-notes", title: "Video 8")
        let video9 = Video(id: 9, thumbnailImageName: "sticky-notes", title: "Video 9")
        
        videos = [video1, video2, video3, video4, video5, video6, video7, video8, video9]
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.reloadData()
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
        let itemWidth = collectionView.bounds.width / 2 - 2 // 2칸으로 나누고 간격을 뺌
        let itemHeight = itemWidth * 4/3 // 4:3 비율
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4 // 세로 간격 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4 // 가로 간격 설정
    }
}
