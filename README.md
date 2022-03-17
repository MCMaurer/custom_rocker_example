# custom_rocker_example
This repo is an example of a customized Rocker Tidyverse image with RStudio settings, keybindings, and .RProfile.

To create your own, you can fork this repo, then modify `.config/rstudio/` and `.Rprofile` with your own versions. You can find the config stuff locally at `~/.config/rstudio/` on Mac. I think it's in the same spot on Linux and `AppData/Roaming/RStudio` on Windows. This will contain keybindings, RStudio preferences, and any custom themes.

You can add any `.ttf` files to the `.config/rstudio/fonts/` directory, which will then become available as RStudio editor fonts. You can modify your `rstudio-prefs.json` file to use those fonts, adding lines like this to the JSON:

```{json}
"server_editor_font": "FiraCode",
"server_editor_font_enabled": true
```
 Finally, you can add any other packages to be installed in the Dockerfile. Currently, one CRAN package and one GitHub package are installed:
 
```{Dockerfile}
 RUN install2.r --error --deps TRUE \
    slider \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN installGithub.r weecology/ratdat \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
```

To add more packages, just put them in newlines like this:

```{Dockerfile}
 RUN install2.r --error --deps TRUE \
    slider \
    wesanderson \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN installGithub.r weecology/ratdat \
    thomasp85/gganimate \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
```

Finally, from this repo's directory, you can run `bash build_run.sh`, which will build and launch the customized Rocker container. You can also specify a password, or a random one will be generated by default.
