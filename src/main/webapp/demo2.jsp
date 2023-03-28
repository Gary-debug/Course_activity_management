<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
   			function hpExport(obj){
     		obj.href = "excelExport.jsp";
   			return true;
  }
</script>

		<script type="text/javascript">
   			function hpExport2(obj){
     		obj.href = "excelExport2.jsp";
   			return true;
  }
</script>




		<script type="text/javascript">
   			function csvExport(obj){
     		obj.href = "csvExport.jsp";
   			return true;
  }
</script>

		<script type="text/javascript">
   			function csvExport2(obj){
     		obj.href = "csvExport2.jsp";
   			return true;
  }
</script>

<title>班级添加学生</title>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
 <script src="layui-v2.6.8/layui/layui.js"></script>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui-v2.6.8/layui/css/layui.css" tppabs="http://res.layui.com/layui/dist/css/layui.css"  media="all">
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.1.2/echarts.min.js"></script>
  <style>
  
 
  .back{
  width: 100%;
  height:100%;
  position: absolute;
  z-index: -1;
  opacity: 0.3;
}


	

	

	
  </style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");					
String tid = request.getParameter("tid");		
String tpwd = request.getParameter("tpwd");
%>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">教师</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      

    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          tester
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">Your Profile</a></dd>
          <dd><a href="">Settings</a></dd>
          <dd><a href="">Sign out</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
                   <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">班级管理</a>
          <dl class="layui-nav-child">
            <dd><a href="CreateClass.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">创建班级</a></dd>
            <dd><a href="MyClass.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">我的班级</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="manage_act.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">组织活动</a>
          <dl class="layui-nav-child">
            <dd><a href="Adjust_group.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">调整分组</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="control_state.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">管理活动状态</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="fill_score.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">填写活动成绩</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="random_group.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">随机分组</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">管理账号</a>
          <dl class="layui-nav-child">
            <dd><a href="EditPwd.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">修改密码</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="MyProfile.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">修改个人介绍</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">数据管理</a>
          <dl class="layui-nav-child">
            <dd><a href="import_student.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导入数据</a></dd>
          </dl>
          <dl class="layui-nav-child">
            <dd><a href="demo2.jsp?tid=<%=tid%>&tpwd=<%=tpwd%>">导出数据</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <image class='back' src='bg.jpg'></image>
  <div id="container">
    <div >

    <center>
       <form action="" method="post"  >
           <select name="aname">
           <option selected>请选择活动名称</option>
                     <option value="total">汇总</option>
           <%
           javax.sql.rowset.WebRowSet rs=sqldb.DBtool.query("select distinct aname from grade,activity where grade.ano=activity.ano");
            while(rs.next()){
            	out.print("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
            }
                
          
    %>     
           </select>
   
                <input type="submit" class="layui-btn" value="查询成绩">
           <br>
            <a href="#" id="hpExport" onClick="return hpExport(this)"><span style="color:red">按活动导出excel</span></a>
                        <a href="#" id="hpExport" onClick="return hpExport2(this)"><span style="color:green">按学生导出excel</span></a>
            <br>
             <a href="#" id="csvExport" onClick="return csvExport(this)"><span style="color:brown">按活动导出csv</span></a>
             <a href="#" id="csvExport" onClick="return csvExport2(this)">按学生导出csv</a>
        </form>
      </center>
        <%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=UTF-8");
        String str="";
        str=request.getParameter("aname");
        System.out.println("str************************");
       System.out.println(str);
       System.out.println("************************");
        if(str==null||str==""||str.equals("total")) {
        
        
        

//String str="第三章作业";
javax.sql.rowset.WebRowSet rs_ano_aname=sqldb.DBtool.query("select ano,aname from activity");
ArrayList<Integer> ano_list=new ArrayList<>();  //123
ArrayList<String> aname_list=new ArrayList<>(); //os,复习
ArrayList<Double> ave_list=new ArrayList<>();  //85 90
   //gno=1的活动分数
List<List<Double>> gscore=new ArrayList<List<Double>>(); //二维数组分数
while(rs_ano_aname.next()){
	ano_list.add(rs_ano_aname.getInt("ano"));
	aname_list.add(rs_ano_aname.getString("aname"));
}
for(int x:ano_list){
	javax.sql.rowset.WebRowSet rs_score=sqldb.DBtool.query("select distinct gno,score from grade a where a.ano="+x+" ");
	javax.sql.rowset.WebRowSet rs_cnt=sqldb.DBtool.query("select count(distinct gno) cnt from grade a where a.ano="+x+" ");
	System.out.println("select distinct gno,score from grade a where a.ano="+x+" ");
	double sum=0;
	int n=0;
	ArrayList<Double> t=new ArrayList<>();
	while(rs_score.next()){
		sum+=rs_score.getFloat("score");
		t.add(Double.parseDouble(String.valueOf(rs_score.getFloat("score"))));
		System.out.println("tsize: "+t.size());
	}
	gscore.add(t);
	while(rs_cnt.next()){
	    n=rs_cnt.getInt("cnt");
	}
	ave_list.add(sum/n*1.0);
	System.out.println(sum/n);
}
	Double ave[]=ave_list.toArray(new Double[ave_list.size()]);
	String aname[]=aname_list.toArray(new String [aname_list.size()]);
	Double score[][] =new Double[gscore.size()][gscore.get(0).size()];
	Double score2[][] =new Double[gscore.get(0).size()][gscore.size()];
//	System.out.print(score.length+" "+score[0].length);
	System.out.println();
	for(int i=0;i<score.length;i++){
		
		for(int j=0;j<gscore.get(0).size();j++){
			score[i][j]=0.0;
			System.out.print(score[i][j]+" ");
		}
		System.out.println();
		
	}
	for(int i=0;i<score.length;i++){
	
		for(int j=0;j<gscore.get(i).size();j++){
			score[i][j]=gscore.get(i).get(j);
			System.out.print(score[i][j]+" ");
		}
		System.out.println();
		
	}
	System.out.println("转置:   **************************");
	for(int i=0;i<score.length;i++){

		for(int j=0;j<score[0].length;j++){
			score2[j][i]=score[i][j];
			System.out.print(score2[j][i]+" ");
		}
		System.out.println();
		
	}
	for(int i=0;i<score.length;i++)
		System.out.println("score.size:"+score.length);
	for(String s:aname){
		System.out.println(s);
	}
        
        
        
        
        %>
       <script type="text/javascript" charset="utf-8" >
        	    var len=<%=score.length%>;
        	    var ave = new Array();
        	    var aname = new Array();
        	    var gno=new Array;
        	    var sc=new Array(<%=score.length%>);
        	    for(var i=0;i<sc.length;i++){
                    sc[i]=new Array();
        	    }
        	    
        	    
         	     <%for (int i = 0; i < score.length; i++) {%>
              	 gno[<%=i%>] = '<%=i+1%>'+'组'; 
              	 <%}  %>
        	    gno[<%=score.length%>]='均分';
        	    
          	     <%for (int i = 0; i < score.length; i++) {%>
               	 ave[<%=i%>] = <%=ave[i]%>; 
               	 <%}  %>
        	    

       
          	    
           	     <%for (int i = 0; i < aname.length; i++) {%>
                	 aname[<%=i%>] = '<%=aname[i]%>'; 
                	 <%}  %>    
  
                	
        	    
            	  <% for (int i = 0; i < score2.length; i++) {
                      for (int j = 0; j < score2[i].length; j++) {%>
                sc[<%=i%>][<%=j%>] = <%=score2[i][j]%>;
                <%
                    }
                     }%>
        	     
        	     
  
    
        	</script>
 


    <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
     <center>
    <div id="main" style="width: 1000px;height:450px;">
    <script type="text/javascript"  charset=UTF-8">
    var myChart = echarts.init(document.getElementById('main'));
    var option;
    var series=[];
    for(var i = 0;i<len;i++){
        series.push({
          name:gno[i],
            type: 'bar',      
		      data:sc[i],
        });
    }
    series.push({
        name:'均分',
        type: 'line',      
	      data: ave
    });
    option = {
            title: {
                text: '各活动各组分数'
            },
    		  tooltip: {
    		    trigger: 'axis',
    		    axisPointer: {
    		      type: 'cross',
    		      crossStyle: {
    		        color: '#999'
    		      }
    		    }
    		  },
    		  toolbox: {
    		    feature: {
    		      dataView: { show: true, readOnly: false },
    		      magicType: { show: true, type: ['line', 'bar'] },
    		      restore: { show: true },
    		      saveAsImage: { show: true }
    		    }
    		  },
    		  legend: {
    		    data:gno
    		  },
    		  xAxis: [
    		    {
    		  
    		      data:aname,
    		      axisPointer: {
    		        type: 'shadow'
    		      }
    		    }
    		  ],
    		  yAxis: [
    		    {
    		      type: 'value',
    		
    		      min: 0,
    		      max: 100,
    		      interval: 10,
    		      axisLabel: {
    		        formatter: '{value} 分'
    		      }
    		    },
    		   
    		  ],
    		  series: series
    	
    	


    		  
    		};
   myChart.setOption(option);
  
    </script> 
        
        
        
        
        <%} %>
 </center>

<%if(str!=null&&str!=""&&!str.equals("total")){ 
        	//out.println(str);
        	javax.sql.rowset.WebRowSet rs_score=sqldb.DBtool.query("select distinct gno,score from grade a,activity b where b.ano=a.ano and b.aname='"+str+"'");
        	Set<Integer> l1=new HashSet<>();
        	ArrayList<Float> l2=new ArrayList<>();
     
            System.out.println("select distinct  gno,score from grade a,activity b where b.ano=a.ano and b.aname='"+str+"'");
        	while(rs_score.next()){
        		l1.add(rs_score.getInt("gno"));
        		l2.add(rs_score.getFloat("score"));
        	}
        	System.out.println("l1.size:"+l1.size());
        	System.out.println("l2.size:"+l2.size());
        	double sum=0,ave=0;
        	
        	for(int x:l1) System.out.println(x);
        	for(float x:l2) {System.out.println(x);sum+=x;}
        	Integer gno[]=l1.toArray(new Integer[l1.size()]);
        	Float score[]=l2.toArray(new Float[l2.size()]);
        	ave=sum/l1.size();
        	System.out.println(sum+" and "+ave);
        	for(int x:gno) System.out.println("gno:"+x);
        	for(float x:score) System.out.println("score:"+x);
        %>	 <script type="text/javascript">
        	  
        	    var gno = new Array();
        	    var score=new Array();
        	
        	   
        	    <%
        	        for (int i = 0; i < gno.length; i++) {
        	    %>
        	  
        	    gno[<%=i%>] = <%=gno[i]%>;
        	    <%
        	         }
        	     %>

        	     
        	     
        	     <%
        	     for (int i = 0; i < score.length; i++) {
        	 %>

        	 score[<%=i%>] = <%=score[i]%>;
        	
        	 
        	 <%
        	      }
        	  %>
        	  n=<%=gno.length%>;
        	  ave=sum/n*1.0;
        	</script>
 <center>
    	<div id="main" style="width: 800px;height:500px;"></div>
        	 <script type="text/javascript">
        	  var myChart = echarts.init(document.getElementById('main'));
        	  
              // 指定图表的配置项和数据
              var option = {
                  title: {
                      text: '<%=str%>各组分数'
                  },
                  tooltip: {},
                  legend: {
                      data:['分数']
              
           
                  },
                  xAxis: {
                      data: gno
                    
                  
                  },
                  yAxis: {
                	  
                	  max:100,
          			 min:0,
          			type: 'value',
          			minInterval: 10,
                      interval:10, //每次增加几个

                	  axisLine: {
                	      symbol: 'arrow',
                	      lineStyle: {
                	        type: 'dashed'
                	       
                	      }
                	    }
                	  
                  },
                  axisLine: {
                      lineStyle: {
                        color: "#cccccc"
                        // width: 1 //这里是坐标轴的宽度
                      }
                    },
                  series: [{
                      name: '分数',
                      type: 'bar',
                      data: score,
                      itemStyle: {
                          normal: {
                              //这里是重点
                              color: function(params) {
                                  //注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
                                  var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622'];
                                  var index;
                                  //给大于颜色数量的柱体添加循环颜色的判断
                                  if (params.dataIndex >= colorList.length) {
                                     index = params.dataIndex - colorList.length;
                                     return colorList[index];
                                  }
                                  return colorList[params.dataIndex];
                              }
                          }
                      },
                      markLine: {
                          silent: true,
                          lineStyle: {
                            normal: {
                              color: '#01fef9'                   // 这儿设置安全基线颜色
                            }
                          },
                          data: [{
                              type: 'average'
                          }],
                          label: {
                              normal: {
                                formatter: '平均分'           // 这儿设置安全基线
                              }
                            },

                          
                
                    },
                    }],
                  
              };
       
              // 使用刚指定的配置项和数据显示图表。
              myChart.setOption(option);
              
        	    </script>
        	  </div>
        	   </center>
        	    <% 
        	  
        }
        
        
        
        %>


    </div>

</div>


<script src="./layui/layui.js"></script>
<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>
      
</body>
</html>