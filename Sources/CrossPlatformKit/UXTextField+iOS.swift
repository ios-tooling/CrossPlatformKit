//
//  UXTextField+iOS.swift
//  
//
//  Created by Ben Gottlieb on 7/22/23.
//

#if canImport(UIKit)
#if os(iOS) || os(visionOS) || os(watchOS)
import UIKit

public typealias UXTextField = UITextField


extension UXTextField {
	public func selectAll() {
		selectedTextRange = textRange(from: beginningOfDocument, to: endOfDocument)
	}
}
#endif
#endif
