<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!DOCTYPE html>
<html lang="en">
<head>
    
    <title>PhoneCall</title>

    
   
   
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   

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

 .cont{
    margin-left: 30px;
 }

  form {
   display:grid;
    grid-template-columns: 2fr 2fr ;
    grid-template-rows: 1fr 1fr;
    row-gap: 4ch;
   
  
  }

 

  .nine{
     grid-column: span 2;
     
  }

  .mid{
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
  
  
  .leadStage_opt{
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

  .top
  {
    margin-left: 30px;
  }
  .mid
  {
    margin-right: 200px;
  }

        </style>



</head>
<body>

    <h2 id="leadformtitle">Lead Phone Call</h2>


    <div id="leadFormButtons">
        <ul id = "contentLink">
            <li> <button id="details_btn" onclick="basicDetails()"> Phone Call</button> </li>
            <li> <button id="details_btn" ><a href="AppRegister">Personal Details</a> </button> </li>
            <li> </li>
            <li></li>

        </ul>
    </div>

   
    
  

    <div class="cont">
        <form>
    
            <div class = "one">
            <label for="fname">Name <span style="color:red">*</span></label><br />
            <input type="text" id="fname" name="name" required/>
            </div>
            
            <div class = "two">
            <label for="email">Email</label> <br />
            <input type="email" id="em" name="em"/>
             </div>
    
             <div class = "three">
            <label for="number">Phone Number<span style="color:red">*</span></label> <br />
           <span class="phnoOption">
            <select>
                <option>+91</option>
            </select>
            <input type="tel" id="phno" name="phno" required/></span>
            </div>
           
             <div class = "four">
            <label for="number">Whats app<span style="color:red">*</span> </label> <br />
           <span class="phnoOption">
            <select>
                <option>+91</option>
            </select>
            <input type="tel" id="phno" name="phno" required/></span>
            </div>
        
      
    
            <div class="six">
                <label for="LeadSubstatus">Lead Stage</label> <br />
        
                <select class="leadStage_opt">
                    <option>Lead</option>
                    <option>Lead Called</option>
                    <option>Won</option>
                    <option>Lost</option>
               
    
                    
                </select>
            </div>
           
    
            <label class="mid">Phone Call Details<span style="color:blue">*</span> </label>
         
    
            <div class="six">
                <label for="LeadSubstatus">Lead Substatus</label> <br />
        
                <select class="leadStage_opt">
                    <option>Call Back Later </option>
                    <option>Disconnected </option>
                    <option>Answered</option>
                    <option>Not Interested</option>
                    <option>Not Reachable / Rangout</option>
    
                    
                </select>
            </div>
    
            <div class="seven">
                <label for="LeadSource">Deal Status</label> <br />
        
                <select class="leadStage_opt">
                    <option>In Progress</option>
                   
                    <option>Report Opportunity</option>
                    <option>Report Taken</option>
                    <option>Full Payment Opportunity</option>
                    <option>Full Payment Taken</option>
                    <option>Not Interested</option>
    
    
                    
                </select>
            </div>
    
    
            <div class = "eight">
            <label for="date">Date</label> <br />
            <input type="date" id="dt" name="dt"/>
             </div>
        
    
    
            <div class = "nine">
        
            <label for="Notes">Notes<span style="color:red">*</span></label> <br />
            <input type="text" id="nt" name="nt"/>
        
            </div>
      <div class="d-grid gap-2" style="margin-left:80%;">
  				        <input type="submit" class="btn btn-primary" value="Submit">
                    </div>
    
            </form> 
            
            
            
            </div>
    

</body>
</html>