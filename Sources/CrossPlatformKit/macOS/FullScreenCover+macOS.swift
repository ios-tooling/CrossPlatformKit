//
//  fullScreenCover.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 7/9/26.
//

import SwiftUI

public extension View {
	@ViewBuilder func fullScreenCover<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
		
		self.sheet(isPresented: isPresented, content: content)
	}
	
	@ViewBuilder func fullScreenCover<Content: View, Item: Identifiable>(item: Binding<Item?>, content: @escaping (Item) -> Content) -> some View {
		
		self.sheet(item: item, content: content)
	}
}
