function buy_fee_profit () {
  const item_price = document.getElementById("item-price")
  item_price.addEventListener("input", () =>{
    input_price = item_price.value
    fee    = input_price * 0.1
    profit = input_price * 0.9
  
  const output_fee = document.getElementById("add-tax-price")
    output_fee.innerHTML = fee

  const output_profit = document.getElementById("profit")
    output_profit.innerHTML = profit

  });


}

window.addEventListener('load' , buy_fee_profit)