---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

<div id="archives">
  {% include build-collection-products.html %}
  {% for product in products %}
  <div class="archive-group">
    <div id="#{{ product | slugize }}"></div>
    <p></p>

    <h3 class="category-head">{{ product }}</h3>
    <a name="{{ product | slugize }}"></a>

    {% for collection in site.collections %}
      {% for page in collection.docs %}
        {% if page.products contains product %}
          <article class="archive-item">
            <h4><a href="{{ site.baseurl }}{{ page.url }}">{{page.title}}</a></h4>
            {{ page.excerpt | strip_html | normalize_whitespace | truncate: 75 }}
          </article>
        {% endif %}
      {% endfor %}
    {% endfor %}
  </div>
{% endfor %}
</div>
