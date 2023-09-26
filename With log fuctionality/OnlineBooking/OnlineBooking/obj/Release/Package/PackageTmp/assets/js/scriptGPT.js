// Add these JavaScript functions

document.addEventListener("DOMContentLoaded", function () {
    const bookNowButton = document.getElementById("btnBookNow");
    const bookingDetails = document.getElementsByName("Select");
    const submitBookingButton = document.getElementById("submit-booking");
    const timeslotsSection = document.getElementById("timeslots");
    const confirmBookingButton = document.getElementById("confirm-booking");
    const confirmBookingButton2 = document.getElementById("confirm-booking2");
    const confirmBookingButton3 = document.getElementById("confirm-booking3");
    const customerFormSection = document.getElementById("customer-form");
    

    // bookNowButton.addEventListener("click", function () {
    //     bookingDetails.classList.remove("hidden");
    // });

    bookNowButton.addEventListener("btnBookNow_Click", function () {
        // Replace this with your logic to generate available timeslots and charges
        // Display the generated table inside the "timeslots" section
        // timeslotsSection.innerHTML = "<table>...</table>";
        //timeslotsSection.classList.remove("hidden");
        timeslotsSection.scrollIntoView({ behavior: "smooth" });
    });

    confirmBookingButton.addEventListener("click", function () {
        // timeslotsSection.classList.add("hidden");
        //customerFormSection.classList.remove("hidden");
        customerFormSection.scrollIntoView({ behavior: "smooth" });
    });

    confirmBookingButton2.addEventListener("click", function () {
        // timeslotsSection.classList.add("hidden");
        customerFormSection.classList.remove("hidden");
        customerFormSection.scrollIntoView({ behavior: "smooth" });
    });

    confirmBookingButton3.addEventListener("click", function () {
        // timeslotsSection.classList.add("hidden");
        customerFormSection.classList.remove("hidden");
        customerFormSection.scrollIntoView({ behavior: "smooth" });
    });
});


// toggle navbar 
// JavaScript for Navbar Toggle
document.addEventListener("DOMContentLoaded", function () {
    const menuIcon = document.getElementById("menu-icon");
    const navbar = document.querySelector(".navbar"); // This should match the class name in your HTML
  
    menuIcon.addEventListener("click", function () {
      navbar.classList.toggle("active");
    });
});

            //validation to the form 

document.addEventListener("DOMContentLoaded", function () {
    
    //variables 
    
    
    
});

// Validate form input 
// function seterror(id, ErrMsg)
// {
//     //this wil display error msg if input is not valid
//     element = document.getElementById(id);
//     element.querySelector('.formError').innerHTML= ErrMsg;
// }
// function validateForm() {

//     var cnic = document.forms['UserData']['cnic'].value;
//     var returnvalue=false;
//     // Perform your validation checks here
//     // For example, checking if the name is at least 3 characters long
//     if (cnic.length < 13) {
//         seterror("cnic" ,"cnic must be of 13 digits");
//         returnvalue= false; // Prevent form submission
//     }
//     else{
//         returnvalue= true;
//     }
    
//     // console.log("Cnic:", cnic); // Display the name in the console
    
//     return returnvalue; // Allow form submission
// }


  
