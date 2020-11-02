/** CHARTS JS */

/* globals Chart:false, feather:false */

(function () {
  'use strict'

  feather.replace()

  // Graphs
  var ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: [
        '10/26',
        '10/27',
        '10/28',
        '10/29',
        '10/30',
        '10/31',
        '11/01'
      ],
      datasets: [{
        data: [
          1,
          3,
          2,
          0,
          3,
          1,
          2
        ],
        lineTension: 0,
        backgroundColor: '#007bff',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            stepSize: 1,
            suggestedMax: 5
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
})()