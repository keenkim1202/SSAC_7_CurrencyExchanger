//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by KEEN on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {

  // MARK: Properties
  var exchangeRate = ExchangeRate(currencyRate: 1100, USD: 1)
  
  // MARK: UI
  @IBOutlet weak var wonTextField: UITextField!
  @IBOutlet weak var dollarTextField: UITextField!
  @IBOutlet weak var currencyRateTextField: UITextField!
  @IBOutlet weak var cardView: UIView!
  
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    cardView.layer.cornerRadius = CGFloat(8)
    currencyRateTextField.text = "\(exchangeRate.currencyRate)"
    dollarTextField.text = "\(exchangeRate.USD)"
  }
  
  // MARK: Alert
  func showAlert(_ message: String) {
    let alert = UIAlertController(title: "⚠️ 환산 불가 ⚠️", message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default)
    alert.addAction(ok)
    
    present(alert, animated: true, completion: nil)
  }
  
  func isDouble(_ str: String) -> Bool {
    return Double(str) == nil ? false : true
  }
  
  // MARK: Actions
  @IBAction func toDollar(_ sender: UIButton) {
    guard let wonText = wonTextField.text else {
      showAlert("환율과 KRW를 모두 채웠는지\n다시 확인해주세요.")
      return
    }
    guard let currencyText = currencyRateTextField.text else {
      showAlert("환율과 KRW를 모두 채웠는지\n다시 확인해주세요.")
      return
    }
  
    // TODO: if let으로 리팩토링
    if let currency = Double(currencyText), let won = Double(wonText) {
      exchangeRate.currencyRate = currency
      exchangeRate.KRW = won
    } else {
      showAlert("숫자만 적어주세요!")
    }
    
//    dollarTextField.text = "\(exchangeRate.USD * 100)" // 전체 출력
    dollarTextField.text = "\(round(exchangeRate.USD * 100) / 100)" // 소수점 2자리까지만
  }
  
  @IBAction func toWon(_ sender: UIButton) {
    guard let dollarText = dollarTextField.text else {
      showAlert("환율과 KRW를 모두 채웠는지\n다시 확인해주세요.")
      return
    }
    guard let currencyText = currencyRateTextField.text else {
      showAlert("환율과 KRW를 모두 채웠는지\n다시 확인해주세요.")
      return
    }
    
    if let currency = Double(currencyText), let dollar = Double(dollarText) {
      exchangeRate.currencyRate = currency
      exchangeRate.USD = dollar
    } else {
      showAlert("숫자만 적어주세요.")
    }
    
//    wonTextField.text = "\(exchangeRate.KRW)" // 전체 출력
    wonTextField.text = "\(round(exchangeRate.KRW * 100) / 100)" // 소수점 2자리까지 출력
  }
  
}
