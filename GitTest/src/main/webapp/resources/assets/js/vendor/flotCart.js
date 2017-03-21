$(function() {

    // Bar Chart   

    var d1 = [];
    for (var i = 0; i <= 10; i += 1) {
        d1.push([i, parseInt(Math.random() * 30)]);
    }

    var d2 = [];
    for (var i = 0; i <= 10; i += 1) {
        d2.push([i, parseInt(Math.random() * 30)]);
    }

    var d3 = [];
    for (var i = 0; i <= 10; i += 1) {
        d3.push([i, parseInt(Math.random() * 30)]);
    }

    var stack = 0,
        bars = true,
        lines = false,
        steps = false;

    function plotWithOptions() {
        $.plot("#BarChart ", [d1, d2, d3], {
            series: {
                stack: stack,
                lines: {
                    show: lines,
                    fill: true,
                    steps: steps
                },
                bars: {
                    show: bars,
                    barWidth: 0.4

                }
            }
        });
    }

    plotWithOptions();

    $(".stackControls button").click(function(e) {
        e.preventDefault();
        stack = $(this).text() == "With stacking" ? true : null;
        plotWithOptions();
    });

    $(".graphControls button").click(function(e) {
        e.preventDefault();
        bars = $(this).text().indexOf("Bars") != -1;
        lines = $(this).text().indexOf("Lines") != -1;
        steps = $(this).text().indexOf("steps") != -1;
        plotWithOptions();
    });


    // Line Chart 
    var A1 = [];
    for (var i = 0; i < 14; i += 0.5) {
        A1.push([i, Math.sin(i)]);
    }

    var A2 = [
        [0, 3],
        [4, 8],
        [8, 5],
        [9, 13]
    ];
    $.plot("#LineChart", [A1, A2]);

    // categories Bar Chart  


    var data = [
        ["January", 10],
        ["February", 8],
        ["March", 4],
        ["April", 13],
        ["May", 17],
        ["June", 9]
    ];

    $.plot("#categories", [data], {
        series: {
            bars: {
                show: true,
                barWidth: 0.6,
                align: "center"
            }
        },
        xaxis: {
            mode: "categories",
            tickLength: 0
        }
    });



    //Tracking Curves

    var sin = [],
        cos = [];
    for (var i = 0; i < 14; i += 0.1) {
        sin.push([i, Math.sin(i)]);
        cos.push([i, Math.cos(i)]);
    }

    plot = $.plot("#trackingCurves", [{
        data: sin,
        label: "sin(x) = -0.00"
    }, {
        data: cos,
        label: "cos(x) = -0.00"
    }], {
        series: {
            lines: {
                show: true
            }
        },
        crosshair: {
            mode: "x"
        },
        grid: {
            hoverable: true,
            autoHighlight: false
        },
        yaxis: {
            min: -1.2,
            max: 1.2
        }
    });

    var legends = $("#trackingCurves .legendLabel");

    legends.each(function() {
        // fix the widths so they don't jump around
        $(this).css('width', $(this).width());
    });

    var updateLegendTimeout = null;
    var latestPosition = null;

    function updateLegend() {

        updateLegendTimeout = null;

        var pos = latestPosition;

        var axes = plot.getAxes();
        if (pos.x < axes.xaxis.min || pos.x > axes.xaxis.max ||
            pos.y < axes.yaxis.min || pos.y > axes.yaxis.max) {
            return;
        }

        var i, j, dataset = plot.getData();
        for (i = 0; i < dataset.length; ++i) {

            var series = dataset[i];

            // Find the nearest points, x-wise

            for (j = 0; j < series.data.length; ++j) {
                if (series.data[j][0] > pos.x) {
                    break;
                }
            }

            // Now Interpolate

            var y,
                p1 = series.data[j - 1],
                p2 = series.data[j];

            if (p1 == null) {
                y = p2[1];
            } else if (p2 == null) {
                y = p1[1];
            } else {
                y = p1[1] + (p2[1] - p1[1]) * (pos.x - p1[0]) / (p2[0] - p1[0]);
            }

            legends.eq(i).text(series.label.replace(/=.*/, "= " + y.toFixed(2)));
        }
    }

    $("#trackingCurves").bind("plothover", function(event, pos, item) {
        latestPosition = pos;
        if (!updateLegendTimeout) {
            updateLegendTimeout = setTimeout(updateLegend, 50);
        }
    });



    // Real-time updates

    var data = [],
        totalPoints = 300;

    function getRandomData() {

        if (data.length > 0)
            data = data.slice(1);

        // Do a random walk

        while (data.length < totalPoints) {

            var prev = data.length > 0 ? data[data.length - 1] : 50,
                y = prev + Math.random() * 10 - 5;

            if (y < 0) {
                y = 0;
            } else if (y > 100) {
                y = 100;
            }

            data.push(y);
        }

        // Zip the generated y values with the x values

        var res = [];
        for (var i = 0; i < data.length; ++i) {
            res.push([i, data[i]])
        }

        return res;
    }

    // Set up the control widget

    var updateInterval = 30;
    $("#updateInterval").val(updateInterval).change(function() {
        var v = $(this).val();
        if (v && !isNaN(+v)) {
            updateInterval = +v;
            if (updateInterval < 1) {
                updateInterval = 1;
            } else if (updateInterval > 2000) {
                updateInterval = 2000;
            }
            $(this).val("" + updateInterval);
        }
    });

    var plot = $.plot("#realTime", [getRandomData()], {
        series: {
            shadowSize: 0 // Drawing is faster without shadows
        },
        yaxis: {
            min: 0,
            max: 100
        },
        xaxis: {
            show: false
        },
        lines: {
            fill: true
        }
    });

    function update() {

        plot.setData([getRandomData()]);

        // Since the axes don't change, we don't need to call plot.setupGrid()

        plot.draw();
        setTimeout(update, updateInterval);
    }

    update();

});


var data = [],
    series = Math.floor(Math.random() * 6) + 3;

for (var i = 0; i < series; i++) {
    data[i] = {
        label: "Series" + (i + 1),
        data: Math.floor(Math.random() * 100) + 1
    }
}

var pieChart1 = $("#pieChart1");



pieChart1.unbind();

$("#title").text("Default pie chart");
$("#description").text("The default pie chart with no options set.");

$.plot(pieChart1, data, {
    series: {
        pie: {
            show: true
        }
    }
});

var pieChart2 = $("#pieChart2");

$.plot(pieChart2, data, {
    series: {
        pie: {
            innerRadius: 0.5,
            show: true
        }
    }
});

var pieChart3 = $("#pieChart3");

$.plot(pieChart3, data, {
    series: {
        pie: {
            show: true,
            radius: 1,
            label: {
                show: true,
                radius: 3 / 4,
                formatter: labelFormatter,
                background: {
                    opacity: 0.5
                }
            }
        }
    },
    legend: {
        show: false
    }
});

var pieChart4 = $("#pieChart4");

$.plot(pieChart4, data, {
    series: {
        pie: {
            show: true,
            radius: 1,
            tilt: 0.5,
            label: {
                show: true,
                radius: 1,
                formatter: labelFormatter,
                background: {
                    opacity: 0.8
                }
            },
            combine: {
                color: "#999",
                threshold: 0.1
            }
        }
    },
    legend: {
        show: false
    }
});

setCode([
    "$.plot('#pieChart4', data, {",
    "    series: {",
    "        pie: {",
    "            show: true,",
    "            radius: 1,",
    "            tilt: 0.5,",
    "            label: {",
    "                show: true,",
    "                radius: 1,",
    "                formatter: labelFormatter,",
    "                background: {",
    "                    opacity: 0.8",
    "                }",
    "            },",
    "            combine: {",
    "                color: '#999',",
    "                threshold: 0.1",
    "            }",
    "        }",
    "    },",
    "    legend: {",
    "        show: false",
    "    }",
    "});",
]);

function labelFormatter(label, series) {
    return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
}

function setCode(lines) {
    $("#code").text(lines.join("\n"));
}