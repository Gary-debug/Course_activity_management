<%@ page language="java"
	import="java.util.*,java.io.*,jxl.write.WritableWorkbook,jxl.Workbook,jxl.write.WritableSheet,jxl.write.Label"
	pageEncoding="UTF-8"%>
	<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%



try {
	HashMap<String,ArrayList<Integer>> s=new HashMap<>();
	javax.sql.rowset.WebRowSet rs_sname=sqldb.DBtool.query("select distinct sno,sname from grade order by sno");
	javax.sql.rowset.WebRowSet rs_activity=sqldb.DBtool.query("select  ano,aname from activity order by ano");   //activity_aname_ano     ano->aname
	int act_no=0;
	HashMap<Integer,String> ano_to_aname=new HashMap<>();
	while(rs_activity.next()){
		act_no++;
		ano_to_aname.put(rs_activity.getInt("ano"),rs_activity.getString("aname") );       //ano_to_aname[1]="os作业"
		
	}
	HashMap<String,String> sname_no=new HashMap<>();     //sname_no   sno->sname
	HashMap<String,Integer> sname_index=new HashMap<>();    // sname_index["Austin"]=0;
	int cnt=0;
	while(rs_sname.next()){
		String t1=rs_sname.getString("sno");
		String t2=rs_sname.getString("sname");
		sname_index.put(t2, cnt++);
		sname_no.put(t1,t2);
		System.out.println(t1+" "+t2);
	}
	System.out.println("cnt:    "+cnt+" "+act_no);
	System.out.println("score..................");
	Double score[][]=new Double [cnt][act_no];
	for(int i=0;i<cnt;i++){
		for(int j=0;j<act_no;j++){
			score[i][j]=0.0;
		}
	}
	javax.sql.rowset.WebRowSet rs_getscore=sqldb.DBtool.query("select distinct sno,sname,ano,score from grade order by sno");
	while(rs_getscore.next()){	
		score[sname_index.get(rs_getscore.getString("sname"))][rs_getscore.getInt("ano")-1]=Double.valueOf(rs_getscore.getFloat("score"));
	}

	System.out.println("final_score...........");
	for(int i=0;i<cnt;i++){
		for(int j=0;j<act_no;j++){
			System.out.print(score[i][j]+" ");
		}
		System.out.println();
	}


	
	
	String city = "学生成绩";
	String grade = "成绩";

	response.setContentType("application/vnd.ms-excel"); //保证不乱码

	String fileName = city + "数据.xls";
	/* //到第一个值项是attachment，这是真正的关键，设定了这个值，浏览器就会老老实实地显示另存为对话框，如果这个值设成 inline，则无论怎样浏览器都会自动尝试用已知关联的程序打开文件。
	response.addHeader("Content-Disposition","attachment; filename=\""+ new String(fileName.getBytes("gb2312"),"iso8859-1") + "\""); */
	
	response.setHeader("Content-Disposition", "attachment;"
			+ " filename="
			+ new String(fileName.getBytes(), "ISO-8859-1"));
	OutputStream os = response.getOutputStream();
	out.clear();
	out = pageContext.pushBody(); //这2句一定要，不然会报错。
	// 新建excel的工作薄文件
	WritableWorkbook book = Workbook.createWorkbook(os);
	// 生成名为"第一页"的工作表，参数0表示这是第一页
	WritableSheet sheet1 = book.createSheet("第一页", 0);
	/***********start第一行（各个列的标题）************/
	//第一列第一行(0,0)
	Label label1 = new Label(0, 0, "学号");
	// 将定义好的单元格添加到工作表中
	sheet1.addCell(label1);
	//第二列第一行
	Label label2 = new Label(1, 0, "姓名");
	sheet1.addCell(label2);
	//第三列第一行
    int num=2;
	for(int i=act_no;i>=1;i--){
		Label label3 = new Label(num, 0,ano_to_aname.get(num-1) );
		num++;
		sheet1.addCell(label3);

	}
	javax.sql.rowset.WebRowSet rs_final=sqldb.DBtool.query("select distinct sno, sname from grade order by sno");
	int row=1;
    while(rs_final.next()){
    	String t_sname=rs_final.getString("sname");
    	String t_sno=rs_final.getString("sno");

				Label label = new Label(0, row,t_sno );
				sheet1.addCell(label);
			
    	
				Label label11 = new Label(1, row, t_sname);
				sheet1.addCell(label11);
			
				for(int k=0;k<act_no;k++){
					if(Double.valueOf(score[sname_index.get(t_sname)][k])==0.0){
						Label label_final = new Label(k+2, row, "未参加");
						sheet1.addCell(label_final);
					}
					else{
					Label label_final = new Label(k+2, row, String.valueOf(Double.valueOf(score[sname_index.get(t_sname)][k])));
					sheet1.addCell(label_final);
					}
				}
    		
    		//	double t_score=Double.valueOf(score[row-1][column-2]);
    		//	Label label = new Label(column, row, String.valueOf(t_score));
    		//	sheet1.addCell(label);
    			
				row++;
			    System.out.print("row "+row);
    	}
 

    /***********end第一行（各个列的标题）************/


		
	// 写入数据并关闭文件
	book.write();
	book.close();
	os.close();

} catch (Exception e) {
	System.out.println("生成信息表(Excel格式)时出错：");
	e.printStackTrace();
}








%>
</body>
</html>