<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <title>title</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style type="text/css">
        
        #firstDiv{
    position:absolute;
    left:66vh;
    background-color: lightcyan;
    height:100vh;
    width: 150vh;

}

#secDiv{
    position:absolute;
    left:0vh;
    background-color:lightblue;
    height:100vh;
    width: 68vh;
    margin-top:0px;


}

.LeadDetails
{
    margin:10px;
 
    background-color: #0A2647;
    height: 230px;
    width: 450px;
}

.lead-action-btn{
  background-color: blue;
}
.InsideleadDetails{
  

    background-color: #19376D;
    height: 80px;
    width: 450px;
}

.bottomLeadDetails{
    position: relative;
    top:70px;

    margin:10px;
    background-color: lightcyan;
    height: 80px;
    width: 450px;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
    background-color: lightcyan;
  }
  
  td, th
   {
    border: 1px solid #B6BBC4;
    text-align: left;
    padding: 14px;
    font-size: 12px;
    color:black;

  
  }
  
  tr:nth-child(even) {
    background-color: 89CFF3;
   
  }

  #Score{

    display:flex;
  
    justify-content: space-around ;
    color:white;
    font-size:15px;
    list-style-type: none;
 
  }

  #Score > li{
   
    font-family: Arial, sans-serif;
    margin:14px;
    padding:0px;
    

  }
  #Score > li > center{
    font-size:20px;
  }


#firstNav{
    
    width:100%;
    height: 35px;
    
}

#FirstContentLink{
  display: flex;
  gap:12px;
  list-style: none;

  align-items: center;
  justify-content: flex-start;
  padding-top: 10px;
}


.firstnav-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 8px 17px;
  font-size: 14px;
  font-family: Arial, sans-serif;
  text-align: center;
  text-decoration: none;
  border: 1px solid #333;
  border-radius: 5px;
  color: #333;
  transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
  cursor: pointer;
}

.firstnav-button:hover {
  background-color: lightblue;
  color: black;
}

.firstnav-button i {
  margin-right: 5px;
}




#contentLink{
  position:absolute;
  bottom:532px;
  width:960px;
  display: flex;
  gap:12px;
  list-style: none;

  align-items: center;
  justify-content: flex-start;

  background-color: lightblue;
  border-bottom: 1px solid black;;
}

#details_btn, #Leaddetails_btn , #task_btn ,#notes_btn ,#Doc_btn {
  height: 20px;
  width: 140px;
  margin:10px;

  
 
  border:none;
  font-weight: 500;
  font-size: 15px;
  color: #424949;
  background-color: lightblue;

}



#SecoundNavButtons > #contentLink > li:hover{
  border-top: 3px solid #3498DB;
 
}





#Details{
  position:absolute;
  left:37px;
  top: 75px;
  height:600px;
  width:1000px;
  border:0.5px solid black;
}


#contentLink2 {
  position: absolute;
  bottom:480px;

  width:960px;
  display: flex;
  gap:12px;
  list-style: none;

  align-items: center;
  justify-content: flex-start;

  
 
}

#activity_type_btn , #time_btn{
  height: 20px;
  width: 140px;
  margin:10px;

  
 
  border:none;
  font-weight: 500;
  font-size: 15px;
  color: #424949;
  background-color: lightblue;
}

#ThirdNavButtons > #contentLink2 > li >button {
  background-color:lightcyan;
}

#activityDropdown , #activityDropdown2 {
  padding:5px;
  width: 180px;

}
 
#contentLink2{
  border-bottom: 1px solid grey;
}

.content{
  position:absolute;
  bottom: 180px;
  left:10px;
  height: 300px;
  width: 980px;
  
}

.display > li {
  color:white;
  list-style-type: none;
  font-family:Arial, Helvetica, sans-serif;
  padding-bottom: 10px;
}

.display{
  padding:20px;
}


@keyframes blink {
  50% {
      opacity: 0;
  }
}

.blinking-text {
  animation: blink 1s infinite;
}
        
        
        </style>
    </head>
    

    <body>
        <div id ="firstDiv"> 
         


            <div id="firstNav">
                <ul id = "FirstContentLink">
                    <li> <a href="" class="firstnav-button">
                        <i class="fa fa-rocket"></i>
                        Activity
                    </a>  </li>
                    <li> <a href="" class="firstnav-button">
                        <i class="fa fa-sticky-note"></i>
                        Note
                    </a> </li>
                    <li> <a href="mailto:your.email@example.com" class="firstnav-button">
                        <i class="fa fa-envelope"></i>
                       Send Email
                    </a> </li>
                    <li> <a href="PhoneCall" class="firstnav-button">
                        <i class="fa fa-phone"></i>
                        Phone call Form
                    </a> </li>      
                </ul>
            </div>



            

            <div id="Details">
            <div id="SecoundNavButtons">
                <ul id = "contentLink">
                    <li> <button id="details_btn" onclick="basicDetails()"> Activity History</button> </li>
                    <li> <button id="Leaddetails_btn" onclick="LeadDetails()"> Lead Details</button> </li>
                    <li> <button id="task_btn" onclick="tasks()"> Tasks</button></li>
                    <li> <button id="notes_btn" onclick="notes()"> Notes</button></li>
                    <li> <button id="Doc_btn" onclick="Documents()"> Documents</button></li>
                </ul>
            </div>

            <div id="ThirdNavButtons">
                <ul id = "contentLink2">
                <li> <button id="activity_type_btn" onclick="ActivityType()"> Activity Type</button> </li>
              
                <li>  
                    <select id="activityDropdown">
                        <option value="activity1">All Selected</option>
                        <option value="activity2">Activity 2</option>
                        <option value="activity3">Activity 3</option>
                       
                    </select></li>
                <li> <button id="time_btn" onclick="Time()"> Time</button> </li>

                <li>  
                    <select id="activityDropdown2">
                        <option value="activity1">12:00 AM to 6:00 AM</option>
                        <option value="activity2">6:00 AM to 9:00 AM</option>
                        <option value="activity3">9:00 AM to 12:00 PM</option>
                        <option value="activity2">12:00 PM to 3:00 PM</option>
                        <option value="activity3">3:00 AM to 6:00 PM</option>
                        <option value="activity2">6:00 PM to 12 PM</option>
                      
                       
                    </select></li>
               </ul>
            </div>



            <div class="content">
                <table>
                    <thead>
                        <tr>
                            <th>Month</th>
                            <th>Time</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>January</td>
                            <td>12:00 PM</td>
                            <td>Dynamic Form Submission: Form submitted by Nikhil</td>
                        </tr>
                        <tr>
                            <td>January</td>
                            <td>3:30 PM</td>
                            <td>Phone Call: Rang out 3:33 PM</td>
                        </tr>

                        <tr>
                            <td>January</td>
                            <td>4:30 PM</td>
                            <td>Lead Owner Changed from Nikhil to Rakesh By Admin</td>
                        </tr>
                       
                    </tbody>
                </table>
            </div>


            </div>









        
        </div>

        <div id= "secDiv"> 



          
            <div class="LeadDetails">

                    <div class="display">
                        <li class="blinking-text"><i> Lead Called</i></li><br>
                        <li>  <i class="fas fa-user white-icon"></i>Team </li>
                        <li>123456789</li>
                        <li> <i class="fas fa-envelope white-icon"></i>team@gmail.com</li>
                        <li>Bangalore</li>
                    </div>





                <div class="InsideleadDetails">
                    <div id = "Score">
                        <li> <center> 0 </center>  <br/> Lead Score </li>
                        <li> <center> 0 </center>  <br/> DisEngaged </li>
                        <li> <center>-- </center> <br/>  Lead Quality</li>
                    </div>
                
                </div>
            </div>
            <div class="bottomLeadDetails">
                <table>
                    <tr>
                      <th>Lead Properties</th>
                      <th></th>
                    </tr>
                    <tr>
                      <td>Owner</td>
                      <td>_</td>
                    </tr>
                    <tr>
                      <td>Lead Source</td>
                      <td></td>
                    </tr>
                    <tr>
                        <td>Lead Age</td>
                        <td>37 Days</td>
                    </tr>
                </table>
            </div>

        </div>
    </body>


</html>