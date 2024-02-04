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

function validateLoginId() {
  let loginEle = document.getElementById("loginId");
  let login = loginEle.value.trim();
  let loginErr = document.getElementById("login-error");
  let isLoginIdValid = false;
  const nameRegex = /^[a-zA-Z]+( [a-zA-Z]*)*$/;
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (login === " " || login.length < 4) {
    loginErr.innerHTML = "Must be at least 4 characters";
    loginEle.style.border = "2px solid red";
    loginErr.style.display = "inline";
    isLoginIdValid = false;
  } else if (!nameRegex.test(login) && !emailRegex.test(login)) {
    loginErr.innerHTML = "Incorrect username or email";
    loginEle.style.border = "2px solid red";
    loginErr.style.display = "inline";
    isLoginIdValid = false;
  } else {
    loginErr.style.display = "inline";
    loginEle.style.border = "2px solid green";
    isLoginIdValid = true;
  }
  // if (isLoginIdValid) {
  //   // checkEmail(function(isValid) { (callback)
  //   let isValid = checkEmail();
  //   if (isValid === true) {
  //     loginErr.innerHTML = "Email verified";
  //     loginEle.style.border = "2px solid green";
  //     loginErr.style.display = "inline";
  //     isLoginIdValid = true;
  //   } else {
  //     loginErr.innerHTML = "Email not verified";
  //     loginEle.style.border = "2px solid red";
  //     loginErr.style.display = "inline";
  //     isLoginIdValid = false;
  //   }
  //   // });
  // }
  return isLoginIdValid;
}

function validateForm() {
  if (validateLoginId() && validatePassword()) {
    return true;
  } else {
    return false;
  }
}

// function checkEmail() {
//   let email = document.getElementById("loginId").value;
//   let ajaxRequest = new XMLHttpRequest();

//   ajaxRequest.open(
//     "GET",
//     "http://localhost:8080/Food-Recipe/rest/checkEmail?userEmail=" + email,
//     false
//   );
//   ajaxRequest.send();
//   let ajaxResponse = ajaxRequest.responseText;
//   if (ajaxResponse === "true") {
//     return true;
//   } else {
//     return false;
//   }
// }

// function checkEmail(){  (mam method)
//     var email = document.getElementById('loginId').value;
//     // console.log(email);
//     const ajaxRequest = new XMLHttpRequest();
//     // console.log(ajaxRequest);
//     ajaxRequest.open("GET","http://localhost:8080/Food-Recipe/checkEmail?userEmail="+email);
//     // console.log(ajaxRequest);
//     ajaxRequest.send();
//     // console.log(ajaxRequest);
//     var isEmailValid = false;
//     ajaxRequest.onload = function(){
//         var ajaxResponse = this.responseText;
//         if(validateLoginId()){
//             if(ajaxResponse === "true"){
//                 document.getElementById("email-check").innerHTML = "Email is verified";
//                 document.getElementById("email-check").style.color="green";
//                 document.getElementById("email-check").style.display ="inline";
//                 isEmailValid = true;
//                 console.log(isEmailValid + " inside if response is true");
//             }else{
//                 document.getElementById("email-check").innerHTML = "Email is not valid";
//                 document.getElementById("email-check").style.color="red";
//                 document.getElementById("email-check").style.display ="inline";
//                 document.getElementById("loginId").style.border ="2px solid red";
//                 isEmailValid = false;
//                 console.log(isEmailValid+ " inside if response is false");
//             }
//         }
//         isEmailValid =false;
//         console.log(isEmailValid + " outside if login Id is failed");
//     }
//     console.log(isEmailValid + " returned value");
//     return isEmailValid;
// }

// function checkEmail(callback){
//     var email = document.getElementById('loginId').value;
//     const ajaxRequest = new XMLHttpRequest();

//     console.log(ajaxRequest + " before call");
//     ajaxRequest.open("GET","http://localhost:8080/Food-Recipe/checkEmail?userEmail="+email);
//     console.log(ajaxRequest + " after call");
//     ajaxRequest.send();
//     ajaxRequest.onload = function(){
//         console.log(ajaxRequest + "inside readystatechange");
//         if (this.readyState == 4 && this.status == 200){
//             var ajaxResponse = this.responseText;
//             console.log(ajaxResponse + " is the response");
//             if (ajaxResponse === "true"){
//                 callback(true);
//             }else{
//                 callback(false);
//             }
//         }

//     };
//     console.log(ajaxRequest + " after fuction is completed");
// }
