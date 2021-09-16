#!/bin/bash
#
# Author: Diogo Alexsander Cavilha <diogocavilha@gmail.com>
# Date:   03.02.2016
#
# Commands manager.

. ~/.fancy-git/modules/settings-manager.sh
. ~/.fancy-git/modules/git-manager.sh
. ~/.fancy-git/modules/update-manager.sh
. ~/.fancy-git/modules/app-manager.sh
. ~/.fancy-git/theme-functions.sh

case "$1" in
    # Core commands.
    "-h"|"--help") fancygit_app_command_show_help;;
    "-v"|"--version") fancygit_app_command_show_version;;
    "--suggested-global-git-config") fancygit_git_show_suggested_git_config;;
    "--suggested-global-git-config-apply") fancygit_git_suggested_git_config_apply;;
    "--config-list") fancygit_config_show;;
    "--reset") fancygit_config_reset;;
    "--update") fancygit_update;;
    "--fonts-install") fancygit_app_command_install_fonts;;
    "--changelog-show") fancygit_changelog_show;;

    # Feature switchers.
    "--enable-full-path") fancygit_config_save "show_full_path" "true";;
    "--disable-full-path") fancygit_config_save "show_full_path" "false";;
    "--enable-show-user-at-machine") fancygit_config_save "show_user_at_machine" "true";;
    "--disable-show-user-at-machine") fancygit_config_save "show_user_at_machine" "false";;
    "--enable-time") fancygit_config_save "show_time" "true";;
    "--disable-time") fancygit_config_save "show_time" "false";;
    "--enable-double-line") fancygit_config_save "double_line" "true";;
    "--disable-double-line") fancygit_config_save "double_line" "false";;
    "--enable-rich-notification") fancygit_config_save "show_rich_notification" "true";;
    "--disable-rich-notification") fancygit_config_save "show_rich_notification" "false";;

    # Separator styles.
    "--separator-default") fancygit_config_save "separator" "";;
    "--separator-blocs") fancygit_config_save "separator" "";;
    "--separator-blocs-tiny") fancygit_config_save "separator" "";;
    "--separator-fire") fancygit_config_save "separator" "";;
    "--separator-lego") fancygit_config_save "separator" "";;
    "--separator-curve") fancygit_config_save "separator" "";;
    "--separator-paint") fancygit_config_save "separator" "";;

    #  Themes.
    "--theme-default") fancygit_theme_set "default" "default" "true";;
    "--theme-human") fancygit_theme_set "human" "human" "false";;
    "--theme-simple") fancygit_theme_set "simple" "simple" "false";;

    # Color schemes.
    "--color-scheme-simple") fancygit_theme_color_scheme_set "simple" "simple";;
    "--color-scheme-human") fancygit_theme_color_scheme_set "human" "human";;
    "--color-scheme-default") fancygit_theme_color_scheme_set "default" "default";;
    "--color-scheme-dracula") fancygit_theme_color_scheme_set "default" "dracula";;
    "--color-scheme-dark") fancygit_theme_color_scheme_set "default" "dark";;
    "--color-scheme-dark-col") fancygit_theme_color_scheme_set "default" "dark-col";;
    "--color-scheme-light") fancygit_theme_color_scheme_set "default" "light";;

    # Deprecated commands.
    "--config-reset") fancygit_app_command_deprecation_warning "--reset";;
    "--colors") fancygit_app_command_deprecation_warning "--suggested-global-git-config";;
    "--colors-set") fancygit_app_command_deprecation_warning "--suggested-global-git-config-apply";;
    "--colors-apply") fancygit_app_command_deprecation_warning "--suggested-global-git-config-apply";;
    "--enable-show-time") fancygit_app_command_deprecation_warning "--enable-time";;
    "--disable-show-time") fancygit_app_command_deprecation_warning "--disable-time";;
    "update") fancygit_app_command_deprecation_warning "--update";;
    "configure-fonts") fancygit_app_command_deprecation_warning "--fonts-install";;
    "dark-col-double-line") fancygit_app_command_deprecation_warning "--color-scheme-dark-col";;
    "double-line") fancygit_app_command_deprecation_warning "--enable-double-line";;
    "dark-double-line") fancygit_app_command_deprecation_warning "--enable-double-line";;
    "light-double-line") fancygit_app_command_deprecation_warning "--enable-double-line";;
    "human-single-line") fancygit_app_command_deprecation_warning "--disable-double-line";;
    "human-dark") fancygit_app_command_deprecation_warning "--theme-human";;
    "human-dark-single-line") fancygit_app_command_deprecation_warning "--disable-double-line";;
    "simple-double-line") fancygit_app_command_deprecation_warning "--enable-double-line";;
    "simple") fancygit_app_command_deprecation_warning "--theme-simple";;
    "default") fancygit_app_command_deprecation_warning "--theme-default";;
    "human") fancygit_app_command_deprecation_warning "--theme-human";;
    "dark") fancygit_app_command_deprecation_warning "--color-scheme-dark";;
    "dark-col") fancygit_app_command_deprecation_warning "--color-scheme-dark-col";;
    "light") fancygit_app_command_deprecation_warning "--color-scheme-light";;
    "") fancygit_app_command_return;;
    *) fancygit_app_command_not_found "$1";;
esac
