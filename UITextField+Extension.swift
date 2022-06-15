//
//  UITextField+Extension.swift
//  mask
//
//  Created by 付文华 on 2022/6/15.
//

import UIKit

public extension Pattern where Base: UITextField {
    
    func setPattern(_ pattern: String, limitCount: Int = -1, changed: ((String) -> Void)?) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: base, queue: OperationQueue.current) {[weak base] notif in
            base?.limitWithPattern(pattern, limitCount: limitCount, valueChanged: changed)
        }
    }
}

extension UITextField {
    
    public func limitWithPattern(_ pattern : String, limitCount: Int = -1, valueChanged: ((String) -> Void)? = nil) {
        guard let _: UITextRange = self.markedTextRange else {
            let cursorPosition = self.offset(from: self.endOfDocument, to: self.selectedTextRange!.end)
            var st = self.text!.regularReplace(pattern: pattern, with: "")
            if limitCount >= 0 {
                if st.count > limitCount {
                    st = String(st.prefix(limitCount))
                }
            }
            
            self.text = st
            valueChanged?(st)
            guard let targetPosition = self.position(from: self.endOfDocument, offset: cursorPosition) else { return }
            self.selectedTextRange = self.textRange(from: targetPosition, to: targetPosition)
            return
        }
    }
}

extension UITextField: PatternCompatible { }

extension String  {
    func regularReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        var text = self
        while !text.isEmpty && !predicate.evaluate(with: text) {
            text.removeLast()
        }
        
        return text
    }
}
