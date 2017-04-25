//
//  CGContext+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 4/25/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Foundation
import UIKit

extension CGContext {
	public static var current: CGContext? {
		return UIGraphicsGetCurrentContext()
	}
}
