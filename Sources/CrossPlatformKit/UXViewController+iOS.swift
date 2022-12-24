//
//  UXViewController.swift
//  CrossPlatformKit_iOS
//
//  Created by Ben Gottlieb on 12/27/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if canImport(UIKit)
#if os(iOS)
import UIKit
import SwiftUI

public typealias UXViewController = UIViewController
public protocol UXViewControllerRepresentable: UIViewControllerRepresentable {
	associatedtype UXViewControllerType: UIViewController
	func makeUXViewController(context: Context) -> UXViewControllerType
	func updateUXViewController(_ uiViewController: UXViewControllerType, context: Context)
}

public extension UXViewControllerRepresentable {
	func makeUIViewController(context: Context) -> UXViewControllerType {
		makeUXViewController(context: context)
	}
	
	func updateUIViewController(_ uiViewController: UXViewControllerType, context: Context) {
		updateUXViewController(uiViewController, context: context)
	}
}

#endif
#endif
