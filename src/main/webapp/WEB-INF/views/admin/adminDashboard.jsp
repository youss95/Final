<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dash-board</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');



        body {
            background-color: #7389b3;
        }


        .container {
            margin-top: 100px;
            max-width: 1000px;
        }

        .wrapper {
            max-width: 900px;
            margin: auto;

        }

        .row {
            padding: 30px;
            text-align: center;
            border-bottom: 1.5px dotted rgb(101, 112, 150);
        }

        .title {
            background-color: rgb(213, 218, 235);
            color: black;
            height: 95px;
        }

        .table {
            padding-top: 12%;
        }

        table {
            width: 98%;
            height: 60%;
            margin: auto;
        }

        div[class*=col] {
            text-align: center;
        }

        canvas {
            width: 98%;
        }
    </style>
</head>

<body>
    <div class="container p-5 shadow bg-white rounded">
        <div class="wrapper">
            <div class="row header">
                <div class="col-12 title">
                    <h1 style="line-height: 100px;font-family: 'Noto Sans KR', sans-serif;">관리자 대시보드</h1>
                </div>
            </div>
            <div class="row total">
                <div class="col-6 table" style="text-align: center;">
                    <table>
                        <tr>
                            <td>총 가입자수</td>
                            <td>${total}</td>
                        </tr>
                        <tr>
                            <td>일반 가입자수</td>
                            <td>${totalC}</td>
                        </tr>
                        <tr>
                            <td>업체 가입자수</td>
                            <td>${totalB}</td>
                        </tr>
                    </table>
                </div>
                <div class="col-6 line">
                    <canvas id="totalChange" height="350" style="display:inline-block;"></canvas>
                </div>
            </div>
            <div class="row connect">
                <div class="col-12 line">
                    <canvas id="connectBiner" height="350" style="display:inline-block;"></canvas>
                </div>
            </div>
            <div class="row client">
                <div class="col-6 graph">
                    <canvas id="clientPerMonth" height="350" style="display:inline-block;"></canvas>
                </div>
                <div class="col-6 graph">
                    <canvas id="clientAges" height="350" style="display:inline-block;"></canvas>
                </div>
            </div>
            <div class="row business">
                <div class="col-6 graph">
                    <canvas id="businessPerMonth" height="350" style="display:inline-block;"></canvas>
                </div>
                <div class="col-6 line">
                    <canvas id="reservation" height="350" style="display:inline-block;"></canvas>
                </div>
            </div>
        </div>
    </div>


    <script>

        var tc = document.getElementById('totalChange').getContext('2d');
        var totalChange = new Chart(tc, {
            type: 'pie',
            data: {
                labels: [<c:forEach var="item" items="${clietPerNationLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${clietPerNationCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',

                    ],
                    borderColor: [ //막대 테두리 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                responsive: false,
                plugins: {


                       animation: {
                           animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                           animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                              },
                            
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '국가별 가입자',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
            
                },
                maintainAspectRatio:false,
            }
        });

        var cb = document.getElementById('connectBiner').getContext('2d');
        var connectBiner = new Chart(cb, {
            type: 'line',
            data: {
                labels: [<c:forEach var="item" items="${totalPerMonthLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${totalPerMonthCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',

                    ],
                    borderColor: [ //막대 테두리 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '월별 총 가입자수',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
                },

                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var cpm = document.getElementById('clientPerMonth').getContext('2d');
        var clientPerMonth = new Chart(cpm, {
            type: 'bar',
            data: {
                labels: [<c:forEach var="item" items="${clientPerMonthLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${clientPerMonthCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                    	'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [ //막대 테두리 색상
                    	'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '월별 일반 회원 가입자 수',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
                },

                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        var ca = document.getElementById('clientAges').getContext('2d');
        var clientAges = new Chart(ca, {
            type: 'bar',
            data: {
                labels: [<c:forEach var="item" items="${clientAgesLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${clientAgesCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [ //막대 테두리 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: false,
                plugins: {
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '일반 회원 가입자 연령',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
                },

                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        var bpm = document.getElementById('businessPerMonth').getContext('2d');
        var businessPerMonth = new Chart(bpm, {
            type: 'bar',
            data: {
                labels: [<c:forEach var="item" items="${businessPerMonthLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${businessPerMonthCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [ //막대 테두리 색상
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '월별 업체 회원 가입자 수',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
                },

                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        var rsv = document.getElementById('reservation').getContext('2d');
        var reservation = new Chart(rsv, {
            type: 'line',
            data: {
                labels: [<c:forEach var="item" items="${reservationLabel}"> 
                "${item}",
                </c:forEach>],
                datasets: [{
                    label: '# of Votes', // 데이터 시트 제목
                    data: [<c:forEach var="item" items="${reservationCounts}"> 
                    "${item}",
                    </c:forEach>], //데이터 값
                    backgroundColor: [ //막대 색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',

                    ],
                    borderColor: [ //막대 테두리 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //막대 테두리 굵기
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: { // [차트 타이틀 지정 실시]
                        display: true,
                        text: '월별 총 예약자수',
                        color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                        font: { // [타이틀 폰트 스타일 변경]
                            family: 'Comic Sans MS',
                            size: 20,
                            weight: 'bold',
                            lineHeight: 1.2,
                        },
                        padding: { top: 20, left: 0, right: 0, bottom: 0 }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>


</body>
</html>