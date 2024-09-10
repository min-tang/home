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
<h2>习 </a>题 三 </h2>
<p>⒈ 试用几种不同顺序的简单几何变换，求出将平面上的以 <em>P </em>1 ( <em>x </em>1 , <em>y </em>1 ) 、 <em>P </em>2 ( <em>x </em>2 , <em>y </em>2 ) 为端点的直线段变换为 <em>x </em>轴的变换矩阵，并说明其等效性。 </p>
<p>⒉ 证明二维点相对 <em>x </em>轴作对称、又相对 <em>y </em>= - <em>x </em>直线作对称变换完全等价于该点相对坐标原点作旋转变换。 </p>
<p>⒊ <span class="style1">分别写出平移、旋转、缩放及其组合的变换矩阵。 </span></p>
<p>（ 1 ） 平移变换： </p>
<p><img width="328" height="131" src="ckxtda3_clip_image002_0000.gif"></p>
<p>其中， <img width="17" height="24" src="ckxtda3_clip_image004.gif">、 <img width="17" height="25" src="ckxtda3_clip_image006.gif">、 <img width="17" height="24" src="ckxtda3_clip_image008.gif">是物体在三个坐标方向上的位移量。 </p>
<p>（ 2 ）旋转变换： </p>
<p>绕 Z 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image010.gif"></p>
<p>绕 X 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image012.gif"></p>
<p>绕 Y 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image014.gif"></p>
<p>如果旋转所绕的轴不是坐标轴，设其为任意两点 p1,p2 所定义的矢量，旋转角度为 θ 。则可由 7 个基本变换组合构成： </p>
<p>&#149;&nbsp; T(-x 1 ,-y 1 ,-z 1 ) ，使 p1, 点与原点重合； </p>
<p>&#149;&nbsp; R x ( α ) ，使轴 p1p2 落入平面 xoz 内； </p>
<p>&#149;&nbsp; R y ( β ) ，使 p1p2 与 z 轴重合； </p>
<p>&#149;&nbsp; R z ( θ ) ，执行绕 p1p2 轴的θ角旋转； </p>
<p>&#149;&nbsp; R y (- β ) ， 作 3 的逆变换； </p>
<p>&#149;&nbsp; R x (- α ) ，作 2 的逆变换； </p>
<p>&#149;&nbsp; T(x 1 ,y 1 ,z 1 ) ，作 1 的逆变换。 </p>
<p>（ 3 ）缩放变换： <strong></strong></p>
<p><img width="327" height="96" src="ckxtda3_clip_image016.gif"></p>
<p>其中 S x ， S y ， S z 是物体在三个方向上的比例变化量。记为 S(S x ,S y ,S z ) 。 </p>
<p>若对于某个非原点参考点 (x f ,y f ,z f ) 进行固定点缩放变换，则通过如下的级联变换实现： </p>
<p>T(-x f ,-y f ,-z f ) . S(S x ,S y ,S z ) . T(x f , y f , z f ) </p>
<p>&nbsp;</p>
<p>⒋ <span class="style1">如何用 几何变换实现坐标系的变换 </a>？ </span></p>
<p>坐标系的变换，亦即将某一坐标系 lcs1 中的点 <img width="76" height="27" src="ckxtda3_clip_image018.gif">变换为另一个坐标系 lcs2 下的坐标 <img width="71" height="27" src="ckxtda3_clip_image020.gif">。若 <img width="243" height="27" src="ckxtda3_clip_image022.gif">， <img width="16" height="19" src="ckxtda3_clip_image024.gif">矩阵的推导分三部。 </p>
<p>&#149;&nbsp; 将 lcs1 中的点变换到世界坐标系的矩阵 <img width="24" height="24" src="ckxtda3_clip_image026.gif">; </p>
<p><img width="280" height="96" src="ckxtda3_clip_image028.gif"></p>
<p>x_axis, y_axis, z_axis 为 lcs1 中 x,y,z 轴矢量在世界坐标系的表示 </p>
<p>org 为 lcs1 中原点在世界坐标系的表示 </p>
<p>&#149;&nbsp; 将世界坐标系的点变换到 lcs2 中的点矩阵 <img width="25" height="24" src="ckxtda3_clip_image030.gif">; </p>
<p><img width="253" height="96" src="ckxtda3_clip_image032.gif"></p>
<p>x_axis, y_axis, z_axis 为 lcs1 中 x,y,z 轴矢量在世界坐标系的表示 </p>
<p>org 为 lcs1 中原点在世界坐标系的表示 </p>
<p>a = - x_axis.x * org.x - x_axis.y * org.y - x_axis.z * org.z </p>
<p>b = - y_axis.x * org.x - y_axis.y * org.y - y_axis.z * org.z </p>
<p>c = - z_axis.x * org.x - z_axis.y * org.y - z_axis.z * org.z </p>
<p>&#149;&nbsp; <img width="16" height="19" src="ckxtda3_clip_image033.gif">= <img width="24" height="24" src="ckxtda3_clip_image034.gif"><img width="25" height="24" src="ckxtda3_clip_image035.gif"></p>
<p>&nbsp;</p>
<p>⒌ <span class="style1">写出透视变换矩阵和各种投影（三视图、正轴测和斜投影）变换矩阵。</span> </p>
<p>透视变换矩阵形式为： <img width="112" height="96" src="ckxtda3_clip_image037.gif"></p>
<p>主视图： <img width="96" height="96" src="ckxtda3_clip_image039.gif">俯视图： <img width="96" height="96" src="ckxtda3_clip_image041.gif"></p>
<p>侧视图： <img width="96" height="96" src="ckxtda3_clip_image043.gif"></p>
<p>正轴测： <img width="195" height="96" src="ckxtda3_clip_image045.gif"></p>
<p>斜投影： <img width="221" height="96" src="ckxtda3_clip_image047.gif"></p>
<p>⒍ <span class="style1">观察空间有哪些参数？其作用是什么？写出从物体空间坐标系到观察空间坐标系的转换矩阵。</span> </p>
<p>参数 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作用 </p>
<p>VRP 观察参考点 确定观察坐标系原点 </p>
<p>VPN 观察平面法向 确定观察平面法向 </p>
<p>VUP 观察正向 确定观察平面上 v 轴的方向 </p>
<p>F 前截面距离 确定前截面位置 </p>
<p>B 后截面距离 确定后截面位置 </p>
<p>Pt 投影类型 定义投影是平行投影还是透视投影 </p>
<p>PRP 投影参考点 确定投影中心或投影方向 </p>
<p>Umin,Umax,Vmin,Vmax 观察窗口 在观察平面上定义观察窗口 </p>
<p>从物体空间坐标系到观察空间坐标系的转换矩阵： </p>
<p><img width="151" height="144" src="ckxtda3_clip_image049.gif"></p>
<p>&nbsp;</p>
<p>⒎ <span class="style1">分别写出对于透视投影和平行投影，从裁剪空间到规范化投影空间的转换矩阵。</span> </p>
<p><img width="173" height="99" src="ckxtda3_clip_image051.gif"></p>
<p><img width="175" height="120" src="ckxtda3_clip_image053.gif"></p>
<p><img width="196" height="104" src="ckxtda3_clip_image055.gif"></p>
<p><img width="288" height="163" src="ckxtda3_clip_image057.gif"></p>
<p><img width="396" height="176" src="ckxtda3_clip_image059.gif"></p>
<p>平行投影： T vcper =T 3 T 4 T 5par T 6par </p>
<p>透视投影： T vcper =T 3 T 4 T 5per </p>
<p>&nbsp;</p>
<p>⒏ <span class="style1">写出从规范化投影空间到图像空间的转换矩阵。</span> </p>
<p><img width="175" height="141" src="ckxtda3_clip_image061.gif"></p>
<p>&nbsp;</p>
<p>⒐ <span class="style1">请写出三维图形几何变换矩阵的一般表达形式，并说明其中各个子矩阵的变换功能。 </span></p>
<p>（ 1 ） . 平移变换： </p>
<p><img width="328" height="131" src="ckxtda3_clip_image062.gif"></p>
<p>其中， <img width="17" height="24" src="ckxtda3_clip_image063.gif">、 <img width="17" height="25" src="ckxtda3_clip_image064.gif">、 <img width="17" height="24" src="ckxtda3_clip_image065.gif">是物体在三个坐标方向上的位移量。 </p>
<p>（ 2 ）．旋转变换： </p>
<p>绕 Z 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image066.gif"></p>
<p>绕 X 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image067.gif"></p>
<p>绕 Y 轴旋转的公式为： </p>
<p><img width="356" height="96" src="ckxtda3_clip_image068.gif"></p>
<p>（ 3 ）．缩放变换： <strong></strong></p>
<p><img width="327" height="96" src="ckxtda3_clip_image069.gif"></p>
<p>&nbsp;</p>
<p>⒑ <span class="style1">对二维齐次坐标下的线性变换矩阵 <em>M </em>，写出平移、旋转（绕原点）、比例（即变比）和错切情况下的变换矩阵形式。并描述将以 <em>P </em>( <em>x </em>1 , <em>y </em>1 ) 、 <em>Q </em>( <em>x </em>2 , <em>y </em>2 ) 为端点的直线段变换成与 <em>x </em>轴重合的矩阵变换形式。</span> </p>
<p>（ 1 ）平移： <img width="96" height="77" src="ckxtda3_clip_image071.gif"></p>
<p>（ 2 ）旋转（绕原点）： <img width="123" height="75" src="ckxtda3_clip_image073.gif"></p>
<p>（ 3 ）比例： <img width="76" height="75" src="ckxtda3_clip_image075.gif"></p>
<p>（ 4 ）错切： <img width="79" height="75" src="ckxtda3_clip_image077.gif"></p>
<p>（ 5 ）将以 <em>P </em>( <em>x </em>1 , <em>y </em>1 ) 、 <em>Q </em>( <em>x </em>2 , <em>y </em>2 ) 为端点的直线段变换成与 <em>x </em>轴重合的矩阵变换形式： </p>
<p><img width="113" height="75" src="ckxtda3_clip_image079.gif"><img width="133" height="75" src="ckxtda3_clip_image081.gif"></p>
<p>其中： <img width="13" height="19" src="ckxtda3_clip_image083.gif">为直线段 PQ 与 <em>x </em>轴所成的角 </p>
</body>
</html>
