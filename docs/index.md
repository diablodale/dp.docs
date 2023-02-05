---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---
{::options parse_block_html="true" /}

<div class="d-flex" style="flex-wrap: wrap;">

<div class="mr-5 flex-auto">
<h2 id="get-started" class="ul-90 mt-0"><span>:running_woman: Get&nbsp;started</span></h2>
<ul>
{%- include build-collection-products.html -%}
{%- for product in products -%}
<li><a href="max/{{ product | slugize }}/#get-started">{{- product -}}</a></li>
{%- endfor -%}
</ul>
</div>

<div class="mr-5 flex-auto">
<h2 id="learn" class="ul-90 mt-0">:open_book:&nbsp;Learn</h2>

* [Tutorials](/_max/tutorials.md)
* [Attribute](/_max/attributes.md) reference
  
</div>

<div class="mr-5 flex-auto">
<h2 id="updates" class="ul-90">:dart: Updates</h2>

The new documentation is almost complete 🙂

* ~~Tutorials are complete~~
* ~~Sensor hardware references are complete~~
* ~~[dp.kinect3](/_max/dp.kinect3.md) and [dp.oak](/_max/dp.oak.md) setup, attributes, and methods are complete~~
* Most [dp.kinect](/_max/dp.kinect.md) and [dp.kinect2](/_max/dp.kinect2.md) attributes and methods are
  complete. Their setup instructions need migration. Fill gaps with the previous documentation until we
  finish.

</div>

</div>
