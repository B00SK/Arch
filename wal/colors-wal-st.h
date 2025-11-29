const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c060f", /* black   */
  [1] = "#991634", /* red     */
  [2] = "#E30E2F", /* green   */
  [3] = "#8A0D43", /* yellow  */
  [4] = "#B0144E", /* blue    */
  [5] = "#D62446", /* magenta */
  [6] = "#D85847", /* cyan    */
  [7] = "#e4b9b2", /* white   */

  /* 8 bright colors */
  [8]  = "#9f817c",  /* black   */
  [9]  = "#991634",  /* red     */
  [10] = "#E30E2F", /* green   */
  [11] = "#8A0D43", /* yellow  */
  [12] = "#B0144E", /* blue    */
  [13] = "#D62446", /* magenta */
  [14] = "#D85847", /* cyan    */
  [15] = "#e4b9b2", /* white   */

  /* special colors */
  [256] = "#0c060f", /* background */
  [257] = "#e4b9b2", /* foreground */
  [258] = "#e4b9b2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
