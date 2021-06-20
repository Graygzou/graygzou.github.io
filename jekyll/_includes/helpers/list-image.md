<div style="display: flex; justify-content: space-evenly; align-content:stretch;">
{% assign array = include.basenames | split: ',' %}
{% for basename in array %}
{% capture filename %}{{ include.path }}{{ basename | replace: "[", "%5B" | replace: "]", "%5D" }}.{{ include.extension }}{% endcapture %}
{% capture webp %}/assets/webp/{{ basename | replace: "[", "%5B" | replace: "]", "%5D" }}{% endcapture %}
{%- if filename contains "200x200" -%}
{% assign zoom_image = filename | replace: '200x200', '958x539' %}
{%- else -%}
{% assign zoom_image = filename | replace: '500x500', '958x539' %}
{%- endif -%}
{% assign alt_zoom_image = basename | remove: '[r200x200]' | remove: '[r500x500]' %}
<picture>
    <source type="image/webp" srcset="{{ webp }}.webp" alt="{{ basename }}">
    {%- if filename contains ".png" -%}
    <source type="image/png" srcset="{{ filename }}" alt="{{ basename }}">
    {%- else if filename contains ".jpg" -%}
    <source type="image/jpeg" srcset="{{ filename }}" alt="{{ basename }}">
    {%- endif -%}
    <img onclick="zoom(this)" class="{{ include.css }}" src="{{ zoom_image }}" alt="{{ alt_zoom_image }}" href="{{ filename }}" />
</picture>
{% endfor %}
</div>
