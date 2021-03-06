//
//
//  BVAuthorStat.swift
//  BVSwift
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
//
//  

import Foundation

/// An enum that represents the possible representatble statistics for
/// BVQueryable objects with a relation to the target BVAuthor object.
/// - Note:
/// \
/// Used for conformance with the BVQueryStatable protocol.
public enum BVAuthorStat: BVQueryStat {
  
  case answers
  case questions
  case reviews
  
  public static var statPrefix: String {
    return BVConversationsConstants.BVQueryStat.defaultField
  }
  
  public var description: String {
    return internalDescription
  }
}

extension BVAuthorStat: BVConversationsQueryValue {
  internal var internalDescription: String {
    switch self {
    case .answers:
      return BVAnswer.pluralKey
    case .questions:
      return BVQuestion.pluralKey
    case .reviews:
      return BVReview.pluralKey
    }
  }
}
