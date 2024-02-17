<!DOCTYPE html>
<html lang="en">

<head>
  <title>Dashboard</title>
  <jsp:include page="dependancy.jsp"></jsp:include>
</head>
<body>

  <!-- ======= Header ======= -->

    <header id="header" class="header fixed-top d-flex align-items-center">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                  <a class="nav-link " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    DASHBOARD
                  </a>
                </li>
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    CONTENT
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#"></a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>
  
  
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   MARKETING
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                  </ul>
                </li>
  
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    LEADS
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="Lead">Add Lead</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="PhoneCall">Lead PhoneCall</a></li>
                  
               
                  </ul>
                </li>
  
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ANALYTICS
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    REPORTS
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>


               <li class="nav-item dropdown">
                              <!--     <a class="nav-link dropdown-toggle" href="AddUser.htm" role="button" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                  REGISTER
                                 </a>
                                  -->

                                 <a class="nav-link dropdown-toggle" href="AddUser.htm"  id="navbarDropdown">REGISTER</a>
                               <!--  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
               							<li><a class="dropdown-item" href="managerReg.htm">Management
               									Team</a></li>
               							<li><hr class="dropdown-divider"></li>
               							<li><a class="dropdown-item" href="csupportReg">C S Team</a></li>

               						</ul> -->
                               </li>
  
              </ul>
                <!-- <div class="search-bar">
                  <form class="search-form d-flex align-items-center" method="POST" action="#">
                    <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                  </form> 
                </div> -->
               <!-- <div>
                  <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                  <i class="bi bi-search"></i>
                  </a>
               </div> -->
             
               <div class="search-bar">
                <form class="search-form d-flex align-items-center" method="POST" action="#">
                  <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                  <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                </form>
              </div>

             
          
        
          <div class="nav-item dropdown">
            <a class="nav-link nav-icon"  href="#" data-bs-toggle="dropdown">
              <i class="bi bi-bell"></i>
              
            </a>
          </div>

         <div class="icon">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-question-circle"></i></a>
          <!-- <div class="label">question-circle</div> -->
         </div>
        |
          <div class="icon" >
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-person-circle"></i>
          </a>
           <!-- <div class="label">person-circle</div> -->
           </div>

          </div>

      </div>
    
        </nav>
        
    
  
  </header>


  <main id="main" class="main" >
    <section class="section" >
      <div class="row" >   


        <div class="col-lg-4" >
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" style="margin-left:10%">Lead By Sources</h5>
                <hr>
              <!-- Bar Chart -->
              <div id="barChart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#barChart"), {
                    series: [{
                      data: [1380,1200,1100,400,690,  580, 540, 430, 448, 470,  0 ]
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
                      categories: ['Facebook Ads', 'Facebook Advt', 'FB Lead Ads', 'Contact Form 7', '(No Value)', 'CREAM', 'Customer Refferal',
                        'Direct Walk-Ins', '[Other Values]'
                      ],
                    }
                  }).render();
                });
              </script>
              <!-- End Bar Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-8" >
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Daily Lead Addition</h5>
              <hr>
              <!-- Line Chart -->
              <div id="lineChart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#lineChart"), {
                    series: [{
                      name: "Desktops",
                      data: [0, 41, 35, 51, 49, 62, 69, 91, 50,55,10,55]
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
                      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','oct','Nov','Dec'],
                    }
                  }).render();
                });
              </script>
              <!-- End Line Chart -->

            </div>
          </div>
        </div>
         
      </div>
    </section>


    <section class="section1">
      <div class="row"  >  
    <div class="col-lg-4" >
      <div class="card">
        <div class="card-body">
          <h5 class="card-title" style="margin-left:10%">Key Metrics
            <input type="date" id="datePicker" onchange="updateChart()" style="margin-left:40%;">
          </h5>
            <hr>
          <!-- Bar Chart -->
          <div id="barChart"></div>
          
      
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
  <div id="container" style="height: 230px;">
<div id="pie-chart" style="height: 400px ;width:230px">
     <canvas id="myPieChart" width="100" height="50"></canvas>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
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
</script>

        </div>
      </div></div>

        <div class="col-lg-8">
          <div class="card1">

            <div class="card-body1">
              <h5 class="card-title1">Daily Lead Collection</h5>
              <hr>
              <!-- Line Chart -->
              <div id="lineChart1"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#lineChart1"), {
                    series: [{
                      name: "Desktops",
                      data: [0, 41, 30, 51, 80, 62, 69, 60, 50,55,10,55]
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
                      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','oct','Nov','Dec'],
                    }
                  }).render();
                });
              </script>
              <!-- End Line Chart -->

            </div>
          </div>
        </div>
         
      </div>
    </section>

  

  </main>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>

</html>