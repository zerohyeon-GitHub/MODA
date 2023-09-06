import UIKit
import YoutubePlayer_in_WKWebView

class DetailViewController: UIViewController {
    let video: Video
    var playerView: WKYTPlayerView!

    init(video: Video) {
        self.video = video
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // WKYTPlayerView 초기화
        playerView = WKYTPlayerView(frame: view.bounds)
        view.addSubview(playerView)

        // 동영상 ID를 설정하고 재생합니다.
        playerView.load(withVideoId: video.id)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
