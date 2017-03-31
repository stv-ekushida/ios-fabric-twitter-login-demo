# ios-fabric-twitter-login-demo
iOS FabricのTwitterKitでログインするサンプルです。(Swift3)

## ①導入
### フレームワークのダウンロード & インストール
[Fabricの公式サイト](https://get.fabric.io/)の手順どおりに進める。

### 設定
AppDelegate.swift

```
import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Fabric.with([Twitter.self])
        return true
    }
}
```

## ②使い方
### ログイン

```
        Twitter.sharedInstance().logIn { session, error in
            if (session != nil) {
                
                self.session = session
                
                print("ようこそ! \(session?.userName ?? "illegal name")さん")
                print(session?.userID ?? "illegal user ID")
                
                self.delegate?.complated(status: .login)
                
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
```

### ログアウト

```
        let store = Twitter.sharedInstance().sessionStore
        store.logOutUserID(userID)
        self.delegate?.complated(status: .logout)
        session = nil
```

## Development Environment
|Category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.2.1 |
| iOS | 10.2 |

## リファレンス
https://docs.fabric.io/apple/twitter/log-in-with-twitter.html#log-in-method
