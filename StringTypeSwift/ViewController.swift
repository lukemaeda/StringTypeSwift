//
//  ViewController.swift
//  StringTypeSwift
//
//  Created by MAEDAHAJIME on 2015/06/21.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // テキスト表示
    @IBOutlet weak var teString: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // String[作成]ボタンを押した時 コストが低い（メモリーを使わない）
    @IBAction func proc01(sender: UIButton) {
        
        self.teString.text = nil
        
        /*
        * let：定数宣言
        * var：変数宣言
        *
        * 変数と定数
        * Swiftには、値を変更可能な変数と、一度値を設定したら以降の変更はできない定数があります。
        *
        * 変数はvarを使って宣言します。
        *
        * var level = 10
        * // 値の変更が可能
        * level = 20
        *
        * 定数はletを使って宣言します。
        *
        * let name = "孫悟空"
        * // 値を変更しようとするとコンパイルエラーになる
        * name = "ベジータ" // エラー☓
        */

        // パターン１
        var str01:String  = "あいうえお" //String型

        // log
        println (str01)
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str01)
        
        // 禁じ手 御法度使ってはいけない いちど入力されているものは使えない
        // str01 メモリーが２つ存在するためメモリーリークになる
        str01 = "アイウエオ"
        println (str01);
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str01)
        
        // パターン２（標準イニシャライザ）　let:初期化
        let str02:String  = "かきくけこ" //String型
        println (str02)
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str02)
        
    }
    
    // String[連結]ボタンを押した時
    @IBAction func proc02(sender: UIButton) {
        
        /*
        var x = 1
        var xstr = "\(x)"
        //以下でも可
        xstr = String(x);
        */
        
        self.teString.text = nil
        
        // 接続対象
        let str00:String  = "私は" //String型
        // パターン１ クラス NSString commandキー + stringWithFormat 確認
        var str01  = "\(str00)イカです。"
        var str011  = String(stringInterpolation: (str00),"イカです。")
        println (str01)
        println (str011)
        
        // パターン２ インスタンス str00 commandキー + stringByAppendingString 確認
        var str02  = "\(str00)タコです。"
        var str021  = String(stringInterpolation: (str00),"タコです。")
        println (str02)
        println (str021)
        
        // パターン３ インスタンス str00 commandキー + stringByAppendingFormat 確認
        var str03  = "\(str00)マンボウです。"
        var str031  = String(stringInterpolation: (str00),"マンボウです。")
        println (str03)
        println (str031)
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n%@\n%@\n", str01,str02,str03)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n%@\n%@\n", str011,str021,str031)
    }
    
    // String[書式指定]ボタンを押した時
    @IBAction func proc03(sender: UIButton) {
        
        // パターン１
        var str00:Int8  = 12 //String型
        let str01:String! = NSString(format:"%d", str00) as String
        println (str01)
        
        // パターン２
        let str02:String! = NSString(format:"%d:%d:%d", 12, 15, 30) as String
        println (str02)
        
        // パターン３
        let str03:String! = NSString(format:"%4d", 78) as String
        println (str03)
        
        // パターン４
        let str04:String! = NSString(format:"%4d", 80) as String
        println (str04)
        
        // パターン５
        let str05:String! = NSString(format:"%f", 1.23) as String
        println (str05)
        
        // パターン６ 小数点2桁 (g e)
        let str06:String! = NSString(format:"%.2f", M_PI) as String
        println (str06)
        
        doMethod01(str01,
            arg02: str02,
            arg03: str03,
            arg04: str04,
            arg05: str05,
            arg06: str06)
    }
    
    // NSString[文字数]ボタンを押した時
    @IBAction func proc04(sender: UIButton) {
        
        self.teString.text = nil
        
        // 対象文字列
        let str00:String! = "あいうえお"
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str00)
        
        // 文字数
        let len:Int  = count(str00)
        println (len)
        self.teString.text = self.teString.text.stringByAppendingFormat("%ld\n", len)
    }
   
    // NSString[文字列部分取得]ボタンを押した時
    @IBAction func proc05(sender: UIButton) {
        
        // 対象文字列
        let str00:String! = "iPhone"
        
        // パターン１
        let str01:String! = (str00 as NSString).substringToIndex(3)
        println (str01) // iPh
        let str011:String! = str00.substringToIndex(advance(str00.startIndex, 3))
        println (str011) // iPh
        let str012:String! = "iPhone".substringToIndex(3)
        println (str012) // iPh
        
        // パターン２
        let str02:String! = (str00 as NSString).substringFromIndex(2)
        println (str02) // hone
        
        // パターン３
        // NSRange構造体 範囲の指定 複数の変数を保持する
        //NSRange rng = NSMakeRange(2, 3);
        let str03:String! = (str00 as NSString).substringWithRange(NSRange(location: 2, length: 3))
        println (str03) // hon
        
        // TextView表示メソッド呼出 引数：文字タイプ 6個
        doMethod01(str01,
        arg02: str02,
        arg03: str03,
        arg04: "",
        arg05: "",
        arg06: "")
    }
 
    // NSString[文字列比較]ボタンを押した時
    @IBAction func proc06(sender: UIButton) {
        
        self.teString.text = nil
        
        // 対象文字列
        let str01:String! = "iPhone"
        let str02:String! = "iPad";
        //let str02:String! = "iPhone"
        
        // 比較
        let ret:Bool = (str01 == str02)
        
        // if (ret == YES)
        if (ret) {
            println ("同じ")
            let str03:String! = "同じ"
            self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str03)
        } else {
            println ("違う")
            let str03:String! = "違う"
            self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str03)
        }
        
        var str04:String! = "iPhone"
        var str05:String! = "iPad"
        
        if str04 == str05 {
            println("同じ文字列")
            let str06:String! = "同じ文字列"
            self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str06)
        }else{
            println("違う文字列") //こちら。
            let str06:String! = "違う文字列"
            self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str06)
        }

    }
    
    // [追加]ボタンを押した時
    @IBAction func proc01m(sender: UIButton) {
        
        self.teString.text = nil
        
        // 対象文字列
        var str01:NSMutableString = "Apple"
        // 追加
        str01.appendString(" Watch") // 結果：Apple Watch
        
        println (str01) // Apple Watch

        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str01)
    }
    
    // [挿入]ボタンを押した時
    @IBAction func proc02m(sender: UIButton) {
        
        self.teString.text = nil
        
        // 対象文字列
        var str01:NSMutableString = "Apple Watch"
        // 挿入
        str01.insertString(" OS2", atIndex: 5) // 結果：Apple OS2 Watch
        
        println (str01) // Apple OS2 Watch
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str01)
    }
    
    // [削除]ボタンを押した時
    @IBAction func proc03m(sender: UIButton) {
        
        self.teString.text = nil
        
        // 対象文字列
        var str01:NSMutableString = "Apple OS2 Watch"
        
        // 削除
        let delRange = NSMakeRange(10, 5)
        str01.deleteCharactersInRange(delRange) // 結果：Apple OS2
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", str01)

    }
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    func doMethod01(arg01: String,
                    arg02: String,
                    arg03: String,
                    arg04: String,
                    arg05: String,
                    arg06: String) {
                        
        self.teString.text = nil
        
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg01)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg02)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg03)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg04)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg05)
        self.teString.text = self.teString.text.stringByAppendingFormat("%@\n", arg06)
    }
    
}

