import UIKit
import GiphyUISDK

final class MainViewController: UIViewController {
    
    private let contentView = MainContentView()
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationGiphySDK()
        addActionOpenGiphy()
    }
    
    private func addActionOpenGiphy() {
        contentView.setOpenGiphyButtonAction { [weak self] in
            guard let self = self else { return }
            let giphy = GiphyViewController()
            giphy.mediaTypeConfig = [.gifs, .stickers, .text, .emoji, .clips, .recents,]
            giphy.theme = GPHTheme(type: .lightBlur)
            present(giphy, animated: true)
        }
    }
    
    private func configurationGiphySDK() {
        let giphyApiKey = "GN1buDQ0ijp3ASbMuVKX2MrD7fFW2sue"
        Giphy.configure(apiKey: giphyApiKey)
    }
}
