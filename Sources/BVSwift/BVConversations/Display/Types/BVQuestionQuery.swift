//
//
//  BVQuestionQuery.swift
//  BVSwift
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
//
//  

import Foundation

public final class BVQuestionQuery: BVConversationsQuery<BVQuestion> {
  
  /// Public
  public let productId: String?
  public let limit: UInt16?
  public let offset: UInt16?
  
  public init(productId: String, limit: UInt16 = 100, offset: UInt16 = 0) {
    self.productId = productId
    self.limit = limit
    self.offset = offset
    
    super.init(BVQuestion.self)
    
    let productFilter:BVConversationsQueryParameter =
      .filter(
        BVCommentFilter.productId,
        BVRelationalFilterOperator.equalTo,
        [productId],
        nil)
    
    add(parameter: productFilter)
    
    if 0 < limit {
      let limitField: BVLimitQueryField = BVLimitQueryField(limit)
      add(parameter: .customField(limitField, nil))
    }
    
    if 0 < offset {
      let offsetField: BVOffsetQueryField = BVOffsetQueryField(offset)
      add(parameter: .customField(offsetField, nil))
    }
  }
}

// MARK: - BVQuestionQuery: BVConversationsQueryFilterable
extension BVQuestionQuery: BVConversationsQueryFilterable {
  public typealias Filter = BVQuestionFilter
  public typealias Operator = BVRelationalFilterOperator
  
  @discardableResult public func filter(
    _ filter: Filter,
    op: Operator,
    value: CustomStringConvertible) -> Self {
    return self.filter(filter, op: op, values: [value])
  }
  
  @discardableResult public func filter(
    _ filter: Filter,
    op: Operator,
    values: [CustomStringConvertible]) -> Self {
    let internalFilter:BVConversationsQueryParameter =
      .filter(filter, op, values, nil)
    add(parameter: internalFilter)
    return self
  }
}

// MARK: - BVQuestionQuery: BVConversationsQueryIncludeable
extension BVQuestionQuery: BVConversationsQueryIncludeable {
  public typealias Include = BVQuestionInclude
  
  @discardableResult public func include(
    _ include: Include, limit: UInt16 = 10) -> Self {
    let internalInclude:BVConversationsQueryParameter = .include(include, nil)
    add(parameter: internalInclude, coalesce: true)
    if limit > 0 {
      let internalIncludeLimit:BVConversationsQueryParameter =
        .includeLimit(include, limit, nil)
      add(parameter: internalIncludeLimit)
    }
    return self
  }
}

// MARK: - BVQuestionQuery: BVConversationsQuerySortable
extension BVQuestionQuery: BVConversationsQuerySortable {
  public typealias Sort = BVQuestionSort
  public typealias Order = BVMonotonicSortOrder
  
  @discardableResult public func sort(
    _ sort: Sort, order: Order) -> Self {
    let internalSort: BVConversationsQueryParameter = .sort(sort, order, nil)
    add(parameter: internalSort)
    return self
  }
}
