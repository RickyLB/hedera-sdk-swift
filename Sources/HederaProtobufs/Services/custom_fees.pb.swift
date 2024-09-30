// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: custom_fees.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

///*
/// A fraction of the transferred units of a token to assess as a fee. The amount assessed will never
/// be less than the given minimum_amount, and never greater than the given maximum_amount.  The
/// denomination is always units of the token to which this fractional fee is attached.
public struct Proto_FractionalFee: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// The fraction of the transferred units to assess as a fee
  public var fractionalAmount: Proto_Fraction {
    get {return _fractionalAmount ?? Proto_Fraction()}
    set {_fractionalAmount = newValue}
  }
  /// Returns true if `fractionalAmount` has been explicitly set.
  public var hasFractionalAmount: Bool {return self._fractionalAmount != nil}
  /// Clears the value of `fractionalAmount`. Subsequent reads from it will return its default value.
  public mutating func clearFractionalAmount() {self._fractionalAmount = nil}

  ///*
  /// The minimum amount to assess
  public var minimumAmount: Int64 = 0

  ///*
  /// The maximum amount to assess (zero implies no maximum)
  public var maximumAmount: Int64 = 0

  ///*
  /// If true, assesses the fee to the sender, so the receiver gets the full amount from the token
  /// transfer list, and the sender is charged an additional fee; if false, the receiver does NOT get
  /// the full amount, but only what is left over after paying the fractional fee
  public var netOfTransfers: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _fractionalAmount: Proto_Fraction? = nil
}

///*
/// A fixed number of units (hbar or token) to assess as a fee during a CryptoTransfer that transfers
/// units of the token to which this fixed fee is attached.
public struct Proto_FixedFee: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// The number of units to assess as a fee
  public var amount: Int64 = 0

  ///*
  /// The denomination of the fee; taken as hbar if left unset and, in a TokenCreate, taken as the id
  /// of the newly created token if set to the sentinel value of 0.0.0
  public var denominatingTokenID: Proto_TokenID {
    get {return _denominatingTokenID ?? Proto_TokenID()}
    set {_denominatingTokenID = newValue}
  }
  /// Returns true if `denominatingTokenID` has been explicitly set.
  public var hasDenominatingTokenID: Bool {return self._denominatingTokenID != nil}
  /// Clears the value of `denominatingTokenID`. Subsequent reads from it will return its default value.
  public mutating func clearDenominatingTokenID() {self._denominatingTokenID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _denominatingTokenID: Proto_TokenID? = nil
}

///*
/// A fee to assess during a CryptoTransfer that changes ownership of an NFT. Defines the fraction of
/// the fungible value exchanged for an NFT that the ledger should collect as a royalty. ("Fungible
/// value" includes both ℏ and units of fungible HTS tokens.) When the NFT sender does not receive
/// any fungible value, the ledger will assess the fallback fee, if present, to the new NFT owner.
/// Royalty fees can only be added to tokens of type type NON_FUNGIBLE_UNIQUE.
///
/// **IMPORTANT:** Users must understand that native royalty fees are _strictly_ a convenience feature, 
/// and that the network cannot enforce inescapable royalties on the exchange of a non-fractional NFT. 
/// For example, if the counterparties agree to split their value transfer and NFT exchange into separate 
/// transactions, the network cannot possibly intervene. (And note the counterparties could use a smart 
/// contract to make this split transaction atomic if they do not trust each other.)
/// 
/// Counterparties that _do_ wish to respect creator royalties should follow the pattern the network 
/// recognizes: The NFT sender and receiver should both sign a single `CryptoTransfer` that credits 
/// the sender with all the fungible value the receiver is exchanging for the NFT.
/// 
/// Similarly, a marketplace using an approved spender account for an escrow transaction should credit 
/// the account selling the NFT in the same `CryptoTransfer` that deducts fungible value from the buying 
/// account. 
/// 
/// There is an [open HIP discussion](https://github.com/hashgraph/hedera-improvement-proposal/discussions/578)
/// that proposes to broaden the class of transactions for which the network automatically collects
/// royalties. If this interests or concerns you, please add your voice to that discussion.
public struct Proto_RoyaltyFee: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// The fraction of fungible value exchanged for an NFT to collect as royalty
  public var exchangeValueFraction: Proto_Fraction {
    get {return _exchangeValueFraction ?? Proto_Fraction()}
    set {_exchangeValueFraction = newValue}
  }
  /// Returns true if `exchangeValueFraction` has been explicitly set.
  public var hasExchangeValueFraction: Bool {return self._exchangeValueFraction != nil}
  /// Clears the value of `exchangeValueFraction`. Subsequent reads from it will return its default value.
  public mutating func clearExchangeValueFraction() {self._exchangeValueFraction = nil}

  ///*
  /// If present, the fixed fee to assess to the NFT receiver when no fungible value is exchanged
  /// with the sender
  public var fallbackFee: Proto_FixedFee {
    get {return _fallbackFee ?? Proto_FixedFee()}
    set {_fallbackFee = newValue}
  }
  /// Returns true if `fallbackFee` has been explicitly set.
  public var hasFallbackFee: Bool {return self._fallbackFee != nil}
  /// Clears the value of `fallbackFee`. Subsequent reads from it will return its default value.
  public mutating func clearFallbackFee() {self._fallbackFee = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _exchangeValueFraction: Proto_Fraction? = nil
  fileprivate var _fallbackFee: Proto_FixedFee? = nil
}

///*
/// A transfer fee to assess during a CryptoTransfer that transfers units of the token to which the
/// fee is attached. A custom fee may be either fixed or fractional, and must specify a fee collector
/// account to receive the assessed fees. Only positive fees may be assessed.
public struct Proto_CustomFee: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var fee: Proto_CustomFee.OneOf_Fee? = nil

  ///*
  /// Fixed fee to be charged
  public var fixedFee: Proto_FixedFee {
    get {
      if case .fixedFee(let v)? = fee {return v}
      return Proto_FixedFee()
    }
    set {fee = .fixedFee(newValue)}
  }

  ///*
  /// Fractional fee to be charged
  public var fractionalFee: Proto_FractionalFee {
    get {
      if case .fractionalFee(let v)? = fee {return v}
      return Proto_FractionalFee()
    }
    set {fee = .fractionalFee(newValue)}
  }

  ///*
  /// Royalty fee to be charged
  public var royaltyFee: Proto_RoyaltyFee {
    get {
      if case .royaltyFee(let v)? = fee {return v}
      return Proto_RoyaltyFee()
    }
    set {fee = .royaltyFee(newValue)}
  }

  ///*
  /// The account to receive the custom fee
  public var feeCollectorAccountID: Proto_AccountID {
    get {return _feeCollectorAccountID ?? Proto_AccountID()}
    set {_feeCollectorAccountID = newValue}
  }
  /// Returns true if `feeCollectorAccountID` has been explicitly set.
  public var hasFeeCollectorAccountID: Bool {return self._feeCollectorAccountID != nil}
  /// Clears the value of `feeCollectorAccountID`. Subsequent reads from it will return its default value.
  public mutating func clearFeeCollectorAccountID() {self._feeCollectorAccountID = nil}

  ///*
  /// If true, exempts all the token's fee collection accounts from this fee.
  /// (The token's treasury and the above fee_collector_account_id will always
  /// be exempt. Please see <a href="https://hips.hedera.com/hip/hip-573">HIP-573</a> 
  /// for details.)
  public var allCollectorsAreExempt: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Fee: Equatable, Sendable {
    ///*
    /// Fixed fee to be charged
    case fixedFee(Proto_FixedFee)
    ///*
    /// Fractional fee to be charged
    case fractionalFee(Proto_FractionalFee)
    ///*
    /// Royalty fee to be charged
    case royaltyFee(Proto_RoyaltyFee)

  }

  public init() {}

  fileprivate var _feeCollectorAccountID: Proto_AccountID? = nil
}

///*
/// A custom transfer fee that was assessed during handling of a CryptoTransfer.
public struct Proto_AssessedCustomFee: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// The number of units assessed for the fee
  public var amount: Int64 = 0

  ///*
  /// The denomination of the fee; taken as hbar if left unset
  public var tokenID: Proto_TokenID {
    get {return _tokenID ?? Proto_TokenID()}
    set {_tokenID = newValue}
  }
  /// Returns true if `tokenID` has been explicitly set.
  public var hasTokenID: Bool {return self._tokenID != nil}
  /// Clears the value of `tokenID`. Subsequent reads from it will return its default value.
  public mutating func clearTokenID() {self._tokenID = nil}

  ///*
  /// The account to receive the assessed fee
  public var feeCollectorAccountID: Proto_AccountID {
    get {return _feeCollectorAccountID ?? Proto_AccountID()}
    set {_feeCollectorAccountID = newValue}
  }
  /// Returns true if `feeCollectorAccountID` has been explicitly set.
  public var hasFeeCollectorAccountID: Bool {return self._feeCollectorAccountID != nil}
  /// Clears the value of `feeCollectorAccountID`. Subsequent reads from it will return its default value.
  public mutating func clearFeeCollectorAccountID() {self._feeCollectorAccountID = nil}

  ///*
  /// The account(s) whose final balances would have been higher in the absence of this assessed fee
  public var effectivePayerAccountID: [Proto_AccountID] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _tokenID: Proto_TokenID? = nil
  fileprivate var _feeCollectorAccountID: Proto_AccountID? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "proto"

extension Proto_FractionalFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FractionalFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fractional_amount"),
    2: .standard(proto: "minimum_amount"),
    3: .standard(proto: "maximum_amount"),
    4: .standard(proto: "net_of_transfers"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._fractionalAmount) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.minimumAmount) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.maximumAmount) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.netOfTransfers) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._fractionalAmount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if self.minimumAmount != 0 {
      try visitor.visitSingularInt64Field(value: self.minimumAmount, fieldNumber: 2)
    }
    if self.maximumAmount != 0 {
      try visitor.visitSingularInt64Field(value: self.maximumAmount, fieldNumber: 3)
    }
    if self.netOfTransfers != false {
      try visitor.visitSingularBoolField(value: self.netOfTransfers, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_FractionalFee, rhs: Proto_FractionalFee) -> Bool {
    if lhs._fractionalAmount != rhs._fractionalAmount {return false}
    if lhs.minimumAmount != rhs.minimumAmount {return false}
    if lhs.maximumAmount != rhs.maximumAmount {return false}
    if lhs.netOfTransfers != rhs.netOfTransfers {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_FixedFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FixedFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "denominating_token_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.amount) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._denominatingTokenID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.amount != 0 {
      try visitor.visitSingularInt64Field(value: self.amount, fieldNumber: 1)
    }
    try { if let v = self._denominatingTokenID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_FixedFee, rhs: Proto_FixedFee) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs._denominatingTokenID != rhs._denominatingTokenID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_RoyaltyFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RoyaltyFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "exchange_value_fraction"),
    2: .standard(proto: "fallback_fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._exchangeValueFraction) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._fallbackFee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._exchangeValueFraction {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._fallbackFee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_RoyaltyFee, rhs: Proto_RoyaltyFee) -> Bool {
    if lhs._exchangeValueFraction != rhs._exchangeValueFraction {return false}
    if lhs._fallbackFee != rhs._fallbackFee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_CustomFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CustomFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fixed_fee"),
    2: .standard(proto: "fractional_fee"),
    4: .standard(proto: "royalty_fee"),
    3: .standard(proto: "fee_collector_account_id"),
    5: .standard(proto: "all_collectors_are_exempt"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Proto_FixedFee?
        var hadOneofValue = false
        if let current = self.fee {
          hadOneofValue = true
          if case .fixedFee(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.fee = .fixedFee(v)
        }
      }()
      case 2: try {
        var v: Proto_FractionalFee?
        var hadOneofValue = false
        if let current = self.fee {
          hadOneofValue = true
          if case .fractionalFee(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.fee = .fractionalFee(v)
        }
      }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._feeCollectorAccountID) }()
      case 4: try {
        var v: Proto_RoyaltyFee?
        var hadOneofValue = false
        if let current = self.fee {
          hadOneofValue = true
          if case .royaltyFee(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.fee = .royaltyFee(v)
        }
      }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.allCollectorsAreExempt) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.fee {
    case .fixedFee?: try {
      guard case .fixedFee(let v)? = self.fee else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .fractionalFee?: try {
      guard case .fractionalFee(let v)? = self.fee else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    default: break
    }
    try { if let v = self._feeCollectorAccountID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if case .royaltyFee(let v)? = self.fee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    if self.allCollectorsAreExempt != false {
      try visitor.visitSingularBoolField(value: self.allCollectorsAreExempt, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_CustomFee, rhs: Proto_CustomFee) -> Bool {
    if lhs.fee != rhs.fee {return false}
    if lhs._feeCollectorAccountID != rhs._feeCollectorAccountID {return false}
    if lhs.allCollectorsAreExempt != rhs.allCollectorsAreExempt {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_AssessedCustomFee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AssessedCustomFee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "token_id"),
    3: .standard(proto: "fee_collector_account_id"),
    4: .standard(proto: "effective_payer_account_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.amount) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._tokenID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._feeCollectorAccountID) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.effectivePayerAccountID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.amount != 0 {
      try visitor.visitSingularInt64Field(value: self.amount, fieldNumber: 1)
    }
    try { if let v = self._tokenID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._feeCollectorAccountID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if !self.effectivePayerAccountID.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.effectivePayerAccountID, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_AssessedCustomFee, rhs: Proto_AssessedCustomFee) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs._tokenID != rhs._tokenID {return false}
    if lhs._feeCollectorAccountID != rhs._feeCollectorAccountID {return false}
    if lhs.effectivePayerAccountID != rhs.effectivePayerAccountID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
