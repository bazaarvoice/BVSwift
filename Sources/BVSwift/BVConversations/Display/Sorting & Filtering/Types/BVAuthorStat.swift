//
//
//  BVAuthorStat.swift
//  BVSDK
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
//
//  

import Foundation

public enum BVAuthorStat: BVConversationsQueryStat {
  
  case answers
  case questions
  case reviews
  
  public var description: String {
    return internalDescription
  }
}

extension BVAuthorStat: BVConversationsQueryValue {
  internal var internalDescription: String {
    get {
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
}
