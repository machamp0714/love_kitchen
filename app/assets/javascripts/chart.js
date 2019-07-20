var chart = document.getElementById('myRadarChart');
if (chart) {
    var ctx = chart.getContext('2d');
    var myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: gon.labels,
            datasets: [{
                label: 'chart',
                data: gon.data,
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
                    stepSize: 1,
                }
            }
        }
    });
}