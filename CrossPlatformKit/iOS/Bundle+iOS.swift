//
//  Bundle+iOS.swift
//  CrossPlatformKit_iOS
//
//  Created by Ben Gottlieb on 7/6/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Foundation

import UIKit

extension Bundle {
	public func image(named name: String) -> UIImage? {
		return UIImage(named: name, in: self, compatibleWith: nil)
	}
}

