---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---
{::options parse_block_html="true" /}
{{ site.tagline }}

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