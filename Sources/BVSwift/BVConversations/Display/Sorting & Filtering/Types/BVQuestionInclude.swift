//
//
//  BVQuestionInclude.swift
//  BVSDK
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
// 

import Foundation

public enum BVQuestionInclude: BVConversationsQueryInclude {
  
  case answers
  case authors
  case products
  
  public var description: String {
    return internalDescription
  }
}

extension BVQuestionInclude: BVConversationsQueryValue {
  internal var internalDescription: String {
    get {
      switch self {
      case .answers:
        return BVAnswer.pluralKey
      case .authors:
        return BVAuthor.pluralKey
      case .products:
        return BVProduct.pluralKey
      }
    }
  }
}