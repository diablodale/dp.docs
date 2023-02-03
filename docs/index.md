---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---
{::options parse_block_html="true" /}

<div style="display: flex; flex-wrap: wrap;">

<div style="margin-right: 3em;">
<h2 id="get-started" style="margin-top: 0;">:running_woman: Get started</h2>
<ul>
<li><a href="https://hidale.com">Downloads, trials, licenses</a></li>
<li>Setup
{%- include build-collection-products.html -%}
{%- for product in products -%}
{%- if forloop.first -%}<ul>{%- endif -%}
<li><a href="max/{{ product | slugize }}/#setup">{{- product -}}</a></li>
{%- if forloop.last -%}</ul>{%- endif -%}
{%- endfor -%}
</li>
</ul>
</div>

<div style="margin-right: 3em;">
<h2 id="learn" style="margin-top: 0;">:open_book: Learn</h2>

* [Tutorials](/_max/tutorials.md)
* [Attribute](/_max/attributes.md) reference
  
</div>
</div>

## :dart: Updates

The new documentation is almost complete 🙂

* ~~Tutorials are complete~~
* ~~Sensor hardware references are complete~~
* ~~[dp.kinect3](/_max/dp.kinect3.md) and [dp.oak](/_max/dp.oak.md) attributes and methods are complete~~
* Most [dp.kinect](/_max/dp.kinect.md) and [dp.kinect2](/_max/dp.kinect2.md) attributes and methods are
  complete. Fill gaps with the previous documentation until we finish.
* Setup instructions still need migration. Use the previous documentation.
