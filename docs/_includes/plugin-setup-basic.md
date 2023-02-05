### Setup

1. Install [Cycling'74 Max](https://cycling74.com/downloads/) version 6.1.9 or newer (64-bit)
2. Download {{ page.title }} from <https://hidale.com/shop/{{- page.title | slugify -}}/>
3. [Decompress](https://support.microsoft.com/en-us/help/14200/windows-compress-uncompress-zip-files)
   all the files in this download into an empty directory
4. Register {{ page.title }}

### Register

{% if include.mutate contains "storetrial" -%}
1. Visit <https://hidale.com/shop/{{- page.title | slugify -}}/> to get a no-cost license for pre-production releases.
{%- else -%}
1. You can evaluate {{ page.title }} with a two week free trial. When you like the plugin
   and want to use it more, please visit <https://hidale.com/shop/{{- page.title | slugify -}}/>
   to purchase a license from the store.
{%- endif %}
2. Open the help file or patch included within the {{ page.title }} download.
3. Click the top-left `Register` tab.
{% if include.mutate contains "storetrial" -%}3. Ignore the trial button.
{% endif -%}
4. Type your registration name in the field beside the register button. You
   received your registration name in an email from the online store. Hint: your
   registration name is usually _not your email address_.
5. Click the register button and use the dialog box that appears to select
   your {{ page.title }} registration key (.dpreg file)
6. You should see a successful registration. If not, please look at the Max console
   for any warnings or errors.
