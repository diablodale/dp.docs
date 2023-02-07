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
<li><a href="max/{{ product | slugify }}">{{- product -}}</a></li>
{%- endfor -%}
</ul>
</div>

<div class="mr-5 flex-auto">
<h2 id="learn" class="ul-90 mt-0">:open_book:&nbsp;Learn</h2>

* [Tutorials](/_max/tutorials.md)
* [Attribute](/_max/attributes.md) reference
* [Method](/_max/methods.md) reference
  
</div>

<div class="mr-5 flex-auto">
<h2 id="updates" class="ul-90">:dart: Updates</h2>

Documentation was successfully migrated to this website. 🙂

* ~~Tutorials are complete~~
* ~~Sensor hardware references are complete~~
* ~~[dp.kinect](/_max/dp.kinect.md), [dp.kinect2](/_max/dp.kinect2.md), [dp.kinect3](/_max/dp.kinect3.md), and [dp.oak](/_max/dp.oak.md) attributes and methods are complete~~
* ~~[dp.kinect](/_max/dp.kinect.md), [dp.kinect2](/_max/dp.kinect2.md), [dp.kinect3](/_max/dp.kinect3.md), and [dp.oak](/_max/dp.oak.md) setup guides are complete~~

</div>

</div>
