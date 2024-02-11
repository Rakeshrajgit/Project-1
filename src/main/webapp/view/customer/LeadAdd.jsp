<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>LeadForm</title>

    <link rel="stylesheet" href="leadFormStyle.css"/>
   
   
   <style>
   
   #basicDetailsDiv                  
  {
    background-color: white;
    width: 700px;
    height: 500px;

    display: none;
    padding: 40px;

    margin-top: 10px;

  }

  form {
   display:grid;
    grid-template-columns: 2fr 2fr ;
    grid-template-rows: 1fr 1fr;
    row-gap: 4ch;
   
  
  }

 

  .five{
     grid-column: span 2;
     
  }

  textarea{
    resize:none;
    width: 647px;
    height:100px;

    outline-style: solid;
    outline-color: lightgray;
    outline-width: 1px;
    border: none;
  }
  
  
  .leadSource_opt{
    color: lightslategrey;
    width:300px;
    border:none;
    outline:none;
    border-bottom: 0.5px solid lightgrey;
    margin-top: 10px;
    font-size: 12px;
   
  }

  select{
    margin-top:20px;
    padding-bottom: 2px;
    font-size:12px;
    
  }
  
  select > option{
    color: lightslategrey;
    font-size: 12px;
   
   
  }

  .phnoOption > select {
    border:none;
    outline:none;
    border-bottom: 0.5px solid lightgrey;
    color: lightslategrey;

    margin-top:8px;
  }
  
  .phnoOption > input{
    border:none;
    outline:none;
    border-bottom: 0.5px solid lightgrey;
    width: 250px;
  }

  form > div > input{
    padding-top:9px;
    width:300px;
    border:none;
    outline:none;
    border-bottom: 0.5px solid lightgrey;
  }

  form > div > label{
    color: lightslategrey;
    font-size:11px;
    font-family: Arial, Helvetica, sans-serif;
  }
  #basicdetails_btn{
    color:#3498DB;
    background-color:white;
    border:none; 
    
    margin-left:30px;
    font-size:medium;
    cursor: pointer;
  }



#leadformtitle{
   font-family: Arial, Helvetica, sans-serif;
   font-weight:300;
   color:#424949;
   font-size: 20px;
}


#leadFormButtons{
    background-color: #F2F3F4;
    width:100%;
    height: 35px;
    
}

#contentLink{
  display: flex;
  gap:12px;
  list-style: none;

  align-items: center;
  justify-content: flex-start;
  padding-top: 10px;
}

#details_btn {
    height: 20px;
    width: 140px;
    padding-bottom: 21px;
    background-color: #F2F3F4;
    color: white;
    border: none;

    font-weight: 500;
    font-size: 15px;
    color: #424949;
 
  }

  #details_btn:hover{
    border-bottom: 3px solid #3498DB;
  }
   
   </style>
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   
</head>
<body>

    <h2 id="leadformtitle">Lead Add Form</h2>


    <div id="leadFormButtons">
        <ul id = "contentLink">
            <li> <button id="details_btn" onclick="basicDetails()"> Details</button> </li>
            <li> </li>
            <li> </li>
            <li></li>

        </ul>
    </div>

   

    <div id="basicDetailsDiv">
    <form action="">
     

        <div class = "one">
        <label for="name">First Name <span style="color:red">*</span></label><br />
        <input type="text" id="fname" name="name" required>
        </div>
        
        <div class = "two">
        <label for="lname">Last Name</label> <br />
        <input type="text" id="lname" name="lname">
         </div>
       
         <div class = "three">
        <label for="number">What's App Number <span style="color:red">*</span> </label> <br />
       <span class="phnoOption">
        <select>
            <option>+91</option>
        </select>
        <input type="tel" id="phno" name="phno" required></span>
        </div>


        <div class = "four">
        <label for="email">Email <span style="color:red">*</span> </label> <br />
        <input type="email" id="email" name="email" required>
        </div>
     
        <div class = "five">

        <label for="Notes">Notes </label> <br />
        <textarea id="notes" name="notes" >
        </textarea>

        </div>


        <div class="six">
            <label for="LeadSource">Lead Source</label> <br />

               <select class="leadSource_opt">
                <option>Sales User Created</option>
                <option>Facebook/Insta</option>
                <option>Bulk Import</option>
                <option>Contact Form</option>
                <option>Reference</option>
                <option>[Other Values]</option>
            </select>
        </div>
        </form> <br><br><br>
        
       <input type="submit" class="btn btn-primary btn-lg" value="Submit"/>
   
</div>
    <script>
        function basicDetails() 
        {
            var form = document.getElementById("basicDetailsDiv");
           
            if (form.style.display === "none")
             {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
       
      
    </script>

</body>
</html>