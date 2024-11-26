function post (){

  const form = document.getElementById("item-price")
  form.addEventListener("keyup", () => {

    const input_price = form.value;
    const tax_price = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    
    let p1 = parseInt(input_price / 10);
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
 
 window.addEventListener('turbo:load', post);