//
//  GithubLoginViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit
import WebKit

class GithubLoginViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    private var webView: WKWebView!
    private var networkIndicator: NetworkIndicator!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIndicator()
        self.view.addSubview(networkIndicator)
        let url = URL(string: "http://52.78.108.151:8080/github-login")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    private func configureIndicator() {
        let width = view.frame.width / 8
        networkIndicator = NetworkIndicator(frame: CGRect(x: view.center.x - width / 2,
                                                          y: view.center.y - width / 2,
                                                          width: width,
                                                          height: width),
                                            image: UIImage(named: "99.png"))
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { (cookies) in
            for cookie in cookies {
                if cookie.name == "auth-token" {
                    UserDefaults.standard.set(cookie.value, forKey: "auth-token")
                    let successAlert = self.networkAlert(title: "알림", message: "로그인에 성공했습니다!"){
                        guard let gameListViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameListViewController") as? GameListViewController else { return }
                        self.present(gameListViewController, animated: true)
                    }
                    self.present(successAlert, animated: true)
                }
            }
        }
        decisionHandler(.allow)
    }
    
   
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        networkIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        networkIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        networkIndicator.stopAnimating()
        DispatchQueue.main.async {
            let errorAlert = self.networkAlert(title: "알림", message: "네트워크에 오류가 생겼습니다. 잠시후 다시 시도해주세요") {
                self.dismiss(animated: true)
            }
            self.present(errorAlert, animated: true)
        }
        
    }
    
    private func networkAlert(title: String, message: String, handler: @escaping () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            handler()
        }
        alert.addAction(ok)
        return alert
    }
}
