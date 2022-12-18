---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
nav_order: 1
permalink: /
---
<div id="archives">
  {%- include build-collection-products.html -%}
  {%- for product in products -%}
  <div class="archive-group">
    <h2 id="{{ product | slugize }}" class="category-head">{{- product -}}</h2>
    <dl>
    {%- for page in site.max -%}
      {%- if page.products contains product -%}
        <dt><a href="{{ site.baseurl }}{{ page.url }}">@{{- page.title | downcase -}}</a></dt>
        <dd>{{- page.excerpt | strip_html | normalize_whitespace | truncate: 75 -}}</dd>
      {%- endif -%}
    {%- endfor -%}
    </dl>
  </div>
  {%- endfor -%}
</div>
