//
//
//  BVSubmissionable.swift
//  BVSwift
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
// 

import Foundation

/// The main base protocol for BV Types used for Submission Requests
public protocol BVSubmissionable: BVResourceable { }

/// The main base protocol for BV Types used for Submission Requests that have
/// actionable callback handlers associated with them
public protocol BVSubmissionActionable: BVURLRequestableWithHandler { }

// MARK: - BVSubmissionableInternal
internal protocol BVSubmissionableInternal: BVSubmissionable {
  static var postResource: String? { get }
}

// MARK: - BVSubmissionActionableInternal
internal protocol BVSubmissionActionableInternal:
BVURLRequestableWithHandlerInternal { }

// MARK: - BVSubmissionPreflightable
internal protocol BVSubmissionPreflightable: BVSubmissionActionableInternal {
  func preflightWithInternalResponse(_ continue: (() -> Swift.Void))
}

// MARK: - BVSubmissionPostflightable
internal protocol BVSubmissionPostflightable: BVSubmissionActionableInternal {
  func postflight(_ response: BVURLRequestableResponseInternal)
}
