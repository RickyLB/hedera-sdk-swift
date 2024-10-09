// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: state/blockstream/block_stream_info.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

///*
/// # Block Stream Info
/// Information stored in consensus state at the beginning of each block to
/// record the status of the immediately prior block.
///
/// ### Keywords
/// The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
/// "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
/// document are to be interpreted as described in
/// [RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
/// [RFC8174](https://www.ietf.org/rfc/rfc8174).

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
/// A message stored in state to maintain block stream parameters.<br/>
/// Nodes use this information for three purposes.
/// 1. To maintain hash chain continuity at restart and reconnect boundaries.
/// 1. To store historical hashes for implementation of the EVM `BLOCKHASH`
///    and `PREVRANDAO` opcodes.
/// 1. To track the amount of consensus time that has passed between blocks.
///
/// This value MUST be updated for every block.<br/>
/// This value MUST be transmitted in the "state changes" section of
/// _each_ block, but MUST be updated at the beginning of the _next_ block.<br/>
/// This value SHALL contain the block hash up to, and including, the
/// immediately prior completed block.
public struct Com_Hedera_Hapi_Node_State_Blockstream_BlockStreamInfo: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///*
  /// A block number.<br/>
  /// This is the current block number.
  public var blockNumber: UInt64 = 0

  ///*
  /// A consensus time for the current block.<br/>
  /// This is the _first_ consensus time in the current block, and
  /// is used to determine if this block was the first across an
  /// important boundary in consensus time, such as UTC midnight.
  /// This may also be used to purge entities expiring between the last
  /// block time and this time.
  public var blockTime: Proto_Timestamp {
    get {return _blockTime ?? Proto_Timestamp()}
    set {_blockTime = newValue}
  }
  /// Returns true if `blockTime` has been explicitly set.
  public var hasBlockTime: Bool {return self._blockTime != nil}
  /// Clears the value of `blockTime`. Subsequent reads from it will return its default value.
  public mutating func clearBlockTime() {self._blockTime = nil}

  ///*
  /// A concatenation of hash values.<br/>
  /// This combines several trailing output block item hashes and
  /// is used as a seed value for a pseudo-random number generator.<br/>
  /// This is also requiried to implement the EVM `PREVRANDAO` opcode.
  public var trailingOutputHashes: Data = Data()

  ///*
  /// A concatenation of hash values.<br/>
  /// This field combines up to 256 trailing block hashes.
  /// <p>
  /// If this message is for block number N, then the earliest available
  /// hash SHALL be for block number N-256.<br/>
  /// The latest available hash SHALL be for block N-1.<br/>
  /// This is REQUIRED to implement the EVM `BLOCKHASH` opcode.
  public var trailingBlockHashes: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _blockTime: Proto_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "com.hedera.hapi.node.state.blockstream"

extension Com_Hedera_Hapi_Node_State_Blockstream_BlockStreamInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BlockStreamInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "block_number"),
    2: .standard(proto: "block_time"),
    3: .standard(proto: "trailing_output_hashes"),
    4: .standard(proto: "trailing_block_hashes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.blockNumber) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._blockTime) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.trailingOutputHashes) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.trailingBlockHashes) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.blockNumber != 0 {
      try visitor.visitSingularUInt64Field(value: self.blockNumber, fieldNumber: 1)
    }
    try { if let v = self._blockTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.trailingOutputHashes.isEmpty {
      try visitor.visitSingularBytesField(value: self.trailingOutputHashes, fieldNumber: 3)
    }
    if !self.trailingBlockHashes.isEmpty {
      try visitor.visitSingularBytesField(value: self.trailingBlockHashes, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Com_Hedera_Hapi_Node_State_Blockstream_BlockStreamInfo, rhs: Com_Hedera_Hapi_Node_State_Blockstream_BlockStreamInfo) -> Bool {
    if lhs.blockNumber != rhs.blockNumber {return false}
    if lhs._blockTime != rhs._blockTime {return false}
    if lhs.trailingOutputHashes != rhs.trailingOutputHashes {return false}
    if lhs.trailingBlockHashes != rhs.trailingBlockHashes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}