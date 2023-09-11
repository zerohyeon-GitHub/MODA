//
//  SearchViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/08.
//

import UIKit

class SearchViewController: UIViewController {
    var query: String?
    var videos: [Video] = []
    let apiManager = YoutubeAPIManager()
    var isLoadingMoreVideos: Bool = false
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")
        return collectionView
    }()
    
    let searchQueryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(searchQueryLabel)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchQueryLabel.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            searchQueryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchQueryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchQueryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        if let query = query {
            searchQueryLabel.text = "검색어: \(query)"
            apiManager.searchVideos(query: query) { [weak self] videos in
                DispatchQueue.main.async {
                    self?.videos = videos
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if !isLoadingMoreVideos && offsetY > contentHeight - scrollView.frame.height * 1.5 {
            isLoadingMoreVideos = true
            loadMoreVideos()
        }
    }

    func loadMoreVideos() {
        if let query = query {
            apiManager.fetchMoreSearchVideos(query: query) { [weak self] newVideos in
                DispatchQueue.main.async {
                    let existingVideoIDs = Set(self?.videos.map { $0.id } ?? [])
                    let uniqueNewVideos = newVideos.filter { !existingVideoIDs.contains($0.id) }
                    self?.videos.append(contentsOf: uniqueNewVideos)
                    self?.collectionView.reloadData()
                    self?.isLoadingMoreVideos = false
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.item]
        
        let detailVC = DetailViewController()
        detailVC.video = selectedVideo
        
        present(detailVC, animated: true, completion: nil)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / 2 - 4
        let itemHeight = itemWidth
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? VideoCell else {
            return UICollectionViewCell()
        }
        
        let video = videos[indexPath.item]
        cell.configure(with: video)
        
        return cell
    }
}
