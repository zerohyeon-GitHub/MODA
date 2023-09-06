import AVKit

class DetailViewController: UIViewController {
    let video: Video
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    init(video: Video) {
        self.video = video
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AVPlayer를 초기화하고 비디오 URL을 설정합니다.
        guard let videoURL = URL(string: "YOUR_VIDEO_URL_HERE") else {
            // 올바른 비디오 URL로 교체해야 합니다.
            return
        }
        player = AVPlayer(url: videoURL)
        
        // AVPlayerLayer를 생성하고 뷰에 추가합니다.
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        view.layer.addSublayer(playerLayer!)
        
        // 비디오를 재생합니다.
        player?.play()
    }
    
    // 나머지 코드 작성
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
