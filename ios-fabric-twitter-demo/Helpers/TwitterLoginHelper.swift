//
//  TwitterLoginHelper.swift
//  ios-fabric-twitter-demo
//
//  Created by Eiji Kushida on 2017/03/31.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import TwitterKit

enum TwitterLoginStatus{
    case login
    case logout
}

protocol TwitterLoginDelegate {
    func complated(status: TwitterLoginStatus)
}

final class TwitterLoginHelper {
    
    var delegate: TwitterLoginDelegate?
    private var session: TWTRSession?
 
    func login() {
        
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
    }
    
    func logout(userID: String) {
        let store = Twitter.sharedInstance().sessionStore
        store.logOutUserID(userID)
        self.delegate?.complated(status: .logout)
        session = nil
    }
    
    func userID() -> String? {
        let store = Twitter.sharedInstance().sessionStore
        return store.session()?.userID ?? nil
    }
    
    func showButtonTitle() -> String {
        return session == nil ? "ログイン" : "ログアウト"
    }
}
