/*   
Template Name: Color Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.1
Version: 1.5.0
Author: Sean Ngu
Website: http://www.seantheme.com/color-admin-v1.5/admin/
*/

var blue		= '#348fe2',
    blueLight	= '#5da5e8',
    blueDark	= '#1993E4',
    aqua		= '#49b6d6',
    aquaLight	= '#6dc5de',
    aquaDark	= '#3a92ab',
    green		= '#00acac',
    greenLight	= '#33bdbd',
    greenDark	= '#008a8a',
    orange		= '#f59c1a',
    orangeLight	= '#f7b048',
    orangeDark	= '#c47d15',
    dark		= '#2d353c',
    grey		= '#b6c2c9',
    purple		= '#727cb6',
    purpleLight	= '#8e96c5',
    purpleDark	= '#5b6392',
    red         = '#ff5b57';

var handleVectorMap = function() {
	"use strict";
	if ($('#world-map').length !== 0) {
		$('#world-map').vectorMap({
		map: 'world_mill_en',
		scaleColors: ['#e74c3c', '#0071a4'],
		normalizeFunction: 'polynomial',
		hoverOpacity: 0.5,
		hoverColor: false,
		markerStyle: {
			initial: {
				fill: '#4cabc7',
				stroke: 'transparent',
				r: 3
			}
		},
		regionStyle: {
			initial: {
				fill: 'rgb(97,109,125)',
                "fill-opacity": 1,
                stroke: 'none',
                "stroke-width": 0.4,
                "stroke-opacity": 1
			},
			hover: {
				"fill-opacity": 0.8
			},
			selected: {
				fill: 'yellow'
			},
			selectedHover: {
			}
		},
		focusOn: {
            x: 0.5,
            y: 0.5,
            scale: 0
        },
		backgroundColor: '#2d353c',
		markers: [
			{latLng: [41.90, 12.45], name: 'Vatican City'},
			{latLng: [43.73, 7.41], name: 'Monaco'},
			{latLng: [-0.52, 166.93], name: 'Nauru'},
			{latLng: [-8.51, 179.21], name: 'Tuvalu'},
			{latLng: [43.93, 12.46], name: 'San Marino'},
			{latLng: [47.14, 9.52], name: 'Liechtenstein'},
			{latLng: [7.11, 171.06], name: 'Marshall Islands'},
			{latLng: [17.3, -62.73], name: 'Saint Kitts and Nevis'},
			{latLng: [3.2, 73.22], name: 'Maldives'},
			{latLng: [35.88, 14.5], name: 'Malta'},
			{latLng: [12.05, -61.75], name: 'Grenada'},
			{latLng: [13.16, -61.23], name: 'Saint Vincent and the Grenadines'},
			{latLng: [13.16, -59.55], name: 'Barbados'},
			{latLng: [17.11, -61.85], name: 'Antigua and Barbuda'},
			{latLng: [-4.61, 55.45], name: 'Seychelles'},
			{latLng: [7.35, 134.46], name: 'Palau'},
			{latLng: [42.5, 1.51], name: 'Andorra'},
			{latLng: [14.01, -60.98], name: 'Saint Lucia'},
			{latLng: [6.91, 158.18], name: 'Federated States of Micronesia'},
			{latLng: [1.3, 103.8], name: 'Singapore'},
			{latLng: [1.46, 173.03], name: 'Kiribati'},
			{latLng: [-21.13, -175.2], name: 'Tonga'},
			{latLng: [15.3, -61.38], name: 'Dominica'},
			{latLng: [-20.2, 57.5], name: 'Mauritius'},
			{latLng: [26.02, 50.55], name: 'Bahrain'},
			{latLng: [0.33, 6.73], name: 'São Tomé and Príncipe'}
		]
		});
	}
};

var handleInteractiveChart = function () {
	"use strict";
    function showTooltip(x, y, contents) {
        $('<div id="tooltip" class="flot-tooltip">' + contents + '</div>').css( {
            top: y - 45,
            left: x - 55
        }).appendTo("body").fadeIn(200);
    }
	
};

var handleDonutChart = function () {
	"use strict";
	if ($('#donut-chart').length !== 0) {
        var donutData = [{ label: "Chrome",  data: 35, color: purpleDark},
			{ label: "Firefox",  data: 30, color: purple},
			{ label: "Safari",  data: 15, color: purpleLight},
			{ label: "Opera",  data: 10, color: blue},
			{ label: "IE",  data: 5, color: blueDark}];
		$.plot('#donut-chart', donutData, {
			series: {
				pie: {
					innerRadius: 0.5,
					show: true,
					label: {
						show: true
					}
				}
			},
			legend: {
				show: true
			}
		});
    }
};

var handleDashboardSparkline = function() {
	"use strict";
    var options = {
        height: '50px',
        width: '100%',
        fillColor: 'transparent',
        lineWidth: 2,
        spotRadius: '4',
        highlightLineColor: blue,
        highlightSpotColor: blue,
        spotColor: false,
        minSpotColor: false,
        maxSpotColor: false
    };
    function renderDashboardSparkline() {
        var value = [50,30,45,40,50,20,35,40,50,70,90,40];
        options.type = 'line';
        options.height = '23px';
        options.lineColor = red;
        options.highlightLineColor = red;
        options.highlightSpotColor = red;
        
        var countWidth = $('#sparkline-unique-visitor').width();
        if (countWidth >= 200) {
            options.width = '200px';
        } else {
            options.width = '100%';
        }
        
        $('#sparkline-unique-visitor').sparkline(value, options);
        options.lineColor = orange;
        options.highlightLineColor = orange;
        options.highlightSpotColor = orange;
        $('#sparkline-bounce-rate').sparkline(value, options);
        options.lineColor = green;
        options.highlightLineColor = green;
        options.highlightSpotColor = green;
        $('#sparkline-total-page-views').sparkline(value, options);
        options.lineColor = blue;
        options.highlightLineColor = blue;
        options.highlightSpotColor = blue;
        $('#sparkline-avg-time-on-site').sparkline(value, options);
        options.lineColor = grey;
        options.highlightLineColor = grey;
        options.highlightSpotColor = grey;
        $('#sparkline-new-visits').sparkline(value, options);
        options.lineColor = dark;
        options.highlightLineColor = dark;
        options.highlightSpotColor = grey;
        $('#sparkline-return-visitors').sparkline(value, options);
    }
    
    renderDashboardSparkline();
    
    $(window).on('resize', function() {
        $('#sparkline-unique-visitor').empty();
        $('#sparkline-bounce-rate').empty();
        $('#sparkline-total-page-views').empty();
        $('#sparkline-avg-time-on-site').empty();
        $('#sparkline-new-visits').empty();
        $('#sparkline-return-visitors').empty();
        renderDashboardSparkline();
    });
};

var handleDashboardDatepicker = function() {
	"use strict";
    $('#datepicker-inline').datepicker({
        todayHighlight: true
    });
};

var handleDashboardTodolist = function() {
	"use strict";
    $('[data-click=todolist]').click(function() {
        var targetList = $(this).closest('li');
        if ($(targetList).hasClass('active')) {
            $(targetList).removeClass('active');
        } else {
            $(targetList).addClass('active');
        }
    });
};

var Dashboard = function () {
	"use strict";
    return {
        //main function
        init: function () {            
            handleInteractiveChart();
            handleDashboardSparkline();
            handleDonutChart();
            handleDashboardTodolist();
            handleVectorMap();
            handleDashboardDatepicker();
        }
    };
}();