# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CrossPlatformKit is a Swift Package Manager library that enables easier code sharing between macOS, iOS, watchOS, and visionOS by providing unified type aliases and protocol abstractions.

**Supported Platforms:**
- macOS 11+
- iOS 13+
- watchOS 7+
- visionOS (implied via canImport checks)

## Architecture

### Core Design Pattern: Platform-Specific Type Aliases

The library uses a "UX" prefix convention to create unified type aliases that map to platform-specific UIKit/AppKit types:

- **UXView** → `NSView` (macOS) / `UIView` (iOS, visionOS)
- **UXColor** → `NSColor` (macOS) / `UIColor` (iOS)
- **UXImage** → `NSImage` (macOS) / `UIImage` (iOS)
- **UXFont** → `NSFont` (macOS) / `UIFont` (iOS)
- **UXViewController** → `NSViewController` (macOS) / `UIViewController` (iOS)
- **UXTextField** → `NSTextField` (macOS) / `UITextField` (iOS)
- **UXApplication** → `NSApplication` (macOS) / `UIApplication` (iOS)
- **UXRect** → `NSRect` (macOS) / `CGRect` (iOS)
- **UXTextContentType** → Platform-specific text content types

### File Organization

Each abstraction is implemented in paired files:
- `TypeName+Mac.swift` - macOS/AppKit implementation (using `#if os(OSX)`)
- `TypeName+iOS.swift` - iOS/UIKit implementation (using `#if canImport(UIKit)` and `#if os(iOS) || os(visionOS)`)

### SwiftUI Integration

The library provides `UXViewRepresentable` protocol to unify `NSViewRepresentable` (macOS) and `UIViewRepresentable` (iOS/visionOS). This allows writing a single view representable that works across platforms:

```swift
public protocol UXViewRepresentable {
    associatedtype UXViewType
    func makeUXView(context: Context) -> UXViewType
    func updateUXView(_ view: UXViewType, context: Context)
}
```

Extensions map `makeUXView`/`updateUXView` to the platform-specific `makeNSView`/`makeUIView` methods.

### Platform Detection Strategy

The codebase uses conditional compilation in this priority order:
1. `#if canImport(UIKit)` - Broad check for UIKit availability
2. `#if os(iOS) || os(visionOS)` - Specific iOS/visionOS features
3. `#if os(OSX)` - macOS-specific code
4. `#if os(watchOS)` - watchOS-specific code

## Common Commands

### Build
```bash
swift build
```

### Test
```bash
swift test
```

### Build for specific platform
```bash
swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk macosx --show-sdk-path`"
swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphoneos --show-sdk-path`"
```

## Development Patterns

### Adding New Type Abstractions

When adding a new UX type abstraction:

1. Create paired files: `UXTypeName+Mac.swift` and `UXTypeName+iOS.swift`
2. Use appropriate platform guards (`#if os(OSX)` vs `#if canImport(UIKit)`)
3. Define `public typealias UXTypeName = PlatformType`
4. Add convenience extensions to normalize API differences between platforms
5. Consider watchOS support in iOS file using `#if os(watchOS)` when needed

### Extension Methods

When platform APIs differ, add extension methods to normalize:
- Example: `NSView.setNeedsDisplay()` (no args) matches `UIView.setNeedsDisplay()`
- Example: `NSColor.init(red:green:blue:alpha:)` normalizes calibrated color space
- Example: `extractImage()` provides unified image capture across platforms

### SwiftUI Availability

SwiftUI features use availability guards:
- `@available(macOS 12.0, *)` for Color/UXColor conversions
- `@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)` for ImageRenderer extensions
