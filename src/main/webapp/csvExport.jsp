<%@ page language="java"
	import="java.util.*,java.io.*,jxl.write.WritableWorkbook,jxl.Workbook,jxl.write.WritableSheet,jxl.write.Label"
	pageEncoding="UTF-8"%>
<%
	try {
		String city = "活动成绩";
		String grade = "成绩";
 
		response.setContentType("application/vnd.ms-excel"); //保证不乱码
 
		String fileName = city + "数据.csv";
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
		Label label1 = new Label(0, 0, "活动号");
		// 将定义好的单元格添加到工作表中
		sheet1.addCell(label1);
		//第二列第一行
		Label label2 = new Label(1, 0, "活动名");
		sheet1.addCell(label2);
		//第三列第一行
		Label label3 = new Label(2, 0, "学号");
		sheet1.addCell(label3);
		Label label4 = new Label(3, 0, "姓名");
		sheet1.addCell(label4);
		Label label5 = new Label(4, 0, "组号");
		sheet1.addCell(label5);
		Label label6 = new Label(5, 0, "分数");
		sheet1.addCell(label6);
		javax.sql.rowset.WebRowSet rs=sqldb.DBtool.query("select a.ano,aname,sno,sname,gno,score from grade a,activity b where a.ano=b.ano order by ano");
		String aname="",sname="",sno="";
		int i=1;
		int ano=0,gno=0;
		float score=0;
		while(rs.next()){
			aname=rs.getString("aname");
			sname=rs.getString("sname");
			sno=rs.getString("sno");
			ano=rs.getInt("ano");
			String ano_s=String.valueOf(ano);
			gno=rs.getInt("gno");
			String gno_s=String.valueOf(gno);
			score=rs.getFloat("score");
			String score_s=String.valueOf(score);
			System.out.println(ano+" "+aname+" "+sno+" "+sname+" "+gno+" "+score);
			for(int j=0 ;j<6 ;j++) { //控制列数
				if(j==0) {
					Label label = new Label(j, i, ano_s);
					sheet1.addCell(label);
				}
				if(j==1) {
					Label label = new Label(j, i, aname);
					sheet1.addCell(label);
				}
				if(j==2) {
					Label label = new Label(j, i, sno);
					sheet1.addCell(label);
				}	
				if(j==3) {
					Label label = new Label(j, i, sname);
					sheet1.addCell(label);
				}	
				if(j==4) {
					Label label = new Label(j, i, gno_s);
					sheet1.addCell(label);
				}	
				if(j==5) {
					Label label = new Label(j, i, score_s);
					sheet1.addCell(label);
				}	
			}
			i++;
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