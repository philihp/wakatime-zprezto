## Install

```
$ pip install wakatime
$ npm install --global wakatime-zprezto
```

Make sure your [API key](https://wakatime.com/settings/api-key) is in your ~/.wakatime.cfg file.

Then go into your .zpreztorc file and add the module to your Prezto modules

````zsh
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  ...
  'wakatime'
````
