const pay = () => {
  Payjp.setPublicKey("pk_test_92770639671b3326f9a18f32");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("order_sold[number]"),
      exp_month: formData.get("order_sold[exp_month]"),
      exp_year: `20${formData.get("order_sold[exp_year]")}`,
      cvc: formData.get("order_sold[cvc]"),
    };
    debugger
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("postal-code").removeAttribute("name");
        document.getElementById("prefecture").removeAttribute("name");
        document.getElementById("city").removeAttribute("name");
        document.getElementById("addresses").removeAttribute("name");
        document.getElementById("building").removeAttribute("name");
        document.getElementById("phone-number").removeAttribute("name");

        document.getElementById("charge-form").submit();

      }
    });
  });
};

window.addEventListener('load', pay)