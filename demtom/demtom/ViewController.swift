//
//  ViewController.swift
//  demtom
//
//  Created by hwly on 2021/5/27.
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

struct GameBoard {
    var p1Score: Int32
    var p2Score: Int32
    var gameOver: Bool!

    mutating func changeP1() {
        p1Score = 1
    }
}

struct GameBoard2 {
    var p1Score: Int32
    var p2Score: Int32
    var gameOver: Bool
}

class TomeGa {
    var p1Score: Int = 0
    var p2Score: Int = 0
    var p3Score: Int = 0
    var gameOver: Bool = false
}

class ViewController: UIViewController {
    lazy var aLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    lazy var changeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.setTitle("Change", for: .normal)

        button.addTarget(self, action: #selector(changeButtonAction(sender:)), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var a = MemoryLayout<GameBoard>.size

        var b = MemoryLayout<TomeGa>.size

        print(Mems.memStr(ofVal: &a))

        print(Mems.memStr(ofVal: &b))

        print(a)
        print(b)

        view.addSubview(aLabel)
        aLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        view.addSubview(changeBtn)
        changeBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(aLabel.snp.bottom).offset(10)
        }

        aLabel.text = "GameOver"

        _ = PrintPoint().callPoint()

        // Data转换成String打印输出
    }

    func callBaiduApi() {
        let data = DartJson.data(using: .utf8)

        let jsson = try? JSONSerialization.jsonObject(with: data!,
                                                      options: .allowFragments) as? [[String: Any]]

        let semaphore = DispatchSemaphore(value: 1)

        func printDartInfoDic(list: [[String: Any]]) {
            for item in list {
                Thread.sleep(forTimeInterval: 3)
                semaphore.wait()
                if item["list"] != nil {
                    if let list = item["list"] as? [[String: Any]] {
                        if let title = item["title"] as? String {
                            print("\n### \(title)\n")
                            print("| 组件名称名字 | 视频URL | 组件英文描述 |")
                            print("| ------- | :------ | ----- |")
                        }
                        semaphore.signal()
                        printDartInfoDic(list: list)
                    }
                } else {
                    if let desc = item["desc"] as? String {
                        printDesAndTitle(desc, item)
                    }
                }
            }
        }

        func printDesAndTitle(_ desc: String, _ item: [String: Any]) {
            let appid = "20210806000908690"
            let salt = "123444421"
            let baseURL = "https://api.fanyi.baidu.com/api/trans/vip/translate"
            let sign = "\(appid)\(desc)\(salt)pF2l0p9cIanhNgjStuHm".md5

            AF.request(baseURL, method: .get, parameters: ["q": desc, "from": "en", "to": "zh", "appid": appid, "salt": salt, "sign": sign], headers: nil, interceptor: nil, requestModifier: nil).responseJSON(queue: DispatchQueue.global(), completionHandler: { json in
                var dartString: String = "| "

                if let title = item["title"] as? String {
                    dartString.append(title)
                    dartString.append(" |")
                }

                if let url = item["url"] as? String {
                    dartString.append(url)
                    dartString.append(" |")
                }
                if let dic = json.value as? [String: Any] {
                    if let keydic = dic["trans_result"] as? [[String: Any]] {
                        if let dst = keydic.first!["dst"] as? String {
                            dartString.append(dst)
                            dartString.append(" |")
                        } else {
                            dartString.append(desc)
                            dartString.append(" |")
                        }
                    } else {
                        dartString.append(desc)
                        dartString.append(" |")
                    }
                } else {
                    dartString.append(desc)
                    dartString.append(" |")
                }
                print(dartString)
                semaphore.signal()
            })
        }

        if let list = jsson {
            printDartInfoDic(list: list)
        }
    }

    func printAddress(values: AnyObject...) {
        for value in values {
            print(Unmanaged.passUnretained(value).toOpaque())
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc func changeButtonAction(sender: UIButton) {
        UIView.animate(withDuration: 1.3) { [weak self] in
            self?.aLabel.text = "text has changed"
            self?.aLabel.textColor = UIColor.purple
            self?.aLabel.font = UIFont.boldSystemFont(ofSize: 19)
        }
    }
}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        var idx: Int = 0
        for item in nums {
            if let value = map[target - item] {
                return [value, idx]
            }
            map[item] = idx
            idx += 1
        }
        return [0]
    }

    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        nums.enumerated().forEach { _, _ in
        }

        return [0]
    }
}
