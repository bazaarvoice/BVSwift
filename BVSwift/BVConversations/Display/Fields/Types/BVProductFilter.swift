//
//  BVProductFilter.swift
//  BVSwift
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
//

import Foundation

/// An enum that represents the possible filtering comparators to filter on for
/// the BVProduct[s|Search]Query
/// - Note:
/// \
/// Used for conformance with the BVQueryFilterable protocol.
public enum BVProductFilter: BVQueryFilter {
  
  case answers(BVAnswerFilter)
  case authors(BVAuthorFilter)
  case averageOverallRating(Double)
  case categoryAncestorId(String)
  case categoryId(String)
  case comments(BVCommentFilter)
  case isActive(Bool)
  case isDisabled(Bool)
  case lastAnswerTime(Date)
  case lastQuestionTime(Date)
  case lastReviewTime(Date)
  case lastStoryTime(Date)
  case name(String)
  case questions(BVQuestionFilter)
  case ratingsOnlyReviewCount(Int)
  case reviews(BVReviewFilter)
  case totalAnswerCount(Int)
  case totalQuestionCount(Int)
  case totalReviewCount(Int)
  case totalStoryCount(Int)
  
  public static var filterPrefix: String {
    return BVConversationsConstants.BVQueryFilter.defaultField
  }
  
  public static var filterTypeSeparator: String {
    return BVConversationsConstants.BVQueryFilter.typeSeparatorField
  }
  
  public static var filterValueSeparator: String {
    return BVConversationsConstants.BVQueryFilter.valueSeparatorField
  }
  
  public var description: String {
    return internalDescription
  }
  
  public var representedValue: CustomStringConvertible {
    switch self {
    case let .answers(filter):
      return filter.representedValue
    case let .authors(filter):
      return filter.representedValue
    case let .averageOverallRating(filter):
      return filter
    case let .categoryAncestorId(filter):
      return filter
    case let .categoryId(filter):
      return filter
    case let .comments(filter):
      return filter
    case let .isActive(filter):
      return filter
    case let .isDisabled(filter):
      return filter
    case let .lastAnswerTime(filter):
      return filter.toBVFormat
    case let .lastQuestionTime(filter):
      return filter.toBVFormat
    case let .lastReviewTime(filter):
      return filter.toBVFormat
    case let .lastStoryTime(filter):
      return filter.toBVFormat
    case let .name(filter):
      return filter
    case let .questions(filter):
      return filter.representedValue
    case let .ratingsOnlyReviewCount(filter):
      return filter
    case let .reviews(filter):
      return filter.representedValue
    case let .totalAnswerCount(filter):
      return filter
    case let .totalQuestionCount(filter):
      return filter
    case let .totalReviewCount(filter):
      return filter
    case let .totalStoryCount(filter):
      return filter
    }
  }
}

extension BVProductFilter: BVConversationsQueryValue {
  internal var internalDescription: String {
    switch self {
    case .answers:
      return BVAnswer.pluralKey
    case .authors:
      return BVAuthor.pluralKey
    case .averageOverallRating:
      return BVConversationsConstants.BVProducts.Keys.averageOverallRating
    case .categoryAncestorId:
      return BVConversationsConstants.BVProducts.Keys.categoryAncestorId
    case .categoryId:
      return BVConversationsConstants.BVProducts.Keys.categoryId
    case .comments:
      return BVComment.pluralKey
    case .isActive:
      return BVConversationsConstants.BVProducts.Keys.isActive
    case .isDisabled:
      return BVConversationsConstants.BVProducts.Keys.isDisabled
    case .lastAnswerTime:
      return BVConversationsConstants.BVProducts.Keys.lastAnswerTime
    case .lastQuestionTime:
      return BVConversationsConstants.BVProducts.Keys.lastQuestionTime
    case .lastReviewTime:
      return BVConversationsConstants.BVProducts.Keys.lastReviewTime
    case .lastStoryTime:
      return BVConversationsConstants.BVProducts.Keys.lastStoryTime
    case .name:
      return BVConversationsConstants.BVProducts.Keys.name
    case .questions:
      return BVQuestion.pluralKey
    case .ratingsOnlyReviewCount:
      return BVConversationsConstants.BVProducts.Keys.ratingsOnlyReviewCount
    case .reviews:
      return BVReview.pluralKey
    case .totalAnswerCount:
      return BVConversationsConstants.BVProducts.Keys.totalAnswerCount
    case .totalQuestionCount:
      return BVConversationsConstants.BVProducts.Keys.totalQuestionCount
    case .totalReviewCount:
      return BVConversationsConstants.BVProducts.Keys.totalReviewCount
    case .totalStoryCount:
      return BVConversationsConstants.BVProducts.Keys.totalStoryCount
    }
  }
}
