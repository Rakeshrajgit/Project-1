<!DOCTYPE html>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.main.model.LeadAcqTypes"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.main.dto.AgentCollectionDto"%>
<html lang="en">

<head>

<jsp:include page="header.jsp"></jsp:include>

</head>

<body>

	<%
		String userType = (String)request.getAttribute("userType");
		Map<LocalDate, Long> collectionDateMap = (Map<LocalDate, Long>) request.getAttribute("agentCollectionData");
		List<CrmUser> agents = (List<CrmUser>) request.getAttribute("agentsList");
		String userId_dd = (String)request.getAttribute("userId_dd");
		String fromDate =  (String)request.getAttribute("fromDate");
		String toDate =(String)request.getAttribute("toDate");
		List<LeadAcqTypes> leadSourceTypes =  ( List<LeadAcqTypes> ) request.getAttribute("leadSourceTypes");
		Map<String, Long> leadSourceCount = ( Map<String, Long> ) request.getAttribute("leadSourceCount");
		Map<LocalDate, Long> leadDateCount = ( Map<LocalDate, Long> ) request.getAttribute("leadDateCount");

		

		
	%>

	<div class="row" style="padding: 5px">
			<div class="col-md-12" align="right">
				<form action="Dashboard.htm">
					<table>
						<tr>
							<td style="padding-top:10px;"> <label ><h6>From&nbsp;&nbsp;</h6></label></td>
							<td style="padding-right :10px;"><input type="text" name="fromDate" data-date-format="yyyy-mm-dd" value="<%=fromDate %>" required="required" id="fromDate" class="form-control input-sm" readonly="readonly"></td>
							<td style="padding-top:10px;"> <label><h6>To :&nbsp;&nbsp;</h6></label></td>
							<td style="padding-right :10px;"><input type="text" name="toDate" data-date-format="yyyy-mm-dd" value="<%=toDate %>" required="required" id="toDate" class="form-control input-sm" readonly="readonly"></td>
							<td style="padding-top:10px;"><label><h6>Agent :&nbsp;&nbsp;</h6></label></td>
							<td style="padding-right :10px;">
								<select name="userId" class="selectpicker">
								    <%if(userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) ){ %>
								    		<option value="A" <%if("A".equalsIgnoreCase(userId_dd)){ %>selected<%} %>>All</option>
									    <%for(CrmUser user : agents){ %>
									    	<option value="<%=user.getUserId()%>" <%if(user.getUserId().equalsIgnoreCase(userId_dd)){ %>selected<%} %>><%=user.getUserName() %>(<%=user.getUserId() %>)</option>
									    <%}%>
								    <%}else{ %>
								    	 <%for(CrmUser user : agents){ %>
								    	 	<%if(user.getUserId().equalsIgnoreCase(userId_dd)){ %>
							    			<option value="<%=user.getUserId()%>" selected="selected"><%=user.getUserName() %>(<%=user.getUserId() %>)</option>
							    			<%} %>
							    		<%} %>
							   		<%}  %>
							    </select>
						    </td>
							<td><input type="submit" class="btn btn-sm submit-btn" value="Submit"></td>
							
						</tr>
					</table>
				   
				</form>
			</div>
		</div>
	

	<main id="main" class="main" style="padding:10px;">
	
	
	<section class="section">
			<div class="row">
			<!-- 	<div class="col-md-4">
					<div class="card" style="border-radius: 10px;">
					 	<div class="card-body">
							<h5 class="card-title" style="margin-left: 10%">Key Metrics 
							<input type="date" id="datePicker" onchange="updateChart()" style="margin-left: 40%;">
							</h5>
							<hr>
						
							<div id="container" style="height: 230px;">
								<div id="pie-chart" style="height: 400px; width: 230px">
									<canvas id="myPieChart" width="100" height="50"></canvas>
								</div>

							</div>

						</div>
					</div>
				</div> -->


				<div class="col-md-8">
					<div class="card" style="border-radius: 10px;">

						<div class="card-body" >
							<h5 class="card-title">Daily Lead Collection</h5>
							<hr>
							
							<div id="collections_chart"></div>

						</div>
					</div>
				</div>

			</div>
		</section>
		
	<br>
		<section class="section">
			<div class="row">

				<div class="col-md-4">
					<div class="card" style="border-radius: 10px;">
						<div class="card-body" >
							<h5 class="card-title" style="margin-left: 10%">Lead By Sources</h5>
							<hr>
							<div id=lead_source_bar ></div>

		
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="card" style="border-radius: 10px;">
						<div class="card-body">
							<h5 class="card-title">Daily Lead Addition</h5>
							<hr>
							<div id="lead_dates_count"></div>
						</div>
					</div>
				</div>

			</div>
		</section>


	</main>



</body>


		

			<script>
                document.addEventListener("DOMContentLoaded", () => {
                	
                	$lead_date_categoriesArr = [];
                    $lead_date_dataArr = [];
                    <%for (Map.Entry<LocalDate, Long> entry : leadDateCount.entrySet()) {%>
                    	$lead_date_categoriesArr.push('<%=MyDateTimeUtils.sqlToRegularDate(entry.getKey().toString())%>');
                        $lead_date_dataArr.push('<%=entry.getValue()%>');
                    <%}%>
                	
                  new ApexCharts(document.querySelector("#lead_dates_count"), {
                    series: [{
                      name: "Date",
                      data: $lead_date_dataArr
                    }],
                    chart: {
                     
                      height: 250,
                      type: 'line',
                      zoom: {
                        enabled: false
                      }
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      curve: 'straight'
                    },
                    grid: {
                      row: {
                        colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                        opacity: 0.5
                      },
                    },
                    xaxis: {
                      categories: $lead_date_categoriesArr
                    }
                  }).render();
                });
              </script>
              

<script>
	document.addEventListener("DOMContentLoaded", () => {
		$categoriesArr = [];
        $dataArr = [];
        <%for (Map.Entry<LocalDate, Long> collection : collectionDateMap.entrySet()) {%>
        	$categoriesArr.push('<%=MyDateTimeUtils.sqlToRegularDate(collection.getKey().toString())%>');
            $dataArr.push('<%=collection.getValue()%>');
        <%}%>
                 
        new ApexCharts(document.querySelector("#collections_chart"), {
                   series: [{
                      name: "collection",
                      data: $dataArr 
                    }],
                    chart: {
                     
                      height: 250,
                      type: 'line',
                      zoom: {
                        enabled: false
                      }
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      curve: 'straight'
                    },
                    grid: {
                      row: {
                        colors: ['#f3f3f3', 'transparent'], 
                        opacity: 0.5
                      },
                    },
                    xaxis: {
                      categories: $categoriesArr
                    }
                  }).render();
                });
	
</script>

	<script>
	
                document.addEventListener("DOMContentLoaded", () => {
                	
                	$lead_source_categoriesArr = [];
                	$lead_source_dataArr = [];
                    <% 

                    for (Map.Entry<String, Long> count : leadSourceCount.entrySet()) {%>
                    	
                    	
                    	$lead_source_categoriesArr.push('<%=count.getKey()%>');
                        $lead_source_dataArr.push('<%=count.getValue()%>');
                        
                    <%}%>
                    
                  new ApexCharts(document.querySelector("#lead_source_bar"), {
                    series: [{
                      data: $lead_source_dataArr
                    }],
                    chart: {
                      type: 'bar',
                      height: 250
                    },
                    plotOptions: {
                      bar: {
                        borderRadius: 3,
                        horizontal: true,
                      }
                    },
                    dataLabels: {
                      enabled: false
                    },
                    xaxis: {
                      categories: $lead_source_categoriesArr
                      
                    }
                  }).render();
                });
              </script>
              

<!-- <script>
// Sample data for the pie chart
const data = {
    labels: ['Active Leads', 'Engagement', 'New Leads'],
    datasets: [{
        data: [30, 50, 20],
        backgroundColor: ['#ff6384', '#36a2eb', '#ffce56']
    }]
};

// Configuration for the pie chart
const config = {
    type: 'pie',
    data: data,
};

// Create the pie chart
const myPieChart = new Chart(document.getElementById('myPieChart'), config);

// Function to update the chart based on selected date
function updateChart() {
    // Fetch and update data based on the selected date
    // Replace the following line with your actual data fetching and updating logic
    const newData = fetchDataBasedOnDate(document.getElementById('datePicker').value);

    // Update the chart data
    myPieChart.data.datasets[0].data = newData;

    // Update the chart
    myPieChart.update();
}

// Function to fetch data based on selected date (replace with your actual logic)
function fetchDataBasedOnDate(selectedDate) {
    // Placeholder function, replace with actual data fetching logic
    // For simplicity, returning random data
    return [Math.floor(Math.random() * 100), Math.floor(Math.random() * 100), Math.floor(Math.random() * 100)];
}
</script> -->



<script type="text/javascript">

$(document).ready(function() {

	$('#fromDate').daterangepicker({
		"minDate": moment().subtract(2, 'months'),
		"singleDatePicker" : true,
		"linkedCalendars" : false,
		"showCustomRangeLabel" : true,
		"maxDate" : new Date(),
		"cancelClass" : "btn-default",
		showDropdowns : true,
		locale : {
			format : 'DD-MM-YYYY'
		}
	});

	$('#toDate').daterangepicker({
		"minDate":  moment().subtract(2, 'months'),
		"singleDatePicker" : true,
		"linkedCalendars" : false,
		"showCustomRangeLabel" : true,
		"maxDate" : new Date(),
		"cancelClass" : "btn-default",
		showDropdowns : true,
		locale : {
			format : 'DD-MM-YYYY'
		}
	});


});

$('#fromDate').on('change', function(){
    $('#toDate').daterangepicker({
            
   	"minDate": moment($('#fromDate').val(),"DD-MM-YYYY").add(1,'d'),
	"singleDatePicker" : true,
	"linkedCalendars" : false,
	"showCustomRangeLabel" : true,
	"maxDate" : new Date(),
	"cancelClass" : "btn-default",
	showDropdowns : true,
	locale : {
		format : 'DD-MM-YYYY'
	}
});
});

$('#toDate').on('change', function(){
    $('#fromDate').daterangepicker({
       
    	"maxDate":  moment($('#toDate').val(),"DD-MM-YYYY").subtract(1,'d'),
		"singleDatePicker" : true,
		"linkedCalendars" : false,
		"showCustomRangeLabel" : true,
		"cancelClass" : "btn-default",
		showDropdowns : true,
		locale : {
			format : 'DD-MM-YYYY'
		}
});
});

</script>

</html>