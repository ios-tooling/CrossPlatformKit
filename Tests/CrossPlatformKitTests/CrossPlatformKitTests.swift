//
//  CrossPlatformKitTests.swift
//  CrossPlatformKit
//
//  Comprehensive tests using XCTest
//

import XCTest
import Foundation
@testable import CrossPlatformKit

#if canImport(AppKit)
import AppKit
import SwiftUI
#elseif canImport(UIKit)
import UIKit
import SwiftUI
#endif

// MARK: - Type Alias Tests

final class CrossPlatformKitTests: XCTestCase {

	func testUXViewTypeAlias() {
		#if canImport(AppKit)
		let view = UXView()
		XCTAssertTrue(view is NSView)
		#elseif canImport(UIKit)
		let view = UXView()
		XCTAssertTrue(view is UIView)
		#endif
	}

	func testUXViewControllerTypeAlias() {
		#if canImport(AppKit)
		let vc = UXViewController()
		XCTAssertTrue(vc is NSViewController)
		#elseif canImport(UIKit)
		let vc = UXViewController()
		XCTAssertTrue(vc is UIViewController)
		#endif
	}

	func testUXColorTypeAlias() {
		#if canImport(AppKit)
		let color = UXColor.red
		XCTAssertTrue(color is NSColor)
		#elseif canImport(UIKit)
		let color = UXColor.red
		XCTAssertTrue(color is UIColor)
		#endif
	}

	func testUXImageTypeAlias() {
		#if canImport(AppKit)
		let image = UXImage(size: CGSize(width: 10, height: 10))
		XCTAssertTrue(image is NSImage)
		#elseif canImport(UIKit)
		let image = UXImage()
		XCTAssertTrue(image is UIImage)
		#endif
	}

	func testUXFontTypeAlias() {
		#if canImport(AppKit)
		let font = UXFont.systemFont(ofSize: 12)
		XCTAssertTrue(font is NSFont)
		#elseif canImport(UIKit)
		let font = UXFont.systemFont(ofSize: 12)
		XCTAssertTrue(font is UIFont)
		#endif
	}

	func testUXTextFieldTypeAlias() {
		#if canImport(AppKit)
		let textField = UXTextField()
		XCTAssertTrue(textField is NSTextField)
		#elseif canImport(UIKit)
		let textField = UXTextField()
		XCTAssertTrue(textField is UITextField)
		#endif
	}

	func testUXApplicationTypeAlias() {
		#if canImport(AppKit)
		let app = UXApplication.app
		XCTAssertTrue(app is NSApplication)
		#elseif canImport(UIKit)
		#if !os(watchOS)
		let app = UXApplication.app
		XCTAssertTrue(app is UIApplication)
		#endif
		#endif
	}

	func testUXRectTypeAlias() {
		let rect: UXRect = .zero
		#if canImport(AppKit)
		XCTAssertTrue(rect is NSRect)
		#elseif canImport(UIKit)
		XCTAssertTrue(rect is CGRect)
		#endif
	}

	func testUXTextContentTypeTypeAlias() {
		#if canImport(AppKit)
		let contentType: UXTextContentType = .username
		XCTAssertTrue(contentType is NSTextContentType)
		#elseif canImport(UIKit)
		let contentType: UXTextContentType = .username
		XCTAssertTrue(contentType is UITextContentType)
		#endif
	}

	// MARK: - Color Extension Tests

	func testDefaultBackgroundColor() {
		let backgroundColor = UXColor.defaultBackground
		XCTAssertNotNil(backgroundColor)
	}

	#if canImport(AppKit)
	func testNSColorConvenienceInit() {
		let color = NSColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
		XCTAssertNotNil(color)
	}
	#endif

	@available(macOS 12.0, iOS 13.0, watchOS 7.0, *)
	func testColorConversion() {
		let uxColor = UXColor.red
		let swiftUIColor = uxColor.color
		XCTAssertTrue(swiftUIColor is Color)
	}

	@available(macOS 12.0, iOS 13.0, watchOS 7.0, *)
	func testColorInitFromUXColor() {
		let uxColor = UXColor.blue
		let color = Color(uxColor: uxColor)
		XCTAssertTrue(color is Color)
	}

	// MARK: - Image Extension Tests

	func testImageFromOptionalData() {
		let nilImage = UXImage(data: nil as Data?)
		XCTAssertNil(nilImage)
	}

	func testImageFromNonFileURL() {
		let httpURL = URL(string: "https://example.com/image.png")
		let image = UXImage(url: httpURL)
		XCTAssertNil(image)

		let nilURL = UXImage(url: nil as URL?)
		XCTAssertNil(nilURL)
	}

	func testImageCreate() {
		let size = CGSize(width: 100, height: 100)
		let image = UXImage.create(size: size) { ctx in
			UXColor.red.setFill()
			ctx.fill(CGRect(origin: .zero, size: size))
		}

		XCTAssertNotNil(image)
		#if canImport(AppKit)
		XCTAssertEqual(image?.size, size)
		#elseif canImport(UIKit)
		XCTAssertEqual(image?.size, size)
		#endif
	}

	#if canImport(AppKit)
	func testNSImageJPEGData() {
		let image = NSImage(size: CGSize(width: 10, height: 10))
		image.lockFocus()
		NSColor.red.setFill()
		NSRect(x: 0, y: 0, width: 10, height: 10).fill()
		image.unlockFocus()

		let data = image.jpegData(compressionQuality: 0.9)
		XCTAssertNotNil(data)
	}

	func testNSImagePNGData() {
		let image = NSImage(size: CGSize(width: 10, height: 10))
		image.lockFocus()
		NSColor.blue.setFill()
		NSRect(x: 0, y: 0, width: 10, height: 10).fill()
		image.unlockFocus()

		let data = image.pngData()
		XCTAssertNotNil(data)
	}

	func testNSImageFromCGImage() {
		let size = CGSize(width: 10, height: 10)
		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let context = CGContext(
			data: nil,
			width: Int(size.width),
			height: Int(size.height),
			bitsPerComponent: 8,
			bytesPerRow: 0,
			space: colorSpace,
			bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
		)

		if let cgImage = context?.makeImage() {
			let image = NSImage(cgImage: cgImage)
			XCTAssertEqual(image.size, size)
		}
	}
	#endif

	func testImageToSwiftUIConversion() {
		#if canImport(AppKit)
		let uxImage = NSImage(size: CGSize(width: 10, height: 10))
		#elseif canImport(UIKit)
		let uxImage = UIImage()
		#endif

		let swiftUIImage = uxImage.image
		XCTAssertTrue(swiftUIImage is Image)
	}

	func testSwiftUIImageInitFromUXImage() {
		#if canImport(AppKit)
		let uxImage = NSImage(size: CGSize(width: 10, height: 10))
		#elseif canImport(UIKit)
		let uxImage = UIImage()
		#endif

		let image = Image(uxImage: uxImage)
		XCTAssertTrue(image is Image)
	}

	// MARK: - View Extension Tests

	#if canImport(AppKit)
	@MainActor func testNSViewSetNeedsDisplay() {
		let view = NSView()
		view.setNeedsDisplay()
		// No crash means success
	}

	@MainActor func testNSViewExtractImage() {
		let view = NSView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		let _ = view.extractImage()
		// Just testing it doesn't crash
	}
	#elseif canImport(UIKit)
	func testUIViewExtractImage() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		view.backgroundColor = .red
		let image = view.extractImage()
		XCTAssertNotNil(image)
		XCTAssertTrue(image is UIImage)
	}
	#endif

	// MARK: - Rect Extension Tests

	func testRectDimensions() {
		let rect = UXRect(x: 0, y: 0, width: 100, height: 100)
		XCTAssertEqual(rect.width, 100)
		XCTAssertEqual(rect.height, 100)
	}

	// MARK: - TextField Extension Tests

	func testTextFieldSelectAll() {
		let textField = UXTextField()
		#if canImport(AppKit)
		textField.stringValue = "Test"
		#elseif canImport(UIKit)
		textField.text = "Test"
		#endif

		textField.selectAll()
	}

	// MARK: - Bundle Extension Tests

	func testBundleImageNamed() {
		let bundle = Bundle.main
		let image = bundle.image(named: "NonExistentImage")
		XCTAssertNil(image)
	}

	// MARK: - CGContext Extension Tests

	func testCGContextCurrent() {
		let context = CGContext.current
		XCTAssertNil(context)
	}

	// MARK: - ImageRenderer Extension Tests

	#if canImport(SwiftUI)
	@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
	@MainActor
	func testImageRendererUXImage() {
		let renderer = ImageRenderer(content: Color.red.frame(width: 100, height: 100))
		let _ = renderer.uxImage
		// Just testing it compiles
	}
	#endif

	// MARK: - Integration Tests

	func testColorAndImageIntegration() {
		let color = UXColor.red
		let size = CGSize(width: 50, height: 50)

		let image = UXImage.create(size: size) { ctx in
			color.setFill()
			ctx.fill(CGRect(origin: .zero, size: size))
		}

		XCTAssertNotNil(image)
	}

	func testAllTypeAliasesAvailable() {
		let _: UXView.Type = UXView.self
		let _: UXViewController.Type = UXViewController.self
		let _: UXColor.Type = UXColor.self
		let _: UXImage.Type = UXImage.self
		let _: UXFont.Type = UXFont.self
		let _: UXTextField.Type = UXTextField.self
		let _: UXRect.Type = UXRect.self
	}
}

