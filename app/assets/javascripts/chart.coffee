window.draw_example_chart = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ['オススメ', '価格', 'デザイン', '切れ味', '使い易さ'],
            datasets: [{
                label: '例',
                data: [5, 4, 5, 4, 3],
                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                borderColor: 'rgba(255, 206, 86, 1.0)',
                borderWidth: 1,
                pointRadius: 3.5,
                pointBackgroundColor: 'rgba(255, 206, 86, 1)',
                pointBorderColor: '#fff'
            }]
        },
        options: {
            scales: {
                ticks: {
                    suggestedMax: 5,
                    suggestedMin: 0,
                    beginAtZero: true,
                    stepSize: 1
                }
            }
        }
    })

window.draw_chart = ->
    ctx = document.getElementById("myRadarChart").getContext('2d')
    myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: gon.labels,
            datasets: [{
                label: '例',
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
            scales: {
                ticks: {
                    suggestedMax: 5,
                    suggestedMin: 0,
                    beginAtZero: true,
                    stepSize: 1
                }
            }
        }
    })