# FXViewKit
 
### CocoaPods

For FXViewKit, use the following entry in your Podfile:

```rb
pod 'FXViewKit', '~> 0.1.5'
```

Then run `pod install`.


### Carthage

Make the following entry in your Cartfile:

```
github "feixue299/FXViewKit" ~>0.1.5
```

Then run `carthage update`.

### Example
```swift
import FXViewKit

class ViewController: UIViewController {

    let lrView = LeftRightView<UILabel, UIButton>()
    let tbView = TopBottomView<UILabel, UIButton>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lrView.backgroundColor = .systemPink
        lrView.leftView.text = "left"
        lrView.leftView.backgroundColor = .systemBlue
        lrView.rightView.addTarget(self, action: #selector(lrViewTap), for: .touchUpInside)
        lrView.rightView.backgroundColor = .green
        lrView.rightView.setTitle("right", for: .normal)
        
        lrView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lrView)
        NSLayoutConstraint.activate([
            lrView.leftAnchor.constraint(equalTo: view.leftAnchor),
            lrView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lrView.heightAnchor.constraint(equalToConstant: 44),
            lrView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        tbView.backgroundColor = .systemPink
        tbView.topView.text = "top"
        tbView.topView.backgroundColor = .systemBlue
        tbView.bottomView.addTarget(self, action: #selector(tbViewTap), for: .touchUpInside)
        tbView.bottomView.backgroundColor = .green
        tbView.bottomView.setTitle("bottom", for: .normal)
        
        tbView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tbView)
        NSLayoutConstraint.activate([
            tbView.topAnchor.constraint(equalTo: view.topAnchor),
            tbView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbView.widthAnchor.constraint(equalToConstant: 60),
            tbView.bottomAnchor.constraint(equalTo: lrView.topAnchor)
        ])
        
    }

    @objc func lrViewTap() {
        lrView.edges.top = CGFloat(arc4random() % 10)
        lrView.edges.left = CGFloat(arc4random() % 10)
        lrView.edges.right = CGFloat(arc4random() % 10)
        lrView.edges.bottom = CGFloat(arc4random() % 10)
    }
    
    @objc func tbViewTap() {
        tbView.edges.top = CGFloat(arc4random() % 10)
        tbView.edges.left = CGFloat(arc4random() % 10)
        tbView.edges.right = CGFloat(arc4random() % 10)
        tbView.edges.bottom = CGFloat(arc4random() % 10)
    }

}

```
