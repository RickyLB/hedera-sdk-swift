/*
 * ‌
 * Hedera Swift SDK
 * ​
 * Copyright (C) 2023 - 2023 Hedera Hashgraph, LLC
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

extension Network {
    internal struct Config {
        internal let map: [AccountId: Int]
        internal let nodes: [AccountId]
        internal let addresses: [Set<String>]
    }
}

extension Network.Config: ExpressibleByDictionaryLiteral {
    internal init(dictionaryLiteral elements: (AccountId, Set<String>)...) {
        var map: [AccountId: Int] = [:]
        var nodes: [AccountId] = []
        var addresses: [Set<String>] = []
        for (index, (key, value)) in elements.enumerated() {
            map[key] = index
            nodes.append(key)
            addresses.append(value)
        }

        self.init(map: map, nodes: nodes, addresses: addresses)
    }
}

extension Network.Config {
    internal static let mainnet: Self = [
        3: [
            "35.237.200.180",
            "34.239.82.6",
            "13.82.40.153",
            "13.124.142.126",
            "15.164.44.66",
            "15.165.118.251",
        ],

        4: [
            "35.186.191.247", "3.130.52.236",
            "137.116.36.18",
        ],

        5: [
            "35.192.2.25",
            "3.18.18.254",
            "104.43.194.202",
            "23.111.186.250",
            "74.50.117.35",
            "107.155.64.98",
        ],

        6: [
            "35.199.161.108",
            "13.52.108.243",
            "13.64.151.232",
            "13.235.15.32",
            "104.211.205.124",
            "13.71.90.154",
        ],

        7: [
            "35.203.82.240", "3.114.54.4",
            "23.102.74.34",
        ],
        8: [
            "35.236.5.219", "35.183.66.150",
            "23.96.185.18",
        ],
        9: [
            "35.197.192.225", "35.181.158.250",
            "23.97.237.125", "31.214.8.131",
        ],
        10: [
            "35.242.233.154", "3.248.27.48",
            "65.52.68.254", "179.190.33.184",
        ],

        11: [
            "35.240.118.96",
            "13.53.119.185",
            "23.97.247.27",
            "69.87.222.61",
            "96.126.72.172",
            "69.87.221.231",
        ],

        12: [
            "35.204.86.32", "35.177.162.180",
            "51.140.102.228",
        ],
        13: [
            "35.234.132.107", "34.215.192.104",
            "13.77.158.252",
        ],
        14: [
            "35.236.2.27", "52.8.21.141",
            "40.114.107.85",
        ],
        15: [
            "35.228.11.53", "3.121.238.26",
            "40.89.139.247",
        ],
        16: [
            "34.91.181.183", "18.157.223.230",
            "13.69.120.73",
        ],

        17: [
            "34.86.212.247",
            "18.232.251.19",
            "40.114.92.39",
            "34.86.212.247",
            "18.232.251.19",
            "40.114.92.39",
        ],

        18: [
            "172.105.247.67", "172.104.150.132",
            "139.162.156.222",
        ],
        19: [
            "34.89.87.138", "18.168.4.59",
            "51.140.43.81", "13.246.51.42",
            "13.244.166.210",
        ],
        20: ["34.82.78.255", "13.77.151.212"],
        21: ["34.76.140.109", "13.36.123.209"],
        22: ["34.64.141.166", "52.78.202.34"],
        23: ["35.232.244.145", "3.18.91.176"],
        24: ["34.89.103.38", "18.135.7.211"],
        25: ["34.93.112.7", "13.232.240.207"],
        26: ["34.87.150.174", "13.228.103.14"],
        27: ["34.125.200.96", "13.56.4.96"],
        28: ["35.198.220.75", "18.139.47.5"],
    ]

    internal static let testnet: Self = [
        3: ["0.testnet.hedera.com", "34.94.106.61", "50.18.132.211"],
        4: ["1.testnet.hedera.com", "35.237.119.55", "3.212.6.13"],
        5: ["2.testnet.hedera.com", "35.245.27.193", "52.20.18.86"],
        6: ["3.testnet.hedera.com", "34.83.112.116", "54.70.192.33"],
        7: ["4.testnet.hedera.com", "34.94.160.4", "54.176.199.109"],
        8: ["5.testnet.hedera.com", "34.106.102.218", "35.155.49.147"],
        9: ["6.testnet.hedera.com", "34.133.197.230", "52.14.252.207"],
    ]

    internal static let previewnet: Self = [
        3: ["0.previewnet.hedera.com", "35.231.208.148", "3.211.248.172", "40.121.64.48"],
        4: ["1.previewnet.hedera.com", "35.199.15.177", "3.133.213.146", "40.70.11.202"],
        5: ["2.previewnet.hedera.com", "35.225.201.195", "52.15.105.130", "104.43.248.63"],
        6: ["3.previewnet.hedera.com", "35.247.109.135", "54.241.38.1", "13.88.22.47"],
        7: ["4.previewnet.hedera.com", "35.235.65.51", "54.177.51.127", "13.64.170.40"],
        8: ["5.previewnet.hedera.com", "34.106.247.65", "35.83.89.171", "13.78.232.192"],
        9: ["6.previewnet.hedera.com", "34.125.23.49", "50.18.17.93", "20.150.136.89"],
    ]
}
