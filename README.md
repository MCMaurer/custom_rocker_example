# custom_rocker_example
Making a customized Rocker image with RStudio settings, keybindings, and .RProfile

Fork this repo, then modify `.config/rstudio/` and `.Rprofile` with your own. You can find this directory at `~/.config/rstudio/` on Mac and Linux (I think). This will contain keybindings, RStudio preferences, and any custom themes.

You can add any `.ttf` files to the `.config/rstudio/fonts/` directory, which will then become available as RStudio editor fonts. You can modify your `rstudio-prefs.json` file to use those fonts, like this:

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
