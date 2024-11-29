const pay = () => {
  const payjp = Payjp('pk_test_adaeacc8a032853785ebc33a')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');  // payjp 専用の
  const expiryElement = elements.create('cardExpiry');  // フォームを生成
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');  // 既存の要素に
  expiryElement.mount('#expiry-form');  // 専用のフォームをマウントする
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {  // 送信ボタンが押されると…
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;  // PAY.JP にカード情報を送り、トークンを取得する
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
      // フォームの情報をサーバーサイドに送信
    });  
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);