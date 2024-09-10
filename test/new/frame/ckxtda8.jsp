<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style3 {color: #996600}
-->
</style>
</head>

<body>
<h2>习 题 八 </a></h2>
<p>⒈ <span class="style3">编写绘制 bezier 曲线的程序。 </span></p>
<p align="left">#include &lt;math.h&gt; </p>
<p align="left">/* 计算Bernstein调和函数值,B i,n (t)*/ </p>
<p align="left">float Basis( int n, int i, float t) </p>
<p align="left">{ </p>
<p align="left">float basis=1; </p>
<p align="left">float ti; </p>
<p align="left">float tni; </p>
<p align="left">int k=n-i; </p>
<p align="left">if (i&gt;k) </p>
<p align="left">{ </p>
<p align="left">while (n&gt;i) </p>
<p align="left">{ </p>
<p align="left">basis*=n; </p>
<p align="left">--n; </p>
<p align="left">if (k&gt;1) </p>
<p align="left">{ </p>
<p align="left">basis/=k; </p>
<p align="left">--k; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">else </p>
<p align="left">{ </p>
<p align="left">while (n&gt;k) </p>
<p align="left">{ </p>
<p align="left">basis*=n; </p>
<p align="left">--n; </p>
<p align="left">if (i&gt;1) </p>
<p align="left">{ </p>
<p align="left">basis/=i; </p>
<p align="left">--i; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">if (t==0. &amp;&amp; i == 0) ti=1.0; else ti = pow(t,i); </p>
<p align="left">if (n==i &amp;&amp; t==1.) tni=1.0; else tni = pow((1-t),(n-i)); </p>
<p align="left">basis*=ti*tni; /* calculate Bernstein basis function */ </p>
<p align="left">return basis; </p>
<p align="left">} </p>
<p align="left">/*插值生成 bezier曲线 </p>
<p align="left">npts：控制点个数 </p>
<p align="left">b：多边形控制点坐标数组，b[3*i+1]为x分量；b[3*i+2]为y分量；b[3*i+3]为z分量 </p>
<p align="left">cpts：需要计算的曲线点个数 </p>
<p align="left">p：最后所得曲线点的坐标数组，作为结果返回 </p>
<p align="left">*/ </p>
<p align="left">void bezier( int npts, float b[], int cpts, float p[]) </p>
<p align="left">{ </p>
<p align="left">int i,j,k; </p>
<p align="left">int icount,jcount; </p>
<p align="left">float step,t; </p>
<p align="left">icount = 0; </p>
<p align="left">t = 0; </p>
<p align="left">step = 1.0/(( float )(cpts -1)); </p>
<p align="left">for (k = 1; k&lt;=cpts; k++) </p>
<p align="left">{ </p>
<p align="left">if ((1.0 - t) &lt; 5e-6) t = 1.0; </p>
<p align="left">for (j = 1; j &lt;= 3; j++) </p>
<p align="left">{ </p>
<p align="left">jcount = j; </p>
<p align="left">p[icount+j] = 0.; </p>
<p align="left">for (i = 1; i &lt;= npts; i++) </p>
<p align="left">{ </p>
<p align="left">p[icount + j] = p[icount + j] + Basis(npts-1,i-1,t)*b[jcount]; </p>
<p align="left">jcount = jcount + 3; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">icount = icount + 3; </p>
<p align="left">t = t + step; </p>
<p align="left">} </p>
<p align="left">} </p>
<p>⒉ <span class="style3">已知 Bezier 曲线 <img width="325" height="118" src="ckxtda8_clip_image002.gif">， <img width="57" height="21" src="ckxtda8_clip_image004.gif">， <img width="80" height="22" src="ckxtda8_clip_image006.gif">， <img width="85" height="22" src="ckxtda8_clip_image008.gif">， <img width="72" height="22" src="ckxtda8_clip_image010.gif">，利用几何作图法（又称 De Casteljau 算法）计算 t=0.25 处 Bezier 曲线上的点。 </span></p>
<p>P01=(16, 32), P11=(80, 128), P21=(144, 96) </p>
<p>P02=(32, 56), P12=(96, 120) </p>
<p>P03=(48, 72) </p>
<p>因此该点坐标为 (48, 72) </p>
<p>&nbsp;</p>
<p>⒊ <span class="style3">下列关于 Bezier 曲线的性质，哪个是正确的？</span> A ， C ， D </p>
<p>&#149;&nbsp; 在起点和终点处的切线方向和控制多边形第一条边和最后一条边的方向一致； </p>
<p>&#149;&nbsp; 在端点处的 R 阶导数，仅与 R 个相邻个控制顶点有关； </p>
<p>&#149;&nbsp; 若保持原全部顶点的位置不变，只是把次序颠倒过来，则新的 Bezier 曲线形状不变，但方向相反。； </p>
<p>&#149;&nbsp; 曲线的形状既与控制顶点的位置有关，同时依赖于坐标系的选择； </p>
<p>&nbsp;</p>
<p>⒋ <span class="style3">如何对 NURBS 曲线升阶？</span> </p>
<p>设 <img width="145" height="40" src="ckxtda8_clip_image012.gif">为定义在 <img width="115" height="21" src="ckxtda8_clip_image014.gif">上的 <img width="16" height="17" src="ckxtda8_clip_image016.gif">次 NURBS 曲线，现在需要升阶至 <img width="36" height="21" src="ckxtda8_clip_image018.gif">： </p>
<p><img width="255" height="40" src="ckxtda8_clip_image020.gif"></p>
<p>令 <img width="85" height="20" src="ckxtda8_clip_image022.gif">表示内部各节点的重复度： </p>
<p><img width="339" height="40" src="ckxtda8_clip_image024.gif"></p>
<p>则： </p>
<p><img width="340" height="64" src="ckxtda8_clip_image026.gif"></p>
<p><img width="93" height="19" src="ckxtda8_clip_image028.gif"></p>
<p><img width="161" height="67" src="ckxtda8_clip_image030.gif"></p>
<p>⒌ NURBS 曲线的节点插入算法。 </p>
<p>设 <img width="155" height="45" src="ckxtda8_clip_image032.gif">为定义在 <img width="115" height="21" src="ckxtda8_clip_image033.gif">上的 NURBS 曲线，令 <img width="84" height="21" src="ckxtda8_clip_image035.gif">；现在将 <img width="15" height="17" src="ckxtda8_clip_image037.gif">插入到 <em>U </em>中，构造新的节点矢量： </p>
<p><img width="360" height="24" src="ckxtda8_clip_image039.gif"></p>
<p>其上的 NURBS 曲线为： </p>
<p align="center"><img width="155" height="45" src="ckxtda8_clip_image041.gif"></p>
<p>由此可得： </p>
<p align="center"><img width="220" height="117" src="ckxtda8_clip_image043.gif"></p>
</body>
</html>
