/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 30;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char *fonts[]          = { "monospace:size=10" };
static const char col_gray1[]       = "#000000";
static const char col_gray2[]       = "#ffffff";
static const char col_gray3[]       = "#ffffff";
static const char col_gray4[]       = "#bcbcbc";
static const char col_gray5[]       = "#3D3D3D";
static const char col_color[]       = "#ffffff";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_gray1,  col_color  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "Media" };

static const Rule rules[] = {
	/* class                                 instance    title       tags mask     isfloating   monitor */
	{ "strawberry",                          NULL,       NULL,       1 << 8,           1,           -1 },
	{ "org.nicotine_plus.Nicotine",          NULL,       NULL,       1 << 7,           1,           -1 },
	{ "steam",                               NULL,       NULL,       1 << 6,           1,           -1 },
	{ "copyq",                               NULL,       NULL,       0,           1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 60;  /* refresh rate (per second) for client move/resize */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "| master",      tile }, 
	{ "| stacked",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#include <X11/XF86keysym.h>
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { "alacritty", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_q,      spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      zoom,           {0} },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_w,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_t,      togglefloating, {0} },
	
	//Custom binds & Function key binds
	{ MODKEY,                  XK_b,         spawn,    SHCMD("brave") },
	{ MODKEY,                  XK_e,         spawn,    SHCMD("thunar") },
	{ MODKEY,                  XK_v,         spawn,    SHCMD("copyq show") },
	{ MODKEY|ShiftMask,        XK_s,         spawn,    SHCMD("flameshot gui") },
	{ MODKEY|ShiftMask,        XK_l,         spawn,    SHCMD("i3lock") },
	{ MODKEY|ShiftMask,        XK_e,         spawn,    SHCMD("rofimoji") },
	{ MODKEY,                  XK_r,         spawn,    SHCMD("rofi -show drun") },
	{ MODKEY|ControlMask|ShiftMask, XK_q,    spawn,    SHCMD("~/.config/rofi/scripts/power.sh") },
	{ 0, XF86XK_AudioRaiseVolume,  spawn,    SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+") },
	{ 0, XF86XK_AudioLowerVolume,  spawn,    SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-") },
	{ 0, XF86XK_AudioMute,         spawn,    SHCMD("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") },
	{ 0, XF86XK_MonBrightnessUp,   spawn,    SHCMD("brightnessctl set 5%+") },
	{ 0, XF86XK_MonBrightnessDown, spawn,    SHCMD("brightnessctl set 5%-") },
	{ 0, XF86XK_AudioPlay,            spawn,    SHCMD("playerctl play-pause")  },
	{ 0, XF86XK_AudioNext,            spawn,    SHCMD("playerctl next")        },
	{ 0, XF86XK_AudioPrev,            spawn,    SHCMD("playerctl previous")    },
	
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};

