//
//  LZHTextView.swift
//  TextViewDemo
//
//  Created by OFweek01 on 2021/5/27.
//

import UIKit
import SnapKit

class LZHTextView: UIView, UITextViewDelegate {
    
    /** 占位词 **/
    let placeHolderLabel = UILabel()

    /** 文本View */
    let textV = UITextView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textV.backgroundColor = .white
        textV.returnKeyType = .done
        textV.tintColor = UIColor.orange
        textV.font = UIFont.systemFont(ofSize: 14)
        textV.textColor = .black
        textV.delegate = self
        self.addSubview(textV)
        textV.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        placeHolderLabel.textColor = UIColor.init(red: 135/255.0, green: 135/255.0, blue: 135/255.0, alpha: 1.0)
        placeHolderLabel.font = UIFont.systemFont(ofSize: 14)
        //placeHolderLabel.backgroundColor = UIColor.white
        placeHolderLabel.isHidden = false
        placeHolderLabel.textAlignment = .center
        textV.addSubview(placeHolderLabel)
        placeHolderLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            //make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(65)
            
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * 设置占位词
     */
    func setPlaceHolder(holderStr: String) -> Void {
        placeHolderLabel.text = holderStr
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        //self.placeHolderLabel.isHidden = true // 隐藏
        if textView.text.isEmpty {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 3.0 //行间距
            paragraphStyle.firstLineHeadIndent = 29 * 2.0; //首行缩进
            textView.attributedText = NSAttributedString.init(string: " ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
            textView.text = ""
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 3.0 //行间距
            paragraphStyle.firstLineHeadIndent = 29 * 2.0; //首行缩进
            textView.attributedText = NSAttributedString.init(string: textView.text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
            //textView.selectedRange = NSRange.init(location: 0, length: 30)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"{ // 输入换行符时收起键盘
            textView.resignFirstResponder() // 收起键盘
            return false
        }
        
        if text != "" {
             //self.placeHolderLabel.isHidden = true // 隐藏
        }
        
        let textStr = NSString.init(format: "%@", text)
        
        if textStr.isEqual(to: "") && range.length == 1 && range.location == 0 {
            //self.placeHolderLabel.isHidden = false // 隐藏
        }
        
        return true
    }
}
