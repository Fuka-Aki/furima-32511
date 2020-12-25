window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price')

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value
    const commission = document.getElementById('add-tax-price')
    const profit = document.getElementById('profit')
    commission.innerHTML = Math.floor(inputValue/10)
    profit.innerHTML = inputValue - Math.floor(inputValue/10)
  })
});