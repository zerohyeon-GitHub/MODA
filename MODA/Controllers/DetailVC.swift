import UIKit
import YoutubePlayer_in_WKWebView

class DetailViewController: UIViewController, WKYTPlayerViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let videoPlayerView = WKYTPlayerView()
    let titleLabel = UILabel()
    let viewCountLabel = UILabel()
    let thumbnailImageView = UIImageView()
    var likeButton = UIButton()

    var commentsTableView = UITableView()
    var comments: [Comment] = []

    var selectedVideo: [Video] = []
    var video: Video?

    let commentInputView = UIView()
    let commentTextField = UITextField()
    let commentSubmitButton = UIButton()

    var modalCommentView = UIView()
    var modalCommentTextField = UITextField()
    var modalSubmitButton = UIButton()
    var modalCommentsTableView = UITableView()
    var modalComments: [Comment] = []

    var keyboardHeight: CGFloat = 0
    let relatedVideosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    var relatedVideos: [Video] = [] // 연관 영상 데이터

    var isModalVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        relatedVideosCollectionView.register(RelatedVideoCell.self, forCellWithReuseIdentifier: "RelatedVideoCell")

        // 좋아요 버튼 설정
        if let thumbUpImage = UIImage(systemName: "hand.thumbsup.fill") {
            likeButton = UIButton(type: .custom)
            likeButton.setImage(thumbUpImage, for: .normal)
            likeButton.tintColor = .gray
            likeButton.frame = CGRect(x: 0, y: 300, width: 40, height: 40)
            likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        }

        // 비디오 플레이어 뷰 설정
        videoPlayerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        videoPlayerView.delegate = self
        view.addSubview(videoPlayerView)

        // 비디오 제목 레이블 설정
        titleLabel.frame = CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 30)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)

        // 조회수 레이블 설정
        viewCountLabel.frame = CGRect(x: 20, y: 260, width: view.frame.width - 40, height: 20)
        viewCountLabel.textColor = .gray
        view.addSubview(viewCountLabel)
        view.addSubview(likeButton)

        // 댓글 테이블 뷰 설정
        commentsTableView.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 200)
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        commentsTableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        view.addSubview(commentsTableView)

        // 댓글 입력 뷰 설정
        commentInputView.backgroundColor = .lightGray
        commentInputView.frame = CGRect(x: 0, y: 600, width: view.frame.width, height: 50)
        view.addSubview(commentInputView)

        // 댓글 입력 텍스트 필드 설정
        commentTextField.becomeFirstResponder()
        commentTextField.placeholder = "댓글 작성"
        commentTextField.frame = CGRect(x: 10, y: 10, width: commentInputView.frame.width - 80, height: 30)
        commentInputView.addSubview(commentTextField)

        // 댓글 추가 버튼 설정
        commentSubmitButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        commentSubmitButton.tintColor = .blue
        commentSubmitButton.frame = CGRect(x: commentTextField.frame.maxX + 10, y: 10, width: 30, height: 30)
        commentInputView.addSubview(commentSubmitButton)
        commentSubmitButton.addTarget(self, action: #selector(commentSubmitButtonTapped), for: .touchUpInside)

        // 모달 댓글 뷰 설정
        modalCommentView.backgroundColor = .white
        modalCommentView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height - videoPlayerView.frame.maxY)
        view.addSubview(modalCommentView)

        // 모달 댓글 입력 텍스트 필드 설정
        modalCommentTextField.becomeFirstResponder()
        modalCommentTextField.placeholder = "댓글 작성"
        modalCommentTextField.frame = CGRect(x: 20, y: 20, width: modalCommentView.frame.width - 80, height: 30)
        modalCommentView.addSubview(modalCommentTextField)

        // 모달 댓글 작성 버튼 설정
        modalSubmitButton.setTitle("작성", for: .normal)
        modalSubmitButton.frame = CGRect(x: modalCommentTextField.frame.maxX + 10, y: 20, width: 60, height: 30)
        modalSubmitButton.addTarget(self, action: #selector(modalSubmitButtonTapped), for: .touchUpInside)
        modalCommentView.addSubview(modalSubmitButton)

        // 모달 댓글 테이블 뷰 설정
        modalCommentsTableView.frame = CGRect(x: 0, y: 70, width: modalCommentView.frame.width, height: modalCommentView.frame.height - 70)
        modalCommentsTableView.delegate = self
        modalCommentsTableView.dataSource = self
        modalCommentsTableView.register(CommentCell.self, forCellReuseIdentifier: "ModalCommentCell")
        modalCommentView.addSubview(modalCommentsTableView)

        // 연관 영상 컬렉션 뷰 설정
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        relatedVideosCollectionView.setCollectionViewLayout(layout, animated: false)
        relatedVideosCollectionView.frame = CGRect(x: 0, y: commentsTableView.frame.maxY, width: view.frame.width, height: 150)
        relatedVideosCollectionView.delegate = self
        relatedVideosCollectionView.dataSource = self
        relatedVideosCollectionView.register(RelatedVideoCell.self, forCellWithReuseIdentifier: "RelatedVideoCell")
        view.addSubview(relatedVideosCollectionView)

        // 비디오 정보 표시
        if let video = video {
            titleLabel.text = video.title
            if let viewCount = video.viewCount {
                viewCountLabel.text = "조회수: \(viewCount)"
            } else {
                viewCountLabel.text = "조회수 정보 없음"
            }
            videoPlayerView.load(withVideoId: video.id)
        }
    }

    // 댓글 작성 버튼 처리
    @objc func commentSubmitButtonTapped() {
        showCommentModal()
    }

    // 모달 댓글 작성 버튼 처리
    @objc func modalSubmitButtonTapped() {
        if let commentText = modalCommentTextField.text, !commentText.isEmpty {
            let newComment = Comment(text: commentText, author: "", date: Date())
            comments.append(newComment)
            commentsTableView.reloadData()
            modalCommentTextField.text = ""
            hideCommentModal()
        }
    }

    // 댓글 테이블 뷰 델리게이트 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == commentsTableView {
            return comments.count
        } else {
            // 모달 댓글 창의 테이블 뷰
            return modalComments.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == commentsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            let comment = comments[indexPath.row]

            cell.commentTextLabel.text = comment.text
            cell.authorAndDateLabel.text = "닉네임: \(comment.author)"

            if comment.isExpanded {
                cell.commentTextLabel.numberOfLines = 0
            } else {
                cell.commentTextLabel.numberOfLines = 2
            }

            return cell
        } else {
            // 모달 댓글 창의 테이블 뷰 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModalCommentCell", for: indexPath) as! CommentCell
            let comment = modalComments[indexPath.row]

            cell.commentTextLabel.text = comment.text
            cell.authorAndDateLabel.text = "닉네임: \(comment.author)"

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == commentsTableView {
            return UITableView.automaticDimension
        } else {
            // 모달 댓글 창의 테이블 뷰 셀 높이 설정
            return 50
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == commentsTableView {
            let comment = comments[indexPath.row]
            modalCommentTextField.text = comment.text
            showCommentModal()
        }
    }

    // 모달 댓글 창 표시/숨기기 메서드
    func showCommentModal() {
        UIView.animate(withDuration: 0.3) {
            self.modalCommentView.frame.origin.y = 0
        }
        isModalVisible = true
    }

    func hideCommentModal() {
        UIView.animate(withDuration: 0.3) {
            self.modalCommentView.frame.origin.y = self.view.frame.height
        }
        isModalVisible = false
    }

    // 좋아요 버튼 처리
    @objc func likeButtonTapped() {
        likeButton.isSelected.toggle()

        if likeButton.isSelected {
            likeButton.tintColor = .blue
        } else {
            likeButton.tintColor = .gray
        }

        if let video = video {
            print("좋아요~: \(video.title)")

            selectedVideo = [video]

            let myPageViewController = MyPageViewController()
            myPageViewController.videos = selectedVideo
            myPageViewController.selectedThumbnailImage = thumbnailImageView.image
            navigationController?.pushViewController(myPageViewController, animated: true)
        } else {
            print("nilnilnil!!!")
        }
    }

}

// 'DetailViewController' 클래스의 확장
extension DetailViewController {

    // UICollectionView 데이터 소스 및 델리게이트 메서드 구현
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 연관 영상 컬렉션 뷰 데이터 소스 구현 (relatedVideos에 기반)
        return relatedVideos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedVideoCell", for: indexPath) as! RelatedVideoCell

        // 연관 영상 컬렉션 뷰 셀 설정
        let video = relatedVideos[indexPath.item]
        cell.titleLabel.text = video.title
        // 썸네일 이미지 설정

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 연관 영상 컬렉션 뷰 셀 크기 설정
        return CGSize(width: 120, height: 150)
    }

}
