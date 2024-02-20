<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <jsp:include page="header.jsp"></jsp:include>

  <title>Dashboard</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!-- <link href="vendor/img/favicon.png" rel="icon">
  <link href="vendor/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../webresources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../webresources/assets/css/style.css" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

  <!-- ======= Header ======= -->

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

  <!-- Vendor JS Files -->
  <script src="../webresources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../webresources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../webresources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../webresources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../webresources/assets/vendor/quill/quill.min.js"></script>
  <script src="../webresources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../webresources/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../webresources/assets/vendor/php-email-form/validate.js"></script>


  <!--Bottstrap Script-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
     


  <!-- Template Main JS File -->
  <script src="../webresources/assets/vendor/js/main.js"></script>

</body>

</html>