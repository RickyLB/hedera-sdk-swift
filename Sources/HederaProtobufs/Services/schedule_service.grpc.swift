//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: schedule_service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf

///*
/// Transactions and queries for the Schedule Service
///
/// The Schedule Service allows transactions to be submitted without all the required signatures and
/// allows anyone to provide the required signatures independently after a transaction has already
/// been created. The transactions can be executed immediately when all required signatures are received
/// or at a future date if Long Term Scheduled Transactions are enabled.
///
/// Execution:
///
/// Scheduled Transactions are executed in two different modes.
///
/// 1. If Long Term Scheduled Transactions are enabled and <tt>wait_for_expiry</tt> was set to <tt>true</tt> on the
///    <tt>ScheduleCreate</tt>, then the transaction will be executed at the <tt>expiration_time</tt> specified on the
///    <tt>ScheduleCreate</tt>.
///
/// 2. Otherwise Scheduled Transactions are executed once all required signatures are collected and witnessed.
///    Every time new signature is provided, a check is performed on the "readiness" of the execution.
///    The Scheduled Transaction will be executed immediately after the transaction that triggered it.
///
/// NOTICE:
/// A Scheduled Transaction being ready to execute, or even not ready to execute, at the time a <tt>ScheduleCreate</tt> or
/// <tt>ScheduleSign</tt> comes in does not guarantee it will stay that way. Any number of things can happen over time that
/// impact the transaction.
///
/// For example, account keys can change, accounts can be deleted, and account balances can change.
///
/// A particularly noteworthy case is if Long Term Scheduled Transactions are enabled and signature requirements for a Scheduled
/// Transaction change such that existing signatures become sufficient to allow the transaction to go through. In this case the transaction
/// will execute at expiration_time unless a ScheduleSign comes in to push it through.
///
/// Transaction Record:
///
/// If a Scheduled Transaction is executed immediately following the transaction that provided all required signatures,
/// the timestamp of the Scheduled Transaction will be equal to consensusTimestamp + 1 nano, where
/// consensusTimestamp is the timestamp of the transaction that triggered the execution.
///
/// The Transaction ID of the Scheduled Transaction will have the scheduled property set to true and
/// inherit the <tt>transactionValidStart</tt> and <tt>accountID</tt> from the <tt>ScheduleCreate</tt> transaction.
///
/// The <tt>scheduleRef</tt> property of the transaction record will be populated with the <tt>ScheduleID</tt> of the
/// Scheduled Transaction.
///
/// Post execution:
///
/// After execution, a Scheduled Transaction will remain in state and can be queried using <tt>GetScheduleInfo</tt> until expiration.
///
/// Expiry:
///
/// The expiration time of a schedule is controlled by it's <tt>expiration_time</tt>. If Long Term Scheduled Transactions are disabled,
/// the <tt>expiration_time</tt> is always 30 minutes in the future.
///
/// Once a given Scheduled Transaction expires, it will be removed from the ledger and any upcoming
/// operation referring the ScheduleID will resolve to INVALID_SCHEDULE_ID.
///
/// Usage: instantiate `Proto_ScheduleServiceClient`, then call methods of this protocol to make API calls.
public protocol Proto_ScheduleServiceClientProtocol: GRPCClient {
    var serviceName: String { get }
    var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? { get }

    func createSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func signSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func deleteSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func getScheduleInfo(
        _ request: Proto_Query,
        callOptions: CallOptions?
    ) -> UnaryCall<Proto_Query, Proto_Response>
}

extension Proto_ScheduleServiceClientProtocol {
    public var serviceName: String {
        return "proto.ScheduleService"
    }

    ///*
    /// Creates a new Schedule by submitting the transaction
    ///
    /// - Parameters:
    ///   - request: Request to send to createSchedule.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    public func createSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.createSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makecreateScheduleInterceptors() ?? []
        )
    }

    ///*
    /// Signs a new Schedule by submitting the transaction
    ///
    /// - Parameters:
    ///   - request: Request to send to signSchedule.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    public func signSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.signSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makesignScheduleInterceptors() ?? []
        )
    }

    ///*
    /// Deletes a new Schedule by submitting the transaction
    ///
    /// - Parameters:
    ///   - request: Request to send to deleteSchedule.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    public func deleteSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.deleteSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makedeleteScheduleInterceptors() ?? []
        )
    }

    ///*
    /// Retrieves the metadata of a schedule entity
    ///
    /// - Parameters:
    ///   - request: Request to send to getScheduleInfo.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    public func getScheduleInfo(
        _ request: Proto_Query,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Proto_Query, Proto_Response> {
        return self.makeUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.getScheduleInfo.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makegetScheduleInfoInterceptors() ?? []
        )
    }
}

@available(*, deprecated)
extension Proto_ScheduleServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Proto_ScheduleServiceNIOClient")
public final class Proto_ScheduleServiceClient: Proto_ScheduleServiceClientProtocol {
    private let lock = Lock()
    private var _defaultCallOptions: CallOptions
    private var _interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol?
    public let channel: GRPCChannel
    public var defaultCallOptions: CallOptions {
        get { self.lock.withLock { return self._defaultCallOptions } }
        set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
    }
    public var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? {
        get { self.lock.withLock { return self._interceptors } }
        set { self.lock.withLockVoid { self._interceptors = newValue } }
    }

    /// Creates a client for the proto.ScheduleService service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    public init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self._defaultCallOptions = defaultCallOptions
        self._interceptors = interceptors
    }
}

public struct Proto_ScheduleServiceNIOClient: Proto_ScheduleServiceClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol?

    /// Creates a client for the proto.ScheduleService service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    public init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

///*
/// Transactions and queries for the Schedule Service
///
/// The Schedule Service allows transactions to be submitted without all the required signatures and
/// allows anyone to provide the required signatures independently after a transaction has already
/// been created. The transactions can be executed immediately when all required signatures are received
/// or at a future date if Long Term Scheduled Transactions are enabled.
///
/// Execution:
///
/// Scheduled Transactions are executed in two different modes.
///
/// 1. If Long Term Scheduled Transactions are enabled and <tt>wait_for_expiry</tt> was set to <tt>true</tt> on the
///    <tt>ScheduleCreate</tt>, then the transaction will be executed at the <tt>expiration_time</tt> specified on the
///    <tt>ScheduleCreate</tt>.
///
/// 2. Otherwise Scheduled Transactions are executed once all required signatures are collected and witnessed.
///    Every time new signature is provided, a check is performed on the "readiness" of the execution.
///    The Scheduled Transaction will be executed immediately after the transaction that triggered it.
///
/// NOTICE:
/// A Scheduled Transaction being ready to execute, or even not ready to execute, at the time a <tt>ScheduleCreate</tt> or
/// <tt>ScheduleSign</tt> comes in does not guarantee it will stay that way. Any number of things can happen over time that
/// impact the transaction.
///
/// For example, account keys can change, accounts can be deleted, and account balances can change.
///
/// A particularly noteworthy case is if Long Term Scheduled Transactions are enabled and signature requirements for a Scheduled
/// Transaction change such that existing signatures become sufficient to allow the transaction to go through. In this case the transaction
/// will execute at expiration_time unless a ScheduleSign comes in to push it through.
///
/// Transaction Record:
///
/// If a Scheduled Transaction is executed immediately following the transaction that provided all required signatures,
/// the timestamp of the Scheduled Transaction will be equal to consensusTimestamp + 1 nano, where
/// consensusTimestamp is the timestamp of the transaction that triggered the execution.
///
/// The Transaction ID of the Scheduled Transaction will have the scheduled property set to true and
/// inherit the <tt>transactionValidStart</tt> and <tt>accountID</tt> from the <tt>ScheduleCreate</tt> transaction.
///
/// The <tt>scheduleRef</tt> property of the transaction record will be populated with the <tt>ScheduleID</tt> of the
/// Scheduled Transaction.
///
/// Post execution:
///
/// After execution, a Scheduled Transaction will remain in state and can be queried using <tt>GetScheduleInfo</tt> until expiration.
///
/// Expiry:
///
/// The expiration time of a schedule is controlled by it's <tt>expiration_time</tt>. If Long Term Scheduled Transactions are disabled,
/// the <tt>expiration_time</tt> is always 30 minutes in the future.
///
/// Once a given Scheduled Transaction expires, it will be removed from the ledger and any upcoming
/// operation referring the ScheduleID will resolve to INVALID_SCHEDULE_ID.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Proto_ScheduleServiceAsyncClientProtocol: GRPCClient {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? { get }

    func makeCreateScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func makeSignScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func makeDeleteScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse>

    func makeGetScheduleInfoCall(
        _ request: Proto_Query,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Proto_Query, Proto_Response>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Proto_ScheduleServiceAsyncClientProtocol {
    public static var serviceDescriptor: GRPCServiceDescriptor {
        return Proto_ScheduleServiceClientMetadata.serviceDescriptor
    }

    public var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? {
        return nil
    }

    public func makeCreateScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.createSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makecreateScheduleInterceptors() ?? []
        )
    }

    public func makeSignScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.signSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makesignScheduleInterceptors() ?? []
        )
    }

    public func makeDeleteScheduleCall(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Proto_Transaction, Proto_TransactionResponse> {
        return self.makeAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.deleteSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makedeleteScheduleInterceptors() ?? []
        )
    }

    public func makeGetScheduleInfoCall(
        _ request: Proto_Query,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Proto_Query, Proto_Response> {
        return self.makeAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.getScheduleInfo.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makegetScheduleInfoInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Proto_ScheduleServiceAsyncClientProtocol {
    public func createSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) async throws -> Proto_TransactionResponse {
        return try await self.performAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.createSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makecreateScheduleInterceptors() ?? []
        )
    }

    public func signSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) async throws -> Proto_TransactionResponse {
        return try await self.performAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.signSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makesignScheduleInterceptors() ?? []
        )
    }

    public func deleteSchedule(
        _ request: Proto_Transaction,
        callOptions: CallOptions? = nil
    ) async throws -> Proto_TransactionResponse {
        return try await self.performAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.deleteSchedule.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makedeleteScheduleInterceptors() ?? []
        )
    }

    public func getScheduleInfo(
        _ request: Proto_Query,
        callOptions: CallOptions? = nil
    ) async throws -> Proto_Response {
        return try await self.performAsyncUnaryCall(
            path: Proto_ScheduleServiceClientMetadata.Methods.getScheduleInfo.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makegetScheduleInfoInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Proto_ScheduleServiceAsyncClient: Proto_ScheduleServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol?

    public init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Proto_ScheduleServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

public protocol Proto_ScheduleServiceClientInterceptorFactoryProtocol: Sendable {

    /// - Returns: Interceptors to use when invoking 'createSchedule'.
    func makecreateScheduleInterceptors() -> [ClientInterceptor<Proto_Transaction, Proto_TransactionResponse>]

    /// - Returns: Interceptors to use when invoking 'signSchedule'.
    func makesignScheduleInterceptors() -> [ClientInterceptor<Proto_Transaction, Proto_TransactionResponse>]

    /// - Returns: Interceptors to use when invoking 'deleteSchedule'.
    func makedeleteScheduleInterceptors() -> [ClientInterceptor<Proto_Transaction, Proto_TransactionResponse>]

    /// - Returns: Interceptors to use when invoking 'getScheduleInfo'.
    func makegetScheduleInfoInterceptors() -> [ClientInterceptor<Proto_Query, Proto_Response>]
}

public enum Proto_ScheduleServiceClientMetadata {
    public static let serviceDescriptor = GRPCServiceDescriptor(
        name: "ScheduleService",
        fullName: "proto.ScheduleService",
        methods: [
            Proto_ScheduleServiceClientMetadata.Methods.createSchedule,
            Proto_ScheduleServiceClientMetadata.Methods.signSchedule,
            Proto_ScheduleServiceClientMetadata.Methods.deleteSchedule,
            Proto_ScheduleServiceClientMetadata.Methods.getScheduleInfo,
        ]
    )

    public enum Methods {
        public static let createSchedule = GRPCMethodDescriptor(
            name: "createSchedule",
            path: "/proto.ScheduleService/createSchedule",
            type: GRPCCallType.unary
        )

        public static let signSchedule = GRPCMethodDescriptor(
            name: "signSchedule",
            path: "/proto.ScheduleService/signSchedule",
            type: GRPCCallType.unary
        )

        public static let deleteSchedule = GRPCMethodDescriptor(
            name: "deleteSchedule",
            path: "/proto.ScheduleService/deleteSchedule",
            type: GRPCCallType.unary
        )

        public static let getScheduleInfo = GRPCMethodDescriptor(
            name: "getScheduleInfo",
            path: "/proto.ScheduleService/getScheduleInfo",
            type: GRPCCallType.unary
        )
    }
}
