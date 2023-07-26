//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: freeze_service.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


///*
/// The request and responses for freeze service.
///
/// Usage: instantiate `Proto_FreezeServiceClient`, then call methods of this protocol to make API calls.
public protocol Proto_FreezeServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? { get }

  func freeze(
    _ request: Proto_Transaction,
    callOptions: CallOptions?
  ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse>
}

extension Proto_FreezeServiceClientProtocol {
  public var serviceName: String {
    return "proto.FreezeService"
  }

  ///*
  /// Freezes the nodes by submitting the transaction. The grpc server returns the
  /// TransactionResponse
  ///
  /// - Parameters:
  ///   - request: Request to send to freeze.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func freeze(
    _ request: Proto_Transaction,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse> {
    return self.makeUnaryCall(
      path: Proto_FreezeServiceClientMetadata.Methods.freeze.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makefreezeInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Proto_FreezeServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Proto_FreezeServiceNIOClient")
public final class Proto_FreezeServiceClient: Proto_FreezeServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the proto.FreezeService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct Proto_FreezeServiceNIOClient: Proto_FreezeServiceClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the proto.FreezeService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

///*
/// The request and responses for freeze service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Proto_FreezeServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? { get }

  func makeFreezeCall(
    _ request: Proto_Transaction,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Proto_FreezeServiceAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Proto_FreezeServiceClientMetadata.serviceDescriptor
  }

  public var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makeFreezeCall(
    _ request: Proto_Transaction,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse> {
    return self.makeAsyncUnaryCall(
      path: Proto_FreezeServiceClientMetadata.Methods.freeze.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makefreezeInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Proto_FreezeServiceAsyncClientProtocol {
  public func freeze(
    _ request: Proto_Transaction,
    callOptions: CallOptions? = nil
  ) async throws -> Proto_TransactionResponse {
    return try await self.performAsyncUnaryCall(
      path: Proto_FreezeServiceClientMetadata.Methods.freeze.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makefreezeInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Proto_FreezeServiceAsyncClient: Proto_FreezeServiceAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Proto_FreezeServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

public protocol Proto_FreezeServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'freeze'.
  func makefreezeInterceptors() -> [ClientInterceptor<Proto_Transaction, Proto_TransactionResponse>]
}

public enum Proto_FreezeServiceClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "FreezeService",
    fullName: "proto.FreezeService",
    methods: [
      Proto_FreezeServiceClientMetadata.Methods.freeze,
    ]
  )

  public enum Methods {
    public static let freeze = GRPCMethodDescriptor(
      name: "freeze",
      path: "/proto.FreezeService/freeze",
      type: GRPCCallType.unary
    )
  }
}

