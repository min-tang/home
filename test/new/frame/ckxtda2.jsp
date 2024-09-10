<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #996600}
-->
</style>
</head>

<body>
<h2>习 </a>题 二 </h2>
<p>⒈ <span class="style1">DDA 法生成直线的基本原理是什么？ </span></p>
<p>DDA 是数字微分分析式 (Digital Differential Analyser) 的缩写。设直线的起点为 (x1, y1) ，终点为 (x2, y2) ，则斜率 m 为 </p>
<p align="center"><img width="107" height="41" src="ckxtda2_clip_image002.gif"></p>
<p>直线中的每一点坐标都可以由前一点坐标变化一个增量 (Dx, Dy) 而得到，即表示为递归式 </p>
<p align="center">xi+1 = xi + Dx </p>
<p align="center">yi+1 = yi + Dy </p>
<br>
<p>并有关系 </p>
<p align="center">Dy = m ? Dx </p>
<p>递归式的初值为直线的起点 (x1, y1) ，这样，就可以用加法来生成一条直线。 </p>
<p>&nbsp;</p>
<p>⒉ <span class="style1">为什么说 Bresenham 画圆的算法效率较高？ </span></p>
<p>Bresenham 圆周生成算法思想如下： </p>
<p>⒈ 求误差初值， p1=3 - 2r ， i=1 ，画点 (0, r) ； </p>
<p>⒉ 求下一个光栅位置，其中 xi+1=xi+1 ，如果 pi&lt;0 则 yi+1=yi ，否则 yi+1=yi - 1 ； </p>
<p>⒊ 画点 (xi+1, yi+1) ； </p>
<p>⒋ 计算下一个误差，如果 pi&lt;0 则 pi+1=pi+4xi+6 ，否则 pi+1=pi+4(xi - yi)+10 ； </p>
<p>⒌ i=i+1 ，如果 x=y 则结束，否则返回步骤 2 。 </p>
<p>虽然式 (2.7) 表示 pi+1 的算法似乎很复杂，但因为 yi+1 只能取值 yi 或 yi - 1 ，因此在算法中，第 4 步的算式变得很简单，只需做加法和乘 4 的乘法。因此圆的 Bresenham 算法运行速度也是很快的，并适宜于在硬件上实现。 </p>
<p>&nbsp;</p>
<p>⒊ <span class="style1">简述二维图形剪裁的基本原理及可选用的裁剪策略。 </span></p>
<p>当窗口被确定之后，只有窗口内的物体才能被显示出来，窗口外的物体都是不可见的。因此，窗口外物体可以不参加标准化转换及随后的显示操作，从而节约处理时间。裁剪 (clipping) 是裁去窗口之外物体或物体部分的一种操作。 </p>
<p>剪裁分为直线剪裁，多边形剪裁，字符串剪裁。 </p>
<p>&nbsp;</p>
<p>⒋<span class="style1"> 画直线的算法有哪几种？画圆弧的算法有哪几种？写一个画带线宽的虚线的程序。</span> </p>
<p>通常画直线的方法有三种：（ 1 ）逐点比较法；（ 2 ）数值微分法；（ 3 ） Bresenham 算法。画弧线的常用方法有：（ 1 ）逐点比较法；（ 2 ）角度 DDA 法；（ 3 ） Bresenham 算法。一个基于数值微分法的带线宽的画虚线的参考程序如下： </p>
<p>Draw_wide_dashed(int x0,int y0,int x1,int y1,int width,int color) </p>
<p>{ </p>
<p>int j; </p>
<p>float dx,dy,k,x,y,startx,starty; </p>
<p>dx=abs(x1-x0); </p>
<p>dy=abs(y1-y0); </p>
<p>k=dy/dx; </p>
<p>if (abs(k)&lt;=1)// 如果斜率不大于 1 ，则 x 的增长大于 y 的增长。 </p>
<p>{ </p>
<p>startx=x0&lt;x1?x0:x1; </p>
<p>for (j=width;j&gt;0;j++) </p>
<p>{ y=starty;// </p>
<p>for(x=startx;x&lt;startx+dx;x+=2) </p>
<p>{ </p>
<p>drawpixel(x,int(y+0.5),color); </p>
<p>y=y+k; </p>
<p>}; </p>
<p>starty=starty+1;// 每次画一条宽为 1 的斜线时重新调整起点 </p>
<p>startx=startx-1/k; </p>
<p>} </p>
<p>} </p>
<p>else </p>
<p>{ </p>
<p>starty=y0&lt;y1?y0:y1; </p>
<p>for (j=width;j&gt;0;j++) </p>
<p>{ x=startx; </p>
<p>for(y=starty;y&lt;starty+dy;y+=2) </p>
<p>{ </p>
<p>drawpixel(int(x+0.5),y,color); </p>
<p>x=x+1/k; </p>
<p>}; </p>
<p>startx=startx+1; </p>
<p>starty=starty-1/k; </p>
<p>} </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>⒌ <span class="style1">写一个画饼分图的程序，用不同的颜色填充各个区域。</span> </p>
<p>Draw_pie(int x, int y,float radius ,float *percent) </p>
<p>{ </p>
<p>float seed_x,seed_y; </p>
<p>int color,i; </p>
<p>color=0; </p>
<p>float angle=0; </p>
<p>draw_circle(x,y,radius); </p>
<p>draw_line(x,y,x+radius,y); </p>
<p>for(i=0;percent[i]&lt;=0;i++) </p>
<p>{ seed_x=x+radius*cos(angle+PI*percent[i]/100); </p>
<p>seed_y=y+radius*sin(angle+PI*percent[i]/100); </p>
<p>/* 在新的扇区中间找一个种子点作为填色之用 */ </p>
<p>angle=angle+2*PI*percent[i]/100; </p>
<p>draw_line(x,y,x+radius*cos(),y+radius*sin()); </p>
<p>seed_filling(seed_x,seed_y,color++,BACKGROUND_COLOR); </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>⒍ <span class="style1">写一个显示一串字符的程序。</span> </p>
<p>显示一串字符的参考程序如下： </p>
<p>Graph_puts(int x0,int y0,char *string) </p>
<p>{ </p>
<p>char current_char; </p>
<p>int font_mask[FONT_WIDTH][FONT_HEIGHT]; </p>
<p>int i,j; </p>
<p>for (j=0;string[j]!=&quot;\0&quot;;j++) </p>
<p>{current_char=string[j]; </p>
<p>get_font(font_mask,current_char);// 从字库里取得当前的字模 </p>
<p>for(i=0;i&lt;FONT_WIDTH,i++) </p>
<p>for(j=0;j&lt;FONT_HEIGHT,j++) </p>
<p>if (font_mask[i][j]) </p>
<p>write_pixel(x0+i,y0+j,FONT_COLOR); </p>
<p>else </p>
<p>write_pixel(x0+i,y0+j,BACKGROUND_COLOR); </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>⒎ <span class="style1">写出几种线裁剪算法。写出几种多边形裁剪算法。</span> </p>
<p>1 、矢量裁剪法 </p>
<p>2 、编码裁剪法 </p>
<p>3 、中点分割裁剪法 </p>
<p>多边形的裁剪算法： </p>
<p>1 、逐边裁剪法 </p>
<p>2 、双边裁剪法 </p>
<p>⒏ 试写出能获得整数的 Bresenham 画线算法。（提示：假定直线的斜率在 0 和 1 之间，可用任何程序设计语言或伪语言表达。） </p>
<p>⒐ 利用线段裁剪的 Cohen-Sutherland 算法，对线段 <em>AB </em>进行裁剪（ <em>CDEF </em>为裁剪框，直线 <em>AB </em>部分地穿过此框）。简述裁剪的基本过程。 </p>
<p>算法的主要思想是，依次对每条直线 P1P2 作如下处理： </p>
<p>⑴ 对直线两端点 P1 、 P2 按各自所在的区域编码。 P1 和 P2 的编码分别记为 </p>
<p>C1(P1)={a1, b1, c1, d1} ， C2(P2)={a2, b2, c2, d2} </p>
<p>其中， ai 、 bi 、 ci 、 di 取值范围为 {1, 0} ， i ∈ {1, 2} 。 </p>
<p>⑵ 如果 ai=bi=ci=di=0 ，则显示整条直线，取出下一条直线，返步骤 (1) 。否则，进入步骤 (3) 。 </p>
<p>⑶ 如果 |a1 - a2|=1 ，则求直线与窗上边 (y=yw-max) 的交点，并删去交点以上部分。如果 |b1 - b2|=1 ，则求直线与窗下边 (y=yw-min) 的交点，并删去交点以下部分。如果 |c1 - c2|=1 ，则求直线与窗右边 (x=xw-max) 的交点，并删去交点以右部分。如果 |d1 - d2|=1 ，则求直线与窗左边 (x=xw-min) 的交点，并删去交点以左部分。 </p>
⑷ 返步骤 (1) 。
</body>
</html>
