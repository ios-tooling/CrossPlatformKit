//
//  Bundle+iOS.swift
//  CrossPlatformKit_iOS
//
//  Created by Ben Gottlieb on 7/6/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Foundation

#if canImport(UIKit)
#if os(iOS) || os(visionOS) || os(watchOS)
import UIKit

extension Bundle {
	public func image(named name: String) -> UIImage? {
		return UIImage(named: name, in: self, compatibleWith: nil)
	}
}
#endif
#endif
