var chart = document.getElementById('myChart');
if (chart) {
  var ctx = chart.getContext('2d')
  var myChart = new Chart(ctx, {
    type: 'radar',
    data: {
      labels: ['オススメ', '価格', 'デザイン', '切れ味', '使い易さ'],
      datasets: [{
        label: '例',
        data: [5, 4, 2, 4, 3],
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1.0)',
        borderWidth: 1,
        pointRadius: 3.5,
        pointBackgroundColor: 'rgba(255, 206, 86, 1)',
        pointBorderColor: '#fff'
      }]
    },
    options: {
      animation: false,
      scale: {
        ticks: {
          beginAtZero: true,
          min: 0,
          max: 5,
          stepSize: 1
        }
      }
    }
  });
}