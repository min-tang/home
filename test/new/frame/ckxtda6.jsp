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
<span class="style2">习 题 六</span><br>
⒈ <span class="style3">列举ISO颁布的主要计算机图形信息标准。</span><br>
三维图形核心系统(GKS-3D，Graphics Kernel System-3 Dimension)、程序员层次交互式图形系统(PHIGS，Programmer’s Hierarchical Interactive Graphics System)、计算机图形元文件(CGM，Computer Graphics Metafile)、计算机图形接口(CGI，Computer Graphics Interface)、产品数据交换标准(STEP，Standard for The Exchange of Product model data)
<p>⒉ <span class="style3">IGES和STEP之间有何共同点和不同点？</span><br>
  共同点：都是计算机图形标准中与数据交换有关的标准，且STEP是为了克服IGES存在的问题，扩大转换CAD/CAM系统中几何、拓扑数据的范围而制订的。<br>
  不同点：<br>
  (1)IGES是ANSI（美国）制订的国家标准；而STEP是ISO制订的国际标准。<br>
  (2)IGES的最初开发目标是在CAD/CAM系统间交换面向图形和工程图的一些信息，重<br>
  点在产品的几何信息，后来扩展到支持一些其它领域；而STEP最初的开发目标是交换和共享产品信息，这些信息不仅包含几何信息，也包含制造，检测和商业的信息，将扩展到支持产品的整个生命周期。<br>
  (3)IGES着重于单一的零件；而STEP既支持单一零件也支持装配件，及其装配控制。<br>
  (4)IGES用文本文件定义，没有正式定义的产品模型或机器可理解的定义方式；而STEP用EXPRESS来定义数据模型，所有的产品定义均为机器可理解的定义方式。<br>
  (5)IGES的存在形式仅有正文件，无标准二进制的格式，无标准程序界面；而STEP的数据可存在于正文文件、二进制文件以及数据库格式中，有许多不完全相容的对标准的不同子集的实施；而STEP有严格定义的实施需求，不允许部分子集的实施，一致性检测方法与工具是标准的一部份。<br>
</p>
<p>⒊ <span class="style3">IGES作为一种三维模型交换中性文件有哪些优缺点？</span><br>
  优点：作为较早颁布的标准，IGES被许多CAD/CAM系统接受，为应用最广泛的数据交换标准。<br>
  缺点：首先IGES中定义的实体主要是几何图形方面的信息，而不是产品定义的全面信息，它的目的是在屏幕上显示图表或用绘图机绘出图纸、绘出尺寸标准和文字注释。所有这些输出形式都是供人使用理解的，不是面向计算机的，所以不能满足CAD/CAM集成的要求。其次，IGES的另一个缺点是数据传输不可靠，往往一个CAD系统只有一部分数据能转换成IGES数据，在读入IGES数据时也经常有部分数据被忽略。此外IGES的一些语法结构有二义性，不同的系统会对同一个IGES文件给出不同的解释，这可能导致数据交换的失败。IGES的第三个缺点是它的交换文件所占的存储空间太大，虽然后来提出了压缩的ASCII码格式，但多数IGES处理器都不支持。由于这个缺点也影响了数据文件的处理速度，使得传输效率不高。<br>
</p>
<p>⒋ <span class="style3">试述STEP中全局产品模型的基本概念。</span><br>
  STEP的产品模型数据覆盖产品整个生命周期的应用，并全面定义了产品模型信息。产品模型信息包括设计、分析、制造、测试、检验零件或机构所需的几何、拓扑、公差、关系、属性和性能等信息，也包括一些和处理有关的信息。STEP的产品模型对于生产制造、直接质量控制测试和产品新功能的开发提供了全面的信息。模型信息分为三层结构：应用层、逻辑层和物理层，其核心是形状特征信息模型。<br>
</p>
</body>
</html>
