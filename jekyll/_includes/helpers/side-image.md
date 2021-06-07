{% capture filename %}{{ include.path | replace: "[", "%5B" | replace: "]", "%5D" }}{% endcapture %}
{% capture webp %}/assets/webp/{{ include.basename | replace: "[", "%5B" | replace: "]", "%5D" }}{% endcapture %}
{%- if filename contains "200x200" -%}
{% assign zoom_image = filename | replace: '200x200', '958x539' %}
{%- else -%}
{% assign zoom_image = filename | replace: '500x500', '958x539' %}
{%- endif -%}
{% assign alt_zoom_image = include.basename | remove: '[r200x200]' | remove: '[r500x500]' %}
<picture>
    <source type="image/webp" srcset="{{ webp }}.webp" alt="{{ include.basename }}">
    {%- if filename contains ".png" -%}
    <source type="image/png" srcset="{{ filename }}" alt="{{ include.basename }}">
    {%- else if filename contains ".jpg" -%}
    <source type="image/jpeg" srcset="{{ filename }}" alt="{{ include.basename }}">
    {%- endif -%}
    <img onclick="zoom(this)" class="{{ include.css }}" src="{{ zoom_image }}" alt="{{ alt_zoom_image }}" href="{{ filename }}" />
</picture>

