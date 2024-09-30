// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: file_get_info.proto
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
/// Get all of the information about a file, except for its contents. When a file expires, it no
/// longer exists, and there will be no info about it, and the fileInfo field will be blank. If a
/// transaction or smart contract deletes the file, but it has not yet expired, then the fileInfo
/// field will be non-empty, the deleted field will be true, its size will be 0, and its contents
/// will be empty.
public struct Proto_FileGetInfoQuery: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// Standard info sent from client to node, including the signed payment, and what kind of
  /// response is requested (cost, state proof, both, or neither).
  public var header: Proto_QueryHeader {
    get {return _header ?? Proto_QueryHeader()}
    set {_header = newValue}
  }
  /// Returns true if `header` has been explicitly set.
  public var hasHeader: Bool {return self._header != nil}
  /// Clears the value of `header`. Subsequent reads from it will return its default value.
  public mutating func clearHeader() {self._header = nil}

  ///*
  /// The file ID of the file for which information is requested
  public var fileID: Proto_FileID {
    get {return _fileID ?? Proto_FileID()}
    set {_fileID = newValue}
  }
  /// Returns true if `fileID` has been explicitly set.
  public var hasFileID: Bool {return self._fileID != nil}
  /// Clears the value of `fileID`. Subsequent reads from it will return its default value.
  public mutating func clearFileID() {self._fileID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _header: Proto_QueryHeader? = nil
  fileprivate var _fileID: Proto_FileID? = nil
}

///*
/// Response when the client sends the node FileGetInfoQuery
public struct Proto_FileGetInfoResponse: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// Standard response from node to client, including the requested fields: cost, or state proof,
  /// or both, or neither
  public var header: Proto_ResponseHeader {
    get {return _header ?? Proto_ResponseHeader()}
    set {_header = newValue}
  }
  /// Returns true if `header` has been explicitly set.
  public var hasHeader: Bool {return self._header != nil}
  /// Clears the value of `header`. Subsequent reads from it will return its default value.
  public mutating func clearHeader() {self._header = nil}

  ///*
  /// The information about the file
  public var fileInfo: Proto_FileGetInfoResponse.FileInfo {
    get {return _fileInfo ?? Proto_FileGetInfoResponse.FileInfo()}
    set {_fileInfo = newValue}
  }
  /// Returns true if `fileInfo` has been explicitly set.
  public var hasFileInfo: Bool {return self._fileInfo != nil}
  /// Clears the value of `fileInfo`. Subsequent reads from it will return its default value.
  public mutating func clearFileInfo() {self._fileInfo = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public struct FileInfo: @unchecked Sendable {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    ///*
    /// The file ID of the file for which information is requested
    public var fileID: Proto_FileID {
      get {return _fileID ?? Proto_FileID()}
      set {_fileID = newValue}
    }
    /// Returns true if `fileID` has been explicitly set.
    public var hasFileID: Bool {return self._fileID != nil}
    /// Clears the value of `fileID`. Subsequent reads from it will return its default value.
    public mutating func clearFileID() {self._fileID = nil}

    ///*
    /// Number of bytes in contents
    public var size: Int64 = 0

    ///*
    /// The current time at which this account is set to expire
    public var expirationTime: Proto_Timestamp {
      get {return _expirationTime ?? Proto_Timestamp()}
      set {_expirationTime = newValue}
    }
    /// Returns true if `expirationTime` has been explicitly set.
    public var hasExpirationTime: Bool {return self._expirationTime != nil}
    /// Clears the value of `expirationTime`. Subsequent reads from it will return its default value.
    public mutating func clearExpirationTime() {self._expirationTime = nil}

    ///*
    /// True if deleted but not yet expired
    public var deleted: Bool = false

    ///*
    /// One of these keys must sign in order to modify or delete the file
    public var keys: Proto_KeyList {
      get {return _keys ?? Proto_KeyList()}
      set {_keys = newValue}
    }
    /// Returns true if `keys` has been explicitly set.
    public var hasKeys: Bool {return self._keys != nil}
    /// Clears the value of `keys`. Subsequent reads from it will return its default value.
    public mutating func clearKeys() {self._keys = nil}

    ///*
    /// The memo associated with the file
    public var memo: String = String()

    ///*
    /// The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. 
    public var ledgerID: Data = Data()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    fileprivate var _fileID: Proto_FileID? = nil
    fileprivate var _expirationTime: Proto_Timestamp? = nil
    fileprivate var _keys: Proto_KeyList? = nil
  }

  public init() {}

  fileprivate var _header: Proto_ResponseHeader? = nil
  fileprivate var _fileInfo: Proto_FileGetInfoResponse.FileInfo? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "proto"

extension Proto_FileGetInfoQuery: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FileGetInfoQuery"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "header"),
    2: .same(proto: "fileID"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._header) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._fileID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._header {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._fileID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_FileGetInfoQuery, rhs: Proto_FileGetInfoQuery) -> Bool {
    if lhs._header != rhs._header {return false}
    if lhs._fileID != rhs._fileID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_FileGetInfoResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FileGetInfoResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "header"),
    2: .same(proto: "fileInfo"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._header) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._fileInfo) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._header {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._fileInfo {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_FileGetInfoResponse, rhs: Proto_FileGetInfoResponse) -> Bool {
    if lhs._header != rhs._header {return false}
    if lhs._fileInfo != rhs._fileInfo {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_FileGetInfoResponse.FileInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Proto_FileGetInfoResponse.protoMessageName + ".FileInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fileID"),
    2: .same(proto: "size"),
    3: .same(proto: "expirationTime"),
    4: .same(proto: "deleted"),
    5: .same(proto: "keys"),
    6: .same(proto: "memo"),
    7: .standard(proto: "ledger_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._fileID) }()
      case 2: try { try decoder.decodeSingularInt64Field(value: &self.size) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._expirationTime) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.deleted) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._keys) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.memo) }()
      case 7: try { try decoder.decodeSingularBytesField(value: &self.ledgerID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._fileID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if self.size != 0 {
      try visitor.visitSingularInt64Field(value: self.size, fieldNumber: 2)
    }
    try { if let v = self._expirationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if self.deleted != false {
      try visitor.visitSingularBoolField(value: self.deleted, fieldNumber: 4)
    }
    try { if let v = self._keys {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    if !self.memo.isEmpty {
      try visitor.visitSingularStringField(value: self.memo, fieldNumber: 6)
    }
    if !self.ledgerID.isEmpty {
      try visitor.visitSingularBytesField(value: self.ledgerID, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Proto_FileGetInfoResponse.FileInfo, rhs: Proto_FileGetInfoResponse.FileInfo) -> Bool {
    if lhs._fileID != rhs._fileID {return false}
    if lhs.size != rhs.size {return false}
    if lhs._expirationTime != rhs._expirationTime {return false}
    if lhs.deleted != rhs.deleted {return false}
    if lhs._keys != rhs._keys {return false}
    if lhs.memo != rhs.memo {return false}
    if lhs.ledgerID != rhs.ledgerID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
