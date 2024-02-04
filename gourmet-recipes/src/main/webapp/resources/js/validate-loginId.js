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
    if (isLoginIdValid) {
      // checkEmail(function(isValid) { (callback)
      let isValid = checkEmail();
      if (isValid === true) {
        loginErr.innerHTML = "Email verified";
        loginEle.style.border = "2px solid green";
        loginErr.style.display = "inline";
        isLoginIdValid = true;
      } else {
        loginErr.innerHTML = "Email not verified";
        loginEle.style.border = "2px solid red";
        loginErr.style.display = "inline";
        isLoginIdValid = false;
      }
      // });
    }
    return isLoginIdValid;
  }

  function checkEmail() {
    let email = document.getElementById("loginId").value;
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