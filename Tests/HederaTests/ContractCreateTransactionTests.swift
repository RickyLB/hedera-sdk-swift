/*
 * ‌
 * Hedera Swift SDK
 * ​
 * Copyright (C) 2022 - 2023 Hedera Hashgraph, LLC
 * ​
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ‍
 */

import HederaProtobufs
import SnapshotTesting
import XCTest

@testable import Hedera

internal class ContractCreateTransactionTests: XCTestCase {
    internal static let unusedPrivateKey: PrivateKey =
        "302e020100300506032b657004220420db484b828e64b2d8f12ce3c0a0e93a0b8cce7af1bb8f39c97732394482538e10"

    private static func makeTransaction() throws -> ContractCreateTransaction {
        try ContractCreateTransaction()
            .nodeAccountIds(["0.0.5005", "0.0.5006"])
            .transactionId(
                TransactionId(
                    accountId: 5006,
                    validStart: Timestamp(seconds: 1_554_158_542, subSecondNanos: 0),
                    scheduled: false
                )
            )
            .bytecodeFileId(3003)
            .adminKey(.single(unusedPrivateKey.publicKey))
            .gas(0)
            .initialBalance(.fromTinybars(1000))
            .stakedAccountId("0.0.3")
            .maxAutomaticTokenAssociations(101)
            .autoRenewPeriod(.hours(10))
            .constructorParameters(Data([10, 11, 12, 13, 25]))
            .autoRenewAccountId("0.0.30")
            .maxTransactionFee(.fromTinybars(100_000))
            .freeze()
            .sign(unusedPrivateKey)
    }

    private static func makeTransaction2() throws -> ContractCreateTransaction {
        try ContractCreateTransaction()
            .nodeAccountIds(["0.0.5005", "0.0.5006"])
            .transactionId(
                TransactionId(
                    accountId: 5006,
                    validStart: Timestamp(seconds: 1_554_158_542, subSecondNanos: 0),
                    scheduled: false
                )
            )
            .bytecodeFileId(3003)
            .adminKey(.single(unusedPrivateKey.publicKey))
            .gas(0)
            .initialBalance(.fromTinybars(1000))
            .stakedNodeId(4)
            .maxAutomaticTokenAssociations(101)
            .autoRenewPeriod(.hours(10))
            .constructorParameters(Data([10, 11, 12, 13, 25]))
            .autoRenewAccountId("0.0.30")
            .maxTransactionFee(.fromTinybars(100_000))
            .freeze()
            .sign(unusedPrivateKey)
    }

    internal func testSerialize() throws {
        let tx = try Self.makeTransaction().makeProtoBody()

        assertSnapshot(matching: tx, as: .description)
    }

    internal func testToFromBytes() throws {
        let tx = try Self.makeTransaction()
        let tx2 = try Transaction.fromBytes(tx.toBytes())

        XCTAssertEqual(try tx.makeProtoBody(), try tx2.makeProtoBody())
    }

    internal func testSerialize2() throws {
        let tx = try Self.makeTransaction2().makeProtoBody()

        assertSnapshot(matching: tx, as: .description)
    }

    internal func testToFromBytes2() throws {
        let tx = try Self.makeTransaction2()
        let tx2 = try Transaction.fromBytes(tx.toBytes())

        XCTAssertEqual(try tx.makeProtoBody(), try tx2.makeProtoBody())
    }
}