function validateFName() {
  let nameEle = document.getElementById("firstName");
  let name = nameEle.value.trim();
  let nameErr = document.getElementById("fname-error");
  let isNameValid = false;
  const nameRegex = /^[a-zA-Z]+( [a-zA-Z]*)*$/;
  if (name === " " || name.length < 4) {
    nameErr.innerHTML = "Must be at least 4 characters";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else if (name === " " || name.length > 15) {
    nameErr.innerHTML = "Max 15 characters";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else if (!nameRegex.test(name)) {
    nameErr.innerHTML = "Must contain only alphabets";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else {
    nameErr.style.display = "none";
    nameEle.style.border = "2px solid green";
    isNameValid = true;
  }
  return isNameValid;
}

function validateLName() {
  let nameEle = document.getElementById("lastName");
  let name = nameEle.value.trim();
  let nameErr = document.getElementById("lname-error");
  let isNameValid = false;
  const nameRegex = /^[a-zA-Z]+( [a-zA-Z]*)*$/;
  if (name === " " || name.length < 1) {
    nameErr.innerHTML = "Must be at least 1 character";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else if (name === " " || name.length > 15) {
    nameErr.innerHTML = "Max 15 characters";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else if (!nameRegex.test(name)) {
    nameErr.innerHTML = "Must contain only alphabets";
    nameEle.style.border = "2px solid red";
    nameErr.style.display = "inline";
    isNameValid = false;
  } else {
    nameErr.style.display = "none";
    nameEle.style.border = "2px solid green";
    isNameValid = true;
  }
  return isNameValid;
}

function validateEmail() {
  let emailEle = document.getElementById("email");
  let email = emailEle.value.trim();
  let emailErr = document.getElementById("email-error");
  let isEmailValid = false;
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (email === " " || email.length < 1) {
    emailErr.innerHTML = "Email cannot be empty";
    emailEle.style.border = "2px solid red";
    emailErr.style.display = "inline";
    isEmailValid = false;
  } else if (!emailRegex.test(email)) {
    emailErr.innerHTML = "Must be abc@example.com format";
    emailEle.style.border = "2px solid red";
    emailErr.style.display = "inline";
    isEmailValid = false;
  } else {
    emailErr.style.display = "none";
    emailEle.style.border = "2px solid green";
    isEmailValid = true;
  }
  if (isEmailValid) {
    var isValid = checkEmail();
    if (isValid === true) {
      emailErr.innerHTML = "Email already exists";
      emailEle.style.border = "2px solid red";
      emailErr.style.display = "inline";
      isEmailValid = false;
    } else {
      emailErr.innerHTML = "Email valid";
      emailEle.style.border = "2px solid green";
      emailErr.style.display = "inline";
      isEmailValid = true;
    }
  }
  return isEmailValid;
}

function validateContactNo() {
  let contactEle = document.getElementById("contactNo");
  let contact = contactEle.value.trim();
  let contactErr = document.getElementById("contact-error");
  let iscontactValid = false;
  const contactRegex = /^\d{10}$/;
  if (contact === " ") {
    contactErr.innerHTML = "Contact Number cannot be empty";
    contactEle.style.border = "2px solid red";
    contactErr.style.display = "inline";
    iscontactValid = false;
  } else if (!contactRegex.test(contact)) {
    contactErr.innerHTML = "Should contaion only 10 digits";
    contactEle.style.border = "2px solid red";
    contactErr.style.display = "inline";
    iscontactValid = false;
  } else {
    contactErr.style.display = "none";
    contactEle.style.border = "2px solid green";
    iscontactValid = true;
  }
  if (iscontactValid) {
    let isValid = checkContactNo();
    if (isValid) {
      contactErr.innerHTML = "Contact Number already exists";
      contactEle.style.border = "2px solid red";
      contactErr.style.display = "inline";
      iscontactValid = false;
    } else {
      contactErr.innerHTML = "Contact Number valid";
      contactErr.style.display = "inline";
      contactEle.style.border = "2px solid green";
      iscontactValid = true;
    }
  }
  return iscontactValid;
}

function validateAlternativeContactNo() {
  let contactEle = document.getElementById("alternativeNumber");
  let contact = contactEle.value.trim();
  let contactErr = document.getElementById("alt-contact-error");
  let iscontactValid = false;
  const contactRegex = /^\d{10}$/;
  if (contact === " ") {
    contactErr.innerHTML = "Contact Number cannot be empty";
    contactEle.style.border = "2px solid red";
    contactErr.style.display = "inline";
    iscontactValid = false;
  } else if (!contactRegex.test(contact)) {
    contactErr.innerHTML = "Should contaion only 10 digits";
    contactEle.style.border = "2px solid red";
    contactErr.style.display = "inline";
    iscontactValid = false;
  } else {
    contactErr.style.display = "none";
    contactEle.style.border = "2px solid green";
    iscontactValid = true;
  }
  return iscontactValid;
}

function validatePassword() {
  let password = document.getElementById("password");
  let passwordError = document.getElementById("password-error");
  if (password.value.length < 7) {
    passwordError.innerHTML = "Please provide a valid password";
    password.style.border = "2px solid red";
    passwordError.style.display = "inline";
    return false;
  } else {
    password.style.border = "2px solid green";
    passwordError.style.display = "none";
    return true;
  }
}

function validateConfirmPassword() {
  let password = document.getElementById("password");
  let cpassword = document.getElementById("confirmPwd");
  let confirmPasswordError = document.getElementById("cpassword-error");
  if (cpassword.value != password.value) {
    confirmPasswordError.innerHTML = "Passwords do not match";
    confirmPasswordError.style.display = "inline";
    cpassword.style.border = "2px solid red";
    return false;
  } else {
    confirmPasswordError.style.display = "none";
    cpassword.style.border = "2px solid green";
    return true;
  }
}

function validateAddress() {
  let address = document.getElementById("address");
  let addressError = document.getElementById("address-error");
  if (address.value.trim() === "") {
    addressError.innerHTML = "Address cannot be empty";
    addressError.style.display = "inline";
    address.style.border = "2px solid red";
    return false;
  } else if (address.value.trim().length < 5) {
    addressError.innerHTML = "Address must contain atleast 5 characters";
    addressError.style.display = "inline";
    address.style.border = "2px solid red";
    return false;
  } else if (address.value.trim().length > 100) {
    addressError.innerHTML = "Max characters allowed for address : 100";
    addressError.style.display = "inline";
    address.style.border = "2px solid red";
    return false;
  } else {
    addressError.style.display = "none";
    address.style.border = "2px solid green";
    return true;
  }
}

function validateForm() {
  if (
    validateFName() &&
    validateLName() &&
    validateEmail() &&
    validateContactNo() &&
    validateAlternativeContactNo() &&
    validateAddress() &&
    validatePassword() &&
    validateConfirmPassword()
  ) {
    return true;
  } else {
    return false;
  }
}

function validateChangePassword(){
  if(validatePassword() && validateConfirmPassword()){
    return true;
  }else{
    return false;
  }
}

function checkEmail() {
  let email = document.getElementById("email").value;
  let ajaxRequest = new XMLHttpRequest();

  ajaxRequest.open(
    "GET",
    "http://localhost:8080/Food-Recipe/rest/checkEmail?userEmail=" + email,
    false
  );
  ajaxRequest.send();
  let ajaxResponse = ajaxRequest.responseText;
  if (ajaxResponse === "true") {
    return true;
  } else {
    return false;
  }
}

function checkContactNo() {
  let contactNo = document.getElementById("contactNo").value;
  let ajaxRequest = new XMLHttpRequest();

  ajaxRequest.open(
    "GET",
    "http://localhost:8080/Food-Recipe/rest/checkContactNo?contactNo=" +
    contactNo,
    false
  );
  ajaxRequest.send();
  let ajaxResponse = ajaxRequest.responseText;
  if (ajaxResponse === "true") {
    return true;
  } else {
    return false;
  }
}
