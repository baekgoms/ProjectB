$(function () {

    // ==============================================================
    // Campaign
    // ==============================================================

    var chart1 = c3.generate({
        bindto: '#campaign-v2',
        data: {
            columns: [
                [' ', 45],
                ['동의', 55]
            ],

            type: 'donut',
            tooltip: {
                show: true
            }
        },
        donut: {
            label: {
                show: false
            },
            title: '찬성/반대',
            width: 18
        },

        legend: {
            hide: true
        },
        color: {
            pattern: [
                '#edf2f6',
                '#5f76e8',
                '#ff4f70',
                '#01caf1'
            ]
        }
    });

    d3.select('#campaign-v2 .c3-chart-arcs-title').style('font-family', 'Rubik');

    // ============================================================== 
    // income
    // ============================================================== 
    var data = {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        series: [
            [5, 4, 3, 7, 5, 10]
        ]
    };

    var options = {
        axisX: {
            showGrid: false
        },
        seriesBarDistance: 1,
        chartPadding: {
            top: 15,
            right: 15,
            bottom: 5,
            left: 0
        },
        plugins: [
            Chartist.plugins.tooltip()
        ],
        width: '100%'
    };

    var responsiveOptions = [
        ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
                labelInterpolationFnc: function (value) {
                    return value[0];
                }
            }
        }]
    ];
    new Chartist.Bar('.net-income', data, options, responsiveOptions);

 // ==============================================================
    // Campaign
    // ==============================================================

    var chart2 = c3.generate({
        bindto: '#campaign-v3',
        data: {
            columns: [
                ['', 0],
                ['찬성', 45.5],
                ['반대', 54.5]
            ],

            type: 'donut',
            tooltip: {
                show: true
            }
        },
        donut: {
            label: {
                show: false
            },
            title: 'Hello',
            width: 18
        },

        legend: {
            hide: true
        },
        color: {
            pattern: [
                '#edf2f6',
                '#5f76e8',
                '#ff4f70',
                '#01caf1'
            ]
        }
    });

    d3.select('#campaign-v3 .c3-chart-arcs-title').style('font-family', 'Rubik');
    
    
    
 
})