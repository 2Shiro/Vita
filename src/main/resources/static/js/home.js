document.addEventListener("DOMContentLoaded", function() {
	 fetch('/home/allproducts')
     .then(response => response.json())
     .then(data => {
         console.log("데이터가 옴");
         console.log(data);
         const allProductsEl = document.getElementById('allProducts');
         allProductsEl.innerHTML = '';  // 기존 내용을 비웁니다.

         data.forEach((product, index) => {
             const nutrientStr = product.nutrient.map(nutrient => `<p class="type">#${nutrient}</p>`).join('');
             const productHtml = `
                 <a href="#" class="product">
                     <div class="ranking_list">
                         <div class="ranking">${index + 1}위</div>
                     </div>
                     <img src="/img/${product.img}.jpg" alt="Product ${index + 1}">
                     <div class="product_util">
                         <div class="txt1">${product.make_name}</div>
                         <div class="txt2">${product.name}</div>
                         <div class="review">
                             <span class="star-point">${product.string_average_arting}</span>
                             <span class="txt3">(${product.total_sell}개)</span>
                         </div>
                         <div class="type_list">
                             ${nutrientStr}
                         </div>
                     </div>
                 </a>
             `;
             allProductsEl.innerHTML += productHtml;
         });
     })
     .catch(error => {
         console.error('Error fetching products:', error);
     });

 });
 /* -------------------------------------------------------------- */

 
