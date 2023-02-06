### Register

{% if include.mutate contains "storetrial" -%}
1. Visit <https://hidale.com/shop/{{- page.title | slugify -}}/> to get a no-cost license for pre-production releases.
{%- else -%}
1. Evaluate {{ page.title }} with a 14-day no-cost trial. When the plugin meets your needs,
   please visit <https://hidale.com/shop/{{- page.title | slugify -}}/>
   to purchase a license from the store.
{%- endif %}
2. Open the help file or patch included within the {{ page.title }} download.
3. Click the top-left `Register` tab.
{% if include.mutate contains "storetrial" -%}4. Ignore the `trial` button.
{% else -%}4. Optional: Start a 14-day no-cost trial by clicking `register trial` then skip to the last step.
{% endif -%}
5. Type your registration name in the field beside the `register` button. You
   received your registration name in an email from the online store.
   🧐 Your registration name is usually _not your email address_.
6. Click the register button and use the dialog box that appears to select
   your {{ page.title }} registration key (.dpreg file)
7. You should see a successful registration. If not, please look at the Max console
   for any warnings or errors.
