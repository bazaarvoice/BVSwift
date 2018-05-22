//
//
//  BVFormField.swift
//  BVSwift
//
//  Copyright © 2018 Bazaarvoice. All rights reserved.
// 

import Foundation

public struct BVFormField: Codable {
  private let type: String?
  var formInputType: BVFormInputType {
    get {
      return BVFormInputType(rawValue: type)
    }
  }
  let identifier: String?
  let isDefault: Bool?
  let label: String?
  let maxLength: Int?
  let minLength: Int?
  let options: [BVFormFieldOption]?
  let required: Bool?
  let value: String?
  
  private enum CodingKeys: String, CodingKey {
    case identifier = "Id"
    case isDefault = "Default"
    case label = "Label"
    case maxLength = "MaxLength"
    case minLength = "MinLength"
    case options = "Options"
    case required = "Required"
    case type = "Type"
    case value = "Value"
  }
}

public struct BVFormFieldError: Codable {
  let codeString: String?
  let messageString: String?
  let name: String?
  
  private enum CodingKeys: String, CodingKey {
    case codeString = "Code"
    case messageString = "Message"
    case name = "Field"
  }
}

extension BVFormFieldError: BVError {
  public var code: String {
    get {
      return codeString ?? "Unknown Form Field Error Code"
    }
  }
  
  public var message: String {
    get {
      return messageString ?? "Unknown Form Field Error Message"
    }
  }
  
  public var description: String {
    get {
      return "Code: \(code) Message: \(message)"
    }
  }
  
  public var debugDescription: String {
    get {
      return "Name: \(name ?? "Unknown"), " +
      "Code: \(code), Message: \(message)"
    }
  }
}

public struct BVFormFieldOption: Codable {
  let label: String?
  let selected: Bool?
  let value: String?
  
  private enum CodingKeys: String, CodingKey {
    case label = "Label"
    case selected = "Selected"
    case value = "Value"
  }
}

public enum BVFormInputType {
  case boolean
  case file
  case integer
  case select
  case text
  case textarea
  case unknown
}

internal extension BVFormInputType {
  internal init(rawValue: String?) {
    switch rawValue {
    case let .some(value) where "BooleanInput" == value:
      self = .boolean
    case let .some(value) where "FileInput" == value:
      self = .file
    case let .some(value) where "IntegerInput" == value:
      self = .integer
    case let .some(value) where "SelectInput" == value:
      self = .select
    case let .some(value) where "TextInput" == value:
      self = .text
    case let .some(value) where "TextAreaInput" == value:
      self = .textarea
    default:
      self = .unknown
    }
  }
}
