<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    /*#c1,#c2 {*/
    /*    width:40%;*/
    /*    height:400px;*/
    /*    border:2px solid blue;*/
    /*    margin: 0 10px;*/
    /*}*/
</style>

<script>
    let dashchart = {
        init:function (){
            this.getdata1();
            this.getdata2();
        },
        getdata1:function (){
            $.ajax({
                url: '/dashchart01',
                success: function(result){
                    dashchart.display1(result);
                }
            })
        },
        getdata2:function (){
            $.ajax({
                url: '/dashchart02',
                success: function(result){
                    dashchart.display2(result);
                }
            })
        },
        display1:function (result){    //https://www.highcharts.com/demo/3d-pie-donut
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });
        },
        display2:function (result){
            const chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'c2',
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                xAxis: {
                    categories: ['Toyota', 'BMW', 'Volvo', 'Audi', 'Peugeot', 'Mercedes-Benz',
                        'Volkswagen', 'Polestar', 'Kia', 'Nissan']
                },
                yAxis: {
                    title: {
                        enabled: false
                    }
                },
                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: 'Cars sold: {point.y}'
                },
                title: {
                    text: 'Sold passenger cars in Norway by brand, January 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://ofv.no/registreringsstatistikk"' +
                        'target="_blank">OFV</a>',
                    align: 'left'
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                series: [{
                    data: result.datas,
                    colorByPoint: true
                }]
            });

            function showValues() {
                document.getElementById('alpha-value').innerHTML = chart.options.chart.options3d.alpha;
                document.getElementById('beta-value').innerHTML = chart.options.chart.options3d.beta;
                document.getElementById('depth-value').innerHTML = chart.options.chart.options3d.depth;
            }

        // Activate the sliders
            document.querySelectorAll('#sliders input').forEach(input => input.addEventListener('input', e => {
                chart.options.chart.options3d[e.target.id] = parseFloat(e.target.value);
                showValues();
                chart.redraw(false);
            }));

            showValues();

        }
    };

    $(function (){
        dashchart.init();
    })

</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>Dash Chart</h3>
        <div class="row">
            <div class="col-sm-6" id="c1"></div>
            <div class="col-sm-6" id="c2"></div>
        </div>
    </div>
</div>
