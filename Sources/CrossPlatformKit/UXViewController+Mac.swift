//
//  UXViewController.swift
//  CrossPlatformKit_Mac
//
//  Created by Ben Gottlieb on 12/27/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//


#if os(OSX)
import AppKit
import Cocoa
import SwiftUI

public typealias UXViewController = NSViewController
public protocol UXViewControllerRepresentable: NSViewControllerRepresentable {
	associatedtype UXViewControllerType: NSViewController
	func makeUXViewController(context: Context) -> UXViewControllerType
	func updateUXViewController(_ nsViewController: UXViewControllerType, context: Context)
}

public extension UXViewControllerRepresentable {
	func makeNSViewController(context: Context) -> UXViewControllerType {
		makeUXViewController(context: context)
	}
	
	func updateNSViewController(_ nsViewController: UXViewControllerType, context: Context) {
		updateUXViewController(nsViewController, context: context)
	}
}

#endif
