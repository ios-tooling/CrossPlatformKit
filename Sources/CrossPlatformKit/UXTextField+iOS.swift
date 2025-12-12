//
//  UXTextField+iOS.swift
//  
//
//  Created by Ben Gottlieb on 7/22/23.
//

#if os(iOS)
import UIKit

public typealias UXTextField = UITextField


extension UXTextField {
	public func selectAll() {
		selectedTextRange = textRange(from: beginningOfDocument, to: endOfDocument)
	}
}
#endif
