<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>

<%!
	Color getRandColor(int fc , int bc)	//给定范围获得随机颜色
	{
		Random random = new Random();
		if(fc>255)	fc=255;
		if(bc>255)	bc=255;

		int r=fc+random.nextInt(bc-fc);
		int g=fc+random.nextInt(bc-fc);
		int b=fc+random.nextInt(bc-fc);

		return new Color(r,g,b);
	}
%>

<%
	//设置页面不缓存
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires",0);

	//在内存中创建图像
	int width=60 , height=20;
	BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);	//Class BufferedImage	java.awt.image.BufferedImage
																						//http://download.oracle.com/javase/6/docs/api/java/awt/image/BufferedImage.html
	//获取图形上下文
	Graphics g = image.getGraphics();

	//生成随机类
	Random random = new Random();

	//设定背景色
	g.setColor(getRandColor(200,250));
	g.fillRect(0,0,width,height);

	//设定字体
	g.setFont(new Font("Times New Roman",Font.PLAIN,18));

	//画边框
	//g.setColor(new Color());
	//g.drawRect(0,0,width-1,height-1);

	//随机产生150条干扰线
	g.setColor(getRandColor(160,200));
	for(int i=0 ; i<150 ; i++)
	{
		int x = random.nextInt(width);
		int y = random.nextInt(height);

		int x1 = random.nextInt(12);
		int y1 = random.nextInt(12);

		g.drawLine(x,y,x+x1,y+y1);
	}

	//取随机的4位数字作为验证码
	String sRand="";
	for(int i=0;i<4;i++)
	{
		String rand = String.valueOf(random.nextInt(10));
		sRand+=rand;

		//将验证码显示到图像中
		g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));

		//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
		g.drawString(rand,13*i+6,16);
	}

	//将验证码存入session
	session.setAttribute("rand",sRand);

	//图像生效
	g.dispose();

	//图像输出到页面
	ImageIO.write(image,"JPEG",response.getOutputStream());
%>