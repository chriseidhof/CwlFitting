//
//  CwlFitting.swift
//  CwlFitting
//
//  Created by Matt Gallagher on 7/6/19.
//  Copyright © 2019 Matt Gallagher ( https://www.cocoawithlove.com ). All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
//  SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
//  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

import SwiftUI

public struct Fitting<Content: View>: View {
	let content: Content
	public init(_ content: Content) {
		self.content = content
	}
	public var body: some View {
		content
			.environment(\.useFixedSizes, true)
			.hidden()
			.overlay(content.environment(\.useFixedSizes, false))
	}
}

public struct FittingSpacer: View {
	@Environment(\.useFixedSizes) var useFixedSizes: Bool
	let minLength: Length?
	public init(minLength: Length? = nil) {
		self.minLength = minLength
	}
	public var body: some View {
		Spacer(minLength: minLength)
			.fixedSize(horizontal: useFixedSizes, vertical: useFixedSizes)
	}
}

public struct UseFixedSizes: EnvironmentKey {
	public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
	var useFixedSizes: Bool {
		get { return self[UseFixedSizes.self] }
		set { self[UseFixedSizes.self] = newValue }
	}
}
