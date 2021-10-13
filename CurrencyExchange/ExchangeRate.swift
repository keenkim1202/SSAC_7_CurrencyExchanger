//
//  ExchangeRate.swift
//  CurrencyExchange
//
//  Created by KEEN on 2021/10/13.
//

import Foundation

struct ExchangeRate {
  var currencyRate: Double {
    willSet {
      print("currencyRate willSet - 환율 변동 예정: \(currencyRate) -> \(newValue)")
    }
    didSet {
      print("currencyRate didSet - 환율 변동 완료: \(oldValue) -> \(currencyRate)")
    }
  }
  
  var USD: Double {
    willSet {
      print("USD willSet - 환전 금액: USD:\(newValue)달러로 환전될 예정")
    }
    didSet {
      print("USD didSet - KRW: \(KRW)원 -> \(round(USD * 100) / 100)달러로 환전되었음")
    }
  }
  
  var KRW: Double {
    get {
      return USD * currencyRate
    }
    set {
      USD = newValue / currencyRate
    }
  }
}
