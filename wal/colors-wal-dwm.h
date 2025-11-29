static const char norm_fg[] = "#e4b9b2";
static const char norm_bg[] = "#0c060f";
static const char norm_border[] = "#9f817c";

static const char sel_fg[] = "#e4b9b2";
static const char sel_bg[] = "#E30E2F";
static const char sel_border[] = "#e4b9b2";

static const char urg_fg[] = "#e4b9b2";
static const char urg_bg[] = "#991634";
static const char urg_border[] = "#991634";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
