<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jQuery-2.2.0.min.js"></script>
    <link rel="stylesheet" href="css/jquery-ui.css">
   
    <script src="js/jquery-ui.js"></script>
    <script>
 
        // 此处是日历组件
        $( function() {
            $( "#datepicker" ).datepicker();
        } );

        //动态显示当前时间，无需修改
        var timerID = null;
        var timerRunning = false;
        function stopclock (){
        if(timerRunning)
        clearTimeout(timerID);
        timerRunning = false;}
        function startclock () {
        stopclock();
        showtime();}
        function showtime () {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var seconds = now.getSeconds()
        var timeValue = "" +((hours >= 12) ? "下午 " : "上午 " )
        timeValue += ((hours >12) ? hours -12 :hours)
        timeValue += ((minutes < 10) ? ":0" : ":") + minutes
        timeValue += ((seconds < 10) ? ":0" : ":") + seconds
        document.clock.thetime.value = timeValue;
        timerID = setTimeout("showtime()",1000);
        timerRunning = true;}
    </script>
</head>
<body>
    <div id="areascontent">
        <div class="rows" style="margin-bottom: 0.9%; overflow: hidden;">
            <div style="float: left; width: 69.2%;">
                <div style="height: 280px; border: 1px solid #e6e6e6; overflow: hidden;">
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #578ebe;">
                            <div class="stat-icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <h2 class="m-top-none">10<span>个</span></h2>
                            <h5>论坛回复未读</h5>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #e35b5a;">
                            <h2 class="m-top-none">1<span>条</span></h2>
                            <h5>通知信息未读</h5>
                            <div class="stat-icon">
                                <i class="fa fa-bell"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #44b6ae;">
                            <h2 class="m-top-none">1<span>封</span></h2>
                            <h5>假条未读/假条回复</h5>
                            <div class="stat-icon">
                                <i class="fa fa-envelope-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #8775a7; margin-right: 11px;">
                            <h2 class="m-top-none">1<span>条</span></h2>
                            <h5>提醒待查看</h5>
                            <div class="stat-icon">
                                <i class="fa fa-gavel"></i>
                            </div>
                        </div>
                    </div>
                 
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #14aae4; margin-bottom: 0px;">
                            <h2 class="m-top-none">6<span>件</span></h2>
                            <h5>审批待查看</h5>
                            <div class="stat-icon">
                                <i class="fa fa-file-text-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color: #949FB1; margin-bottom: 0px;">
                            <h2 class="m-top-none">355<span>件</span></h2>
                            <h5>论坛新鲜事</h5>
                            <div class="stat-icon">
                                <i class="fa fa-coffee"></i>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            <!-- 此处是日历显示区域 -->
            <div style="float: right; width: 30%;">
                <div style="height: 280px; border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-calendar-o fa-lg" style="padding-right: 5px;"></i>日历</div>
                        <div class="panel-body">
                           
                            <div id="datepicker"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
            <div style="float: left; width: 69.2%;">
                <div style="border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-eye fa-lg" style="padding-right: 5px;"></i>公司情况</div>
                        <div class="panel-body">
    
                            
            <div class="rows" style="overflow: hidden;">
            <div style="float: left; width: 49%; margin-right: 0.8%;margin-left:2px;">
                <div style=" border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><a href="javascript:void(0)"><i class="fa fa-send fa-lg" style="padding-right: 5px;"></i>论坛新闻</a></div>
                        <div class="panel-body">
                            <ul>
                            	<c:forEach var="topic" items="${applicationScope.topicList }">
	                                <li><a href="ReplyListServlet?topicId=${topic.id }" target="right">${topic.title }</a><span class="time">${topic.postTime }</span></li>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: left; width: 49%;margin-left:5px;">
                <div style=" border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><a href="javascript:void(0)"><i class="fa fa-rss fa-lg" style="padding-right: 5px;"></i>新鲜事</a></div>
                        <div class="panel-body">
                            <ul>
                            	<c:forEach var="topic" items="${applicationScope.topicList }">
	                                <li><a href="ReplyListServlet?topicId=${topic.id }" target="right">${topic.title }</a><span class="time">${topic.postTime }</span></li>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; width: 30%;position:absolute;top:290px;right:0;">
                <div style=" border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-user fa-lg" style="padding-right: 5px;"></i>公司领导</div>
                        <div class="panel-body">
                           <table class="leader">
                               <tr>
                                   <td><a href="javascript:void(0)"><img src="images/a.jpg" class="profile" alt=""></a></td>
                                   <td><p>左健&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>CEO</span></p><p>手机号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>18656387266</span></p></td>
                               </tr>
                               <tr>
                                   <td><a href="javascript:void(0)"><img src="images/b.jpg" class="profile" alt=""></a></td>
                                   <td><p>宋文超&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>设计师</span></p><p>手机号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>18119612521</span></p></td>
                               </tr>
                               <tr>
                                   <td><a href="javascript:void(0)"><img src="images/c.jpg" class="profile" alt=""></a></td>
                                   <td><p>聂林超&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>java工程师</span></p><p>手机号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>18792184645</span></p></td>
                               </tr>
                           </table>

                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

    
        </div>
    </div>
    <style>
    /*.panel-heading{height: 50%;}*/
    .ui-datepicker-inline,.ui-datepicker,.ui-widget,.ui-widget-content,.ui-helper-clearfix,.ui-corner-all{width: 88%;height: 70%;margin: 0 auto;/*margin-top: -4px;*/}
    .ui-datepicker-header{width:100%;background-color: #e35b5a;}
        #datepicker{
            /*width: 100%;height: 40%;*/
        }
        /*.hasDatepicker{height: 100px;}*/

        /*公司成员*/
        .leader p{
            margin-left: 40px;font-size: 15px;font-weight: bold;
        }
        /*头像*/
        .profile{
            border-radius:50%;width:90px;height:90px;
            margin-left:20px;margin-top: 10px;
        }
        #copyrightcontent {
            height: 30px;
            line-height: 29px;
            overflow: hidden;
            position: absolute;
            top: 100%;
            margin-top: -30px;
            width: 100%;
            background-color: #fff;
            border: 1px solid #e6e6e6;
            padding-left: 10px;
            padding-right: 10px;
        }

        .dashboard-stats {
            float: left;
            width: 33%;
            margin-top: 11px;

        }

        .dashboard-stats-item {
            position: relative;
            overflow: hidden;
            color: #fff;
            cursor: pointer;
            height: 115px;
            margin-right: 10px;
            margin-bottom: 10px;
            padding-left: 55px;
            padding-top: 25px;
        }

            .dashboard-stats-item .m-top-none {
                margin-top: 5px;
            }

            .dashboard-stats-item h2 {
                font-size: 28px;
                font-family: inherit;
                line-height: 1.1;
                font-weight: 500;
                padding-left: 70px;
            }

                .dashboard-stats-item h2 span {
                    font-size: 12px;
                    padding-left: 5px;
                }

            .dashboard-stats-item h5 {
                font-size: 12px;
                font-family: inherit;
                margin-top: 1px;
                line-height: 1.1;
                padding-left: 70px;
            }


            .dashboard-stats-item .stat-icon {
                position: absolute;
                top: 18px;
                font-size: 50px;
                opacity: .3;
            }

        .dashboard-stats i.fa.stats-icon {
            width: 50px;
            padding: 20px;
            font-size: 50px;
            text-align: center;
            color: #fff;
            height: 50px;
            border-radius: 10px;
        }

        .panel-default {
            border: none;
            border-radius: 0px;
            margin-bottom: 0px;
            box-shadow: none;
            -webkit-box-shadow: none;
        }

            .panel-default > .panel-heading {
                color: #777;
                background-color: #fff;
                border-color: #e6e6e6;
                padding: 10px 10px;
            }

            .panel-default > .panel-body {
                padding: 10px;
                padding-bottom: 0px;
            }

                .panel-default > .panel-body ul {
                    overflow: hidden;
                    padding: 0;
                    margin: 0px;
                    margin-top: -5px;
                }

                    .panel-default > .panel-body ul li {
                        line-height: 27px;
                        list-style-type: none;
                        white-space: nowrap;
                        text-overflow: ellipsis;
                    }

                        .panel-default > .panel-body ul li .time {
                            color: #a1a1a1;
                            float: right;
                            padding-right: 5px;
                        }
    </style>
</body>
</html>