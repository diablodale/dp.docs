---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---
{::options parse_block_html="true" /}

## New Documentation

This new documentation site is a work-in-progress. It has the new
features of [dp.kinect3](/_max/dp.kinect3.md) and [dp.oak](/_max/dp.oak.md).
Some features are still being migrated from the good
[dp.kinect2 documentation](https://github.com/diablodale/dp.kinect2/wiki#reference-documentation). Use this site and the dp.kinect2 site
until the migration is complete.

<div style="display: flex; flex-wrap: wrap;">
<div style="margin-right: 3em;">

## :running_woman: Get started {#get-started}
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

## :open_book: Learn {#learn}
* [Tutorials](/_max/tutorials.md)
* [Attribute](/_max/attributes.md) reference
  
</div>

</div>