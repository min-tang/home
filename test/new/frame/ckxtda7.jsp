<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {font-size: 18px}
.style3 {color: #996600}
-->
</style>
</head>

<body>
<span class="style2">习  题  七</span><br>
⒈ <span class="style3">物体表面的颜色由哪些因素决定？</span><br>
物体表面的色彩和明暗变化主要与两个因素有关，即光源特性和物体表面特性。<br>
物体表面的颜色，主要由光源的色彩和物体表面的漫反射系数来模拟。<br>
<p>⒉ <span class="style3">简述各个光照模型之间的区别，并写出它们能模拟的光照效果和不能模拟的光照效果。</span><br>
  简单的局部光照模型假定光源是点光源，物体是非透明体，不考虑折射，反射光由环境光、漫反射光和镜面反射光组成。局部光照明模型有考虑周围环境对当前景物表面的光照明影响，忽略了光能在环境景物之间的传递，没有考虑环境的漫射、镜面反射和规则透射对景物表面产生的整体照明效果，因此很难生成表现自然界复杂场景的高质量真实感图形。<br>
  Whitted 光照明模型是一种较精确的整体光照明模型，能很好地模拟光能在光滑物体表面之间的镜面反射和通过理想透明体产生的规则透射，从而表现物体的镜面映射和透明性，并产生非常真实的自然景象。<br>
光线跟踪算法是典型的整体光照模型，该方法很自然地解决了环境中所有物体之间的消隐、阴影、镜面反射和折射等问题，能够生成十分逼真的图形。</p>
<p><br>
  ⒊ <span class="style3">写出简单光反射模型近似公式，并说明其适用范围及能产生的光照效果。</span><br>
  EP=RPId+ 

 
  <em><img width="190" height="35" src="ckxtda7_clip_image002.gif"></em> <br>
  假定光源是点光源，物体是非透明体，不考虑折射，反射光由环境光、漫反射光和镜面反射光组成。环境光的特点是：照射在物体上的光来自周围各个方向，又均匀地向各个方向反射（漫反射光）。该模型考虑周围环境对当前景物表面的光照明影响，因此能产生比较真实的不透明物体光照效果。<br>
</p>
<p>⒋ <span class="style3">写出线光源的光强公式及其积分算法。</span><br>
  线光源的光强公式如下：<br>
</p>
<p align="left"><img width="199" height="41" src="ckxtda7_clip_image001.gif"></p>
其中 <img width="19" height="24" src="ckxtda7_clip_image002_0000.gif">表示漫反射系数， <img width="23" height="24" src="ckxtda7_clip_image003.gif">表示漫反射率， <img width="17" height="24" src="ckxtda7_clip_image004.gif">是来自光源的光亮度， <img width="16" height="24" src="ckxtda7_clip_image005.gif">是 <img width="19" height="19" src="ckxtda7_clip_image006.gif">朝辐射方向的投影角。 <img width="23" height="24" src="ckxtda7_clip_image007.gif">是被照射表面的法向， <img width="19" height="24" src="ckxtda7_clip_image008.gif">是单位光线向量。
<p><br>
  在一般情况下，上述公式只能用数值算法做近似的计算。其实质是用多个点光源来近似线光源。<br>
</p>
<p>⒌ <span class="style3">简述光线跟踪算法。</span><br>
  对于屏幕上的每个象素，跟踪一条从视点出发经过该象素的光线，求出与环境中物体的交点。在交点处光线分为两支，分别沿镜面反射方向和透明体的折射方向进行跟踪，形成一个递归的跟踪过程。光线每经过一次反射或折射，由物体材质决定的反射、折射系数都会使其强度衰减，当该光线对原象素光亮度的贡献小于给定的阈值时，跟踪过程即停止。下面是一个光线跟踪算法的C描述。这是一个递归算法。TraceRay的三个参数分别是起点start，跟踪方向direction和已跟踪的深度depth，返回的是光线direction的颜色。<br>
  Color TraceRay(start,direction,depth)<br>
  Vector start,direction;<br>
  Int depth;<br>
  {<br>
  if (depth&gt;MAX_DEPTH)<br>
  color=black;<br>
  else {<br>
  光线与物体求交，找出离start最近的交点；<br>
  if (无交点)<br>
  color=背景色；<br>
  else {<br>
  local_color=用局部光照模型计算出的交点处的光强；<br>
  计算反射方向；<br>
  Reflected_color=TraceRay(交点，反射方向，depth+1)；<br>
  计算折射方向；<br>
  Transmitted_color=TraceRay(交点，折射方向，depth+1)；<br>
  Color= local_color+Reflected_color*Kr+Transmitted_color*Kt；<br>
  }<br>
  }<br>
  return color；<br>
}</p>
<p>⒍<span class="style3"> 写出光线与几种常见物体的表面的求交算法。</span><br>
  假设光线射线定义为X=Dt+E (t&gt;=0)<br>
  其中，E=(e1,e2,e3)为射线起点，D=(d1,d2,d3)为射线方向，||D|| = 1，X=(x,y,z)为射线上任意点。<br>
  1）与多边形求交算法<br>
  假设多边形所在的平面方程为<br>
  ax+by+cz+d = 0<br>
  把射线参数方程代入平面方程得到：<br>
  t0 = - (N * K + d) / (N * D) (N*D&lt;&gt;0)<br>
  当N*D = 0时，射线和多边形平行；当N*D&lt;&gt;0，交点为X0 = Dt0 + E。这时，还要判断交点是否在多边形上。判断时，只要把交点和多边形投影到某个坐标平面上判断即可。<br>
  2）与球面求交算法<br>
  设球心在P0(x0,y0,z0)，半径为r的球面方程为<br>
  (P – P0) * (P – P0) = r * r<br>
  代入射线方程，有<br>
  at*t + bt + c = 0<br>
  其中a = D*D，b = 2D *(E-P0)，c = (E-P0) * (E-P0) – r * r<br>
  当b*b-4ac&lt;0时，无交点。否则，射线与球面交于两点，由求根公式可以求出。<br>
  3）与柱面求交算法<br>
  一个底面中心为P0，对称轴方向为AXIS，半径为r，高为h的圆柱定义如下：<br>
  (P – P0) * (P- P0) – (AXIS * (P – P0)) * (AXIS * (P – P0)) – r * r &lt;= 0<br>
  AXIS * (P – P0) &gt;= 0<br>
  AXIS * (P – P0) &lt;= 0<br>
  其中，P1 = P0 + h * AXIS<br>
  把射线方程代入第一式，并改为不等式，得到：<br>
  at * t + 2bt + c = 0<br>
  其中 a = 1 – (AXIS * D) * (AXIS * D)<br>
  b = D * (E – P0) – (AXIS * D) X (AXIS * (E – P0))<br>
  c = (E – P0) * (E – P0) – (AXIS * (E – P0)) – r * r<br>
  当b * b –ac &gt;= 0时，可以由求根公式求出解。<br>
  求出t以后，还要看是否满足后面两个不等式，才能决定是否在圆柱面上。<br>
</p>
<p>⒎ <span class="style3">简述消隐算法的分类。</span><br>
  根据消隐空间的不同，消隐算法可分为两类：<br>
  1．物体空间的消隐算法：物体空间是物体所在的空间，即规范化投影空间。这类算法是将物体表面上的 个多边形中的每一个面与其余的 个面进行比较，精确求出物体上每条边或每个面的遮挡关系。计算量正比于 。<br>
2．图象空间的消隐算法：图象空间就是屏幕坐标空间，这类算法对屏幕的每一象素进行判断，以决定物体上哪个多边形在该象素点上是可见的。若屏幕上有 个象素点，物体表面上有 个多边形，在该类消隐算法计算量正比于 。</p>
<p>⒏ <span class="style3">简述深度缓存算法及其特点。</span><br>
  深度缓存算法是一种典型的、也是最简单的图象空间的消隐算法。在屏幕空间坐标系中， 轴为观察方向，通过比较平行于 轴的射线与物体表面交点的 值（又称为深度值），用深度缓存数组记录下最小的 值，并将对应点的颜色存入显示器的帧缓存。<br>
  深度缓存算法最大的优点是简单。它在 、 、 方向上都没有进行任何排序，也没有利用任何相关性。算法复杂性正比于 。在屏幕大小，即 一定的情况下，算法的计算量只与多边形个数 成正比。<br>
另一个优点是算法便于硬件实现，并可以并行化。</p>
<p>⒐ <span class="style3">简述点与多边形之间的包含性检测算法。</span><br>
  先将该点变换到多边形所在平面，在二维空间讨论该问题，过该点沿任意方向做一条射线，与多边形边界求交点，若交点个数为偶数，0，2，4，…，则该点在多边形外部，否则在内部。如果射线与多边形某条边、某个顶点重合，则可以改变射线方向重新测试。<br>
</p>
<p>⒑ <span class="style3">描述扫描线算法。</span><br>
  扫描线算法如下：<br>
  1．对于每个多边形，根据多边形顶点的最小的y值，将多边形置入多边形Y桶。<br>
  2．有效多边形表APT初始化为空，有效边表初始化为空。<br>
  3．对每一条扫描线j，j从最小值1开始，做以下工作：<br>
  l 颜色缓存CB置为背景色。<br>
  l 深度缓存ZB置为机器无穷大。<br>
  l 检查多边形Y桶中对应扫描线j的链中是否有新的多边形。如有，则将新多边形加到有效多边形表APT中。<br>
  l 对于新添到有效多边形表中的多边形，生成对应的边Y桶。<br>
  l 对于有效多边形表APT中的每一个多边形，若其边Y桶中对应扫描线j有新的边，则将新边配对加入到有效边表AET中。<br>
  l 对于有效边表AET中的第一个边对，计算起止x坐标间点的z值，与ZB中对应值比较，若小，在更新ZB的值，并将该点颜色值存入CB。<br>
  l 将CB的内容写入显示器帧缓存的第j行。<br>
  l 检查有效多边形表APT中的个多边形，若多边形顶点的最大Y坐标已等于j，则从APT中删去多边形，释放对应的边Y桶的空间，并从有效边表AET中删去属于该多边形的所有边对。<br>
  l 检查有效边表AET的每一边对，调整相应的起止x坐标，和z值。<br>
</p>
</body>
</html>
