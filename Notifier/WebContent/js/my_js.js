
//function to display Popup
function div_show(){ 
document.getElementById('abc').style.display = "block";
document.getElementById('form1').style.display = "block";
document.getElementById('form').style.display = "none";
document.getElementById('form2').style.display = "none";
}

//function to hide Popup
function div_hide(){ 
document.getElementById('abc').style.display = "none";
}

function form_show(){ 
document.getElementById('form1').style.display = "none";
document.getElementById('form').style.display = "block";
}
function validate()
{ 
     var fullname = document.form.fullname.value;
     var email = document.form.email.value;
     var username = document.form.username.value; 
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
     
     if (fullname==null || fullname=="")
     { 
     alert("Full Name can't be blank"); 
     return false; 
     }
     else if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if (username==null || username=="")
     { 
     alert("Username can't be blank"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
     else if (password!=conpassword)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 