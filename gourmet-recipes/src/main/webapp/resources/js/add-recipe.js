function generateIngredientFields() {
    var noOfIngredients = document.getElementById("noOfIngredients").value;
    var container = document.getElementById("ingredientsContainer");
    container.innerHTML = "";

    for (var i = 1; i <= noOfIngredients; i++) {
        var div = document.createElement("div");
        div.className = "mb-3";
        div.style.display = "flex";

        var div_inner = document.createElement("div");
        div_inner.className = "col-md-3";

        var div_inner2 = document.createElement("div");
        div_inner2.className = "col-md-8";
        div_inner2.style.marginLeft = "20px";

        var labelQty = document.createElement("label");
        labelQty.className = "form-label";
        labelQty.textContent = "Quantity";

        var inputQty = document.createElement("input");
        inputQty.type = "text";
        inputQty.className = "form-control";
        inputQty.name = "ingredients[" + (i - 1) + "].ingredientQuantity"; // Use array notation for list

        var labelName = document.createElement("label");
        labelName.className = "form-label";
        labelName.textContent = "Ingredient Name";

        var inputName = document.createElement("input");
        inputName.type = "text";
        inputName.className = "form-control";
        inputName.name = "ingredients[" + (i - 1) + "].ingredientName"; // Use array notation for list

        div_inner.appendChild(labelQty);
        div_inner.appendChild(inputQty);
        div_inner2.appendChild(labelName);
        div_inner2.appendChild(inputName);

        div.appendChild(div_inner);
        div.appendChild(div_inner2);

        container.appendChild(div);
    }
}

function generateStepFields() {
    var noOfSteps = document.getElementById("noOfSteps").value;
    var container = document.getElementById("stepsContainer");
    container.innerHTML = "";

    for (var i = 1; i <= noOfSteps; i++) {
        var div = document.createElement("div");
        div.className = "mb-3";
        div.style.display = "flex";

        var div_inner = document.createElement("div");
        div_inner.className = "col-md-3";

        var div_inner2 = document.createElement("div");
        div_inner2.className = "col-md-8";
        div_inner2.style.marginLeft = "20px";

        var labelStepNo = document.createElement("label");
        labelStepNo.className = "form-label";
        labelStepNo.textContent = "Step No";

        var inputStepNo = document.createElement("input");
        inputStepNo.type = "number";
        inputStepNo.className = "form-control";
        inputStepNo.value = i;
        inputStepNo.name = "recipeSteps[" + (i - 1) + "].stepNo";
        inputStepNo.readOnly = true;

        var labelStepDesc = document.createElement("label");
        labelStepDesc.className = "form-label";
        labelStepDesc.textContent = "Description";

        var inputStepDesc = document.createElement("input");
        inputStepDesc.type = "text";
        inputStepDesc.className = "form-control";
        inputStepDesc.name = "recipeSteps[" + (i - 1) + "].stepDescription"; // Use array notation for list

        div_inner.appendChild(labelStepNo);
        div_inner.appendChild(inputStepNo);
        div_inner2.appendChild(labelStepDesc);
        div_inner2.appendChild(inputStepDesc);

        div.appendChild(div_inner);
        div.appendChild(div_inner2);

        container.appendChild(div);
    }
}    

