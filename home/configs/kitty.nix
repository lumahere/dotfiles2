{pkgs, config, ...}:
{
    programs.kitty.enable = true;
    programs.kitty.settings = with config.colorScheme.colors; {
    confirm_os_window_close = 0;

         #Font config
        font_family  =      "jetbrains mono nerd font";
        bold_font    =      "jetbrains mono nerd font";
        italic_font  =      "jetbrains mono nerd font";
        bold_italic_font =  "jetbrains mono nerd font";

        window_padding_width = 10;
        font_size = 14;
        # TABS
        tab_fade = 1;
        active_tab_foreground = "#${base0D}";
        active_tab_background = "#${base03}";
        active_tab_font_style = "bold";
        inactive_tab_foreground = "#${base04}";
        inactive_tab_background = "#${base00}";
        inactive_tab_font_style = "bold";
        
        # BLACK
        color0 = "#${base02}"; 
        color8 = "#${base02}"; 
        #RED
        color1 = "#${base08}"; 
        color9 = "#${base08}"; 
        # GREEN
        color2  = "#${base0B}"; 
        color10 = "#${base0B}";
        # YELLOW 
        color3 = "#${base0A}"; 
        color11 = "#${base0A}"; 
        # BLUE
        color4  = "#${base0C}"; 
        color12 = "#${base0C}"; 
        # MAGENTA 
        color5  = "#${base0E}"; 
        color13 = "#${base0E}"; 
        #CYAN
        color6 = "#${base0D}"; 
        color14 = "#${base0D}"; 
        #WHITE
        color7 = "#${base07}"; 
        color15 = "#${base07}"; 

        #CURSOR
        cursor = "#${base08}"; 
        cursor_text_color = "#${base00}"; 
        # Selection highlight
        selection_foreground = "none";
        selection_background =  "#28344a";

        background = "#${base00}";
    };
    

}