### Optional NVIDIA-only color decoder

> :warning: This feature is deprecated and will be removed.
> This decoder has not shown significant benefits compared to other decoders.

Optionally enable an additional color decoder for your NVIDIA GPU with these steps.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/{{- page.title | slugify -}}/#download>
2. The ZIP download contains four files for this decoder. Copy them to your {{ page.title }} folder.
   ```
   nppc64_11.dll
   nppicc64_11.dll
   nppidei64_11.dll
   nvjpeg64_11.dll
   ```
3. Enable the feature with the attribute `@decodercolor nvidia`
