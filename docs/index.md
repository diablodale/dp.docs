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
<h2 id="get-started" class="bb-90 mt-0"><span>🏃&nbsp;Get&nbsp;started</span></h2>
<ul>
{%- include build-collection-products.html -%}
{%- for product in products -%}
<li><a href="max/{{ product | slugify }}">{{- product -}}</a></li>
{%- endfor -%}
</ul>
</div>

<div class="mr-5 flex-auto">
<h2 id="learn" class="bb-90 mt-0">📖&nbsp;Learn</h2>

* [Tutorials](/_max/tutorials.md)
* [Attribute](/_max/attributes.md) reference
* [Method](/_max/methods.md) reference
  
</div>

<div class="mr-5 flex-auto">
<h2 id="updates" class="bb-90 mt-0">🎯&nbsp;Updates</h2>

* New machine learning features -- start with [@mlmodel](/_max/attributes/mlmodel.md)
* Your contributions are welcome. 🙂 Thank you. Click the `Edit this page` link
  at the bottom of any page.

</div>

</div>
