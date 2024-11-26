function price (){

  const form = document.getElementById("item-price")
  form.addEventListener("input", () => {

    const input_price = form.value;
    const tax_price = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    
    let p1 = Math.floor(input_price / 10);
    let p2 = input_price - p1

    if (!isNaN(p1)){
      tax_price.innerHTML = p1;
      profit.innerHTML = p2;
    }
    else {
      tax_price.innerHTML = "";
      profit.innerHTML = "";
    };

  })
 };
 
 window.addEventListener('turbo:load', price);
 window.addEventListener('turbo:render', price);