#### Optional Nvidia-only color decoder

> ⚠️ This Nvidia nvJPEG decoder is deprecated and was removed in plugin v1.3.2023.
> It did not show significant benefits during testing when compared to other decoders.

Optionally enable an additional color decoder for your Nvidia GPU with these steps.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/{{- page.title | slugify -}}/#download>.
2. The ZIP download contains four files for this decoder. Copy them to your {{ page.title }} folder.
   ```
   nppc64_11.dll
   nppicc64_11.dll
   nppidei64_11.dll
   nvjpeg64_11.dll
   ```
3. Enable the feature with [`@decodercolor nvjpeg`]({{- site.baseurl -}}/max/attributes/decodercolor).
