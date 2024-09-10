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
<h2>习 </a>题 九 </h2>
<p>⒈ <span class="style3">试述实体造型中三种主要表示方法的优缺点。</span> </p>
<p>三种主要表示方法：结构模型、分解模型、边界模型。 </p>
<p>结构模型： </p>
<p>优点：（ 1 ） 数据结构比较简单，数据量比较小，内部数据的管理比较容易 ； </p>
<p>（ 2 ） 物体的有效性自动得到保证； </p>
<p>（ 3 ） CSG 方法表示的形体的形状，比较容易修改。 </p>
<p>缺点：（ 1 ） 对形体的表示受体素的种类和对体素操作的种类的限制，也就是说， CSG 方法表示形体的覆盖域有较大的局限性 ； </p>
<p>（ 2 ） 对形体的局部操作不易实现，例如，不能对基本体素的交线倒圆角 ； </p>
<p>（ 3 ） 由于形体的边界几何元素（点、边、面）是隐含地表示在 CSG 中，故显示与绘制 CSG 表示的形体需要较长的时间； </p>
<p>（ 4 ）表示不唯一。 </p>
<p>分解模型： </p>
<p>优点：（ 1 ）分解模型能表达各种复杂的实体； </p>
<p>（ 2 ）分解模型很适于局部加工与局部修改，对于一些特殊的应用系统如雕塑的模拟， 是一种很适宜的模型。 </p>
<p>（ 3 ）分解模型对布尔操作和集合运算闭包，由于模型结构的严格有序性质，大多数造型和计算比较方便 </p>
<p>缺点：（ 1 ）分解模型的表达精度较低； </p>
<p>（ 2 ）分解模型的紧凑性不佳，空间开销大； </p>
<p>（ 3 ）由于分解模型是体表达，且又缺乏整体数据，所以对于设计边界的一些操作，如线框提取等等比较困难。 </p>
<p>边界模型 </p>
<p>优点：（ 1 ）边界模型有极强的表达能力，它既可以表达实体，又可以表达曲面，比 CSG 有更大的表达覆盖率； </p>
<p>（ 2 ）边界模型的突出优点是易于和图形软件接口，一切图形学算法都可以直接作用于边界模型中的面函数。 </p>
<p>缺点：（ 1 ）边界模型对集合操作并不闭包。需要在操作之后检查数据结构的空间合理性； </p>
<p>（ 2 ）边界模型的紧凑性不好，需占有较大的空间； </p>
<p>（ 3 ）一个对象所转化的边界模型不是唯一的； </p>
<p>（ 4 ）它的操作算法也很复杂。 </p>
<p>&nbsp;</p>
<p>⒉ <span class="style3">试述分形和粒子系统适合表述的对象。 </span></p>
<p>分形造型是利用分形 (Fractal) 几何学的自相似性，采用各种模拟真实图形的模型，使整个生成的景象呈现出细节的无穷回归性质的方法。所生成的景物中，可以有结构性较强的树，也可以是结构性较弱的火、云、烟，甚至可生成有动态特性的火焰、浪等。 </p>
<p>粒子系统是迄今为止被人们认为模拟不规则模糊物体最为成功的一种图形生成算法。它充分体现了不规则模糊物体的动态性和随机性，能很好地模拟火、云、水、森林和原野等自然景观和材料科学、化学、生物等学科中粒子动态变化及形态。 </p>
<p>⒊ 如何对两个八叉树表示的物体进行布尔运算？ </p>
<p>设 n1 、 n2 是求交的两颗八叉树中相同位置的对应点， n3 是布尔运算后新树中的对应节点。 </p>
<p>求交运算： </p>
<p>1 ．如果 n1 ， n2 同为叶节点，则有： </p>
<p><img width="180" height="36" src="ckxtda9_clip_image002.gif"></p>
<p>2 ．如果 n1 是叶节点， n2 不是，则有： </p>
<p><img width="180" height="41" src="ckxtda9_clip_image004.gif"></p>
<p>&nbsp;</p>
<p>3 ．<span class="style3">如果 n1 ， n2 同为非叶节点，则 n1 ， n2 ， n3 同时分解至儿子层再进行求交。</span> </p>
<p>求并运算： </p>
<p>1 ．如果 n1 ， n2 同为叶节点，则有： </p>
<p><img width="180" height="36" src="ckxtda9_clip_image006.gif"></p>
<p>2 ．如果 n1 是叶节点， n2 不是，则有： </p>
<p><img width="168" height="38" src="ckxtda9_clip_image008.gif"></p>
<p>3 ．如果 n1 ， n2 同为非叶节点，则 n1 ， n2 ， n3 同时分解至儿子层再进行求并。 </p>
<p>⒋ <span class="style3">写出立方体的翼边表示模型的具体内容。</span> </p>
<table cellspacing="0" cellpadding="0">
  <tr>
    <td width="568" valign="top"><p align="center"><img width="388" height="433" src="ckxtda9_clip_image010.jpg"></p></td>
  </tr>
  <tr>
    <td width="568" valign="top"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图 9.13 完整的翼边结构 </p></td>
  </tr>
</table>
</body>
</html>
