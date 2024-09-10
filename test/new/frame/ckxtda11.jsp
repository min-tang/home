<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {color: #996600}
.style6 {font-size: 18px}
-->
</style>
</head>

<body>
<span class="style6">习 题 十一</span><br>
⒈ <span class="style5">写出计算机动画的主要步骤。</span><br>
1、造型（建模）；<br>
2、运动控制；<br>
3、绘制（渲染）。<br>
其中，造型是计算机动画的基础，没有动画对象在计算机中的表示，也就无从进行计算机动画；绘制技术决定画面的真实感程度；变动规律的控制是计算机动画的核心，造型和绘制在计算机图形学和CAD等其它相关领域中都已有了较为成熟的结果，因此计算机动画方法虽然是指上述三个步骤中的各种方法，但核心是物体变动规律的控制方法，另外，上述三个步骤是相关的，采用不同方法造型的物体，其变动规律的控制方法和绘制方法也相应的有所不同。
<p>⒉<span class="style5"> 叙述计算机动画的主要运动控制方法。</span><br>
  1、 关键帧动画法；<br>
  关键帧动画法首先输入几幅具有关键意义的图象（或图形），然后根据某种规律对图象（或图形）进行插值，得到中间图象（或图形），插值方法根据动画效果的具体要求而定，主要解决关键帧间各图象（或图形）要素的对应关系以及插值路径问题。<br>
  2、 代数动画法（造型动画法）；<br>
  代数动画法又被动画专家Thalmann称为造型动画法，它针对计算机造型的物体，通过数学模型或物理定律来控制物体的运动，具体可以分为运动学模型、动力学模型和逆向模型。<br>
</p>
<p>⒊ <span class="style5">编制用marching cube进行多面体化的程序。</span><br>
  step1. 相邻的切片数据读入内存。<br>
  step2. 扫描中间两张切片，每张上各取相应的4个相邻顶点建立一个立方体。<br>
  step3. 对该立方体的8个顶点的密度与常数值比较，计算出立方体的索引。<br>
  step4. 根据索引，从预先计算表中找出所有与重建曲面相交的边。<br>
  step5. 根据每条边上顶点的密度值，运用线性插值计算重建曲面与边的交，即三角形的顶点。<br>
  step6. 运用中心差分法计算立方体每个顶点的单位法向，并插值出每个三角形顶点的法向。<br>
  step7. 输出三角形的顶点和顶点法向。<br>
</p>
<p>⒋ <span class="style5">叙述三维标量场可视化的主要方法。</span><br>
  一、等值面方法<br>
  1、从等值线进行重构的方法；<br>
  2、基于体素的等值面生成（如Marching Cube方法）。<br>
  二、体绘制方法<br>
  1、以图像空间为序的体绘制算法（如体光线投射法）；<br>
  2、以对象空间为序的体绘制算法（如体单元投影法）。<br>
</p>
</body>
</html>
