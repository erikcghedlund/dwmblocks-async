#ifndef CONFIG_H
#define CONFIG_H
#define MINUTES 60
#define HOURS 3600

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 1

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X(" ", "date '+%H:%M'", 10, 10) \
    X("📂 ", STATSCMD, 1 * HOURS, 12) \
    X(" ", UPDATESCMD, 2, 13) \
    X(" ", WEATHERCMD, 30 * MINUTES, 14) \
    X(" ", "date '+%Y-%m-%d'", 15 * MINUTES, 15) \
    X("", "pgrep spotify_player &> /dev/null && playerctl metadata --player spotify_player --format '{{status}}: {{title}} - {{artist}}' | sed 's/Paused://g' | sed 's/Playing://g'", 3, 16) \

#endif  // CONFIG_H
