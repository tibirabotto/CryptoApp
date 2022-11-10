//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-10.
//

import Foundation

//JSON data:
/*
 URL : https://api.coingecko.com/api/v3/global
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13230,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 606,
     "total_market_cap": {
       "btc": 52628476.38133006,
       "eth": 701746080.4193695,
       "ltc": 15540472544.617012,
       "bch": 9104393330.997189,
       "bnb": 3023308337.3088775,
       "eos": 987985999090.1226,
       "xrp": 2372220698065.4277,
       "xlm": 9308406676290.61,
       "link": 127550378403.32251,
       "dot": 152693325726.44656,
       "yfi": 138636565.03625375,
       "usd": 936874244723.595,
       "aed": 3441129732127.321,
       "ars": 150249989061028.72,
       "aud": 1424636272131.308,
       "bdt": 95494631468575.1,
       "bhd": 353076985986.2477,
       "bmd": 936874244723.595,
       "brl": 4991936732544.045,
       "cad": 1250639987401.2434,
       "chf": 906044523952.476,
       "clp": 831503998419531.1,
       "cny": 6732003572885.86,
       "czk": 22374995647658.49,
       "dkk": 6852893141053.772,
       "eur": 921216265471.5295,
       "gbp": 802939639572.1543,
       "hkd": 7350870845225.94,
       "huf": 368350003611155.75,
       "idr": 14590692112476340,
       "ils": 3282597493680.66,
       "inr": 75635313679112.34,
       "jpy": 132711515824953.81,
       "krw": 1267835899127854.8,
       "kwd": 288992913898.66394,
       "lkr": 345087206254838.1,
       "mmk": 1966589096711604.2,
       "mxn": 18146954320537.734,
       "myr": 4403777387323.265,
       "ngn": 412814898452558.3,
       "nok": 9511271936708.51,
       "nzd": 1560984265337.157,
       "php": 53740979488960.58,
       "pkr": 207426956716261.34,
       "pln": 4319027743145.566,
       "rub": 56891684763343.14,
       "sar": 3521851753926.95,
       "sek": 9972304005039.979,
       "sgd": 1299407102461.8389,
       "thb": 33924216401441.41,
       "try": 17364650273079.889,
       "twd": 29507322774691.996,
       "uah": 34586830079764.62,
       "vef": 93809218124.1737,
       "vnd": 23296637056356656,
       "zar": 16318197342944.91,
       "xdr": 697026006206.1538,
       "xag": 43070516796.752655,
       "xau": 535985755.40636665,
       "bits": 52628476381330.055,
       "sats": 5262847638133006
     },
     "total_volume": {
       "btc": 12341649.697283493,
       "eth": 164563082.50736234,
       "ltc": 3644321125.4345613,
       "bch": 2135027287.951512,
       "bnb": 708981429.6653173,
       "eos": 231687822733.8639,
       "xrp": 556298013418.3568,
       "xlm": 2182869471771.1362,
       "link": 29911222920.529026,
       "dot": 35807374007.45902,
       "yfi": 32510990.979763243,
       "usd": 219701852187.52557,
       "aed": 806962706066.2604,
       "ars": 35234398932166.65,
       "aud": 334084568386.3609,
       "bdt": 22393984599075.965,
       "bhd": 82798377928.35635,
       "bmd": 219701852187.52557,
       "brl": 1170634962290.4197,
       "cad": 293281540398.094,
       "chf": 212472123337.59073,
       "clp": 194991984871994.3,
       "cny": 1578689629078.6829,
       "czk": 5247052114159.36,
       "dkk": 1607038857575.7012,
       "eur": 216029975131.91547,
       "gbp": 188293495100.64905,
       "hkd": 1723817202770.7864,
       "huf": 86379979492902.5,
       "idr": 3421592705598089.5,
       "ils": 769786076850.2,
       "inr": 17736871943777.29,
       "jpy": 31121536318845.664,
       "krw": 297314070567075.56,
       "kwd": 67770331835.02512,
       "lkr": 80924733289871.36,
       "mmk": 461175306582158.7,
       "mxn": 4255554572279.673,
       "myr": 1032708556207.4655,
       "ngn": 96807227129389.55,
       "nok": 2230442423754.1064,
       "nzd": 366058877444.4726,
       "php": 12602537425478.982,
       "pkr": 48642693339947.02,
       "pln": 1012834326658.5814,
       "rub": 13341394095280.04,
       "sar": 825892437352.5898,
       "sek": 2338556826408.1714,
       "sgd": 304717680910.01086,
       "thb": 7955404067710.31,
       "try": 4072100230175.313,
       "twd": 6919619685572.214,
       "uah": 8110790399688.459,
       "vef": 21998746459.536972,
       "vnd": 5463181787575078,
       "zar": 3826701609952.2246,
       "xdr": 163456200710.84973,
       "xag": 10100258778.820686,
       "xau": 125691429.63648291,
       "bits": 12341649697283.494,
       "sats": 1234164969728349.2
     },
     "market_cap_percentage": {
       "btc": 36.48914488965237,
       "eth": 17.131235980651002,
       "usdt": 7.516749828832587,
       "bnb": 5.3732067112230295,
       "usdc": 4.677418820326908,
       "busd": 2.472637868650132,
       "xrp": 2.106663447856763,
       "ada": 1.416730521034961,
       "doge": 1.3701257033803749,
       "matic": 1.0568083911824104
     },
     "market_cap_change_percentage_24h_usd": 2.378215760990275,
     "updated_at": 1668093336
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {

    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
                                           
}
