<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-size: 18px}
.style5 {color: #996600}
-->
</style>
</head>

<body>
<span class="style4">习 题 十</span><br>
⒈<span class="style5">写出边界表示的半边数据结构中各对象（solid, loop, edge, halfedge, vertex）的数据结构，并对各对象中的成员的含义加以解释。</span><br>
struct solid<br>
{<br>
Id Solidno; /*solid identifier*/<br>
Face *sfaces; /*pointer to list faces*/<br>
Edge *sedges; /*pointer to list of vertices*/<br>
Vertex *sverts; /*pointer to list of solid*/<br>
Solid *nexts; /*pointer to next solid*/<br>
Solid *prevs; /*pointer to previous solid*/<br>
};<br>
struct face<br>
{<br>
Id faceno; /*face identifier*/<br>
Solid *fsolid; /*back pointer to solid*/<br>
Loop *flout; /*pointer to outer loop*/<br>
Loop *floops; /*pointer to list of loops*/<br>
vector feq; /*face equation*/ （SURFACE *fgeom ;）<br>
Face *nextf; /*pointer to next face*/<br>
Face *prevf; /*pointer to previous face*/<br>
};
<p>struct loop<br>
  {<br>
  HalfEdge *lege; /*pointer to ring of halfedges*/<br>
  Face *lface; /*back pointer to face*/<br>
  Loop *nextl; /*pointer to next loop*/<br>
  Loop *prevl; /*pointer to previous face*/<br>
  };<br>
  struct halfedge<br>
  {<br>
  Edge *edg; /*pointer to parent edge*/<br>
  Vertex *vtx; /*pointer to starting vertex*/<br>
  Loop *wloop; /*back pointer to loop*/<br>
  HalfEdge *nxt; /*pointer to next halfedge*/<br>
  HalfEdge *prv; /*pointer to previous halfedge*/<br>
  };<br>
  struct vertex<br>
  {<br>
  Id vertexno; /*vertex identifier*/<br>
  HalfEdge *vedge; /*pointer to a halfedge*/<br>
  vector vcoord; /*vertex coordinates*/<br>
  Vertex *nextv; /*pointer to next vertex*/<br>
  Vertex *prevv; /*pointer to previous vertex*/<br>
  };<br>
  struct edge<br>
  {<br>
  HalfEdge *he1; /*pointer to right halfedge*/<br>
  HalfEdge *he2; /*pointer to left halfedge*/<br>
  Edge *nexte; /*pointer to next edge*/<br>
  Edge *preve; /*pointer to previous edge*/<br>
  Curve *cgeom ;<br>
  };<br>
</p>
<p>⒉<span class="style5">已知v为半边数据结构中的一顶点，检索出与v共边的所有其它顶点。</span><br>
  要实现这一检索的关键是要自动从一面转向相邻的另一面。可用以下代码来实现（其中mate(he)的含义是求出与半边he共边的另一条半边）：<br>
  #define mate(he) (((he)= =(he)-&gt;edg-&gt;he1 ? (he)-&gt;edg-&gt;he2 : (he)-&gt;edg-&gt;he1)<br>
  void listneighbor(Vertex *v)<br>
  {<br>
  HalfEdge *adj;<br>
  adj = v-&gt;vedge;<br>
  if (adj)<br>
  {<br>
  do<br>
  {<br>
  printf(“%d”,adj-&gt;nxt-&gt;vtx-&gt;vertexno);<br>
  }while((adj – mate(adj)-&gt;nxt) != v-&gt;vedge);<br>
  }<br>
  else<br>
  printf(“no adjacent vertices”);<br>
  printf(“\n”);<br>
  }<br>
</p>
<p>⒊ <span class="style5">写出用欧拉操作作线性扫掠体的过程。</span><br>
  移动掠扫算法使用一个基本平面FACE，并指定一个移动方向（dx,dy,dz）。其中dx,dy,dz分别表示移动距离的三上分量，通过欧拉操作，自动生成一个多面体的半边数据结构。<br>
  具体算法如下：<br>
  / * procedure sweep is a translation sweeping routine<br>
  It takes a face fac of a solid, and sweeps it along<br>
  a vector [dx, dy, dz ].<br>
  * / <br>
  void sweep(fac, dx, dy, dz)<br>
  Face * fac;<br>
  Float dx, dy, dz;<br>
  {<br>
  Loop * l;<br>
  HalfEdge*first, *scan;<br>
Vertex * v;</p>
<p>lgetmaxnames(fac-&gt;fsolid);<br>
  l = fac-&gt;floops;<br>
  while(l)<br>
  {<br>
  first = l-&gt;ledg; / * a * /<br>
  scan = first-&gt;nxt;<br>
  v =scan-&gt;vtx;<br>
  lmev(scan, scan, ++maxv,<br>
  v-&gt;vcoord[0]+dx,<br>
  v-&gt;vcoord[1]+dy,<br>
  v-&gt;vcoord[2]+dz); / * b * /</p>
<p>while(scam ! = first)<br>
  {<br>
  v = scan-&gt;nxt-&gt;vtx;<br>
  lmev(scan-&gt;nxt, scan-&gt;nxt, ++maxv,<br>
  v-&gt;vcoord[0]+dx,<br>
  v-&gt;vcoord[1]+dy,<br>
  v-&gt;vcoord[2]+dz); / * c * /<br>
  lmef(scan-&gt;prv, scan-&gt;nxt-&gt;nxt, ++maxf); / * d * /<br>
  scan = mate(scan-&gt;nxt)-&gt;nxt;<br>
  } / * e * /<br>
  lmef(scan-&gt;prv, scan-&gt;nxt, ++maxf);<br>
  l = l-&gt;nextl;<br>
  }<br>
  }<br>
  / * end of sweep * /<br>
  所含子程序lgetmaxnames(fac→fsolid)的功能：搜索solid中face t和vertex中的最大编号（即Id名字），并将它们分别赋给变量maxf和maxv 。这样，在新顶点和新面生成之时，可以用++maxv的方法很容易地予以赋名，并保持名字的唯一性。<br>
</p>
<p>⒋ <span class="style5">叙述特征概念。</span><br>
  特征是部件的物理组元；具有一定的工程意义；可以与一定的形状存在映射关系；具有可预言的性质。<br>
</p>
</body>
</html>
