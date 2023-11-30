import UIKit

final class MainContentView: UIView {
    
    private let openGiphyButton = UIButton()
    
    private var openGiphyButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConfiguration()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(openGiphyButton)
    }
    
    // MARK: - OpenActions
    func setOpenGiphyButtonAction(_ action: (() -> Void)?) {
        openGiphyButtonAction = action
    }
}

// MARK: - ConfigurationUI
private extension MainContentView {
    func setupConfiguration() {
        configurationOpenGiphyButton()
    }
    
    func configurationOpenGiphyButton() {
        openGiphyButton.setTitle("Open Giphy", for: .normal)
        openGiphyButton.backgroundColor = .blue
        openGiphyButton.setTitleColor(.white, for: .normal)
        openGiphyButton.layer.cornerRadius = 10
        openGiphyButton.addTarget(self, action: #selector(actionGiphyButton), for: .touchUpInside)
    }
    
    @objc func actionGiphyButton() {
        openGiphyButtonAction?()
    }
}

// MARK: - UpdateConstraints
private extension MainContentView {
    func setupConstraints() {
        updateOpenGiphyButtonConstraints()
    }
    
    func updateOpenGiphyButtonConstraints() {
        openGiphyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openGiphyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openGiphyButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            openGiphyButton.heightAnchor.constraint(equalToConstant: 50),
            openGiphyButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
