#/bin/sh
convert $1 \
        -resize x800 -resize '800x<'   -resize 50% \
        -gravity center  -crop 400x400+0+0 +repage \
        -colorspace Gray \
        \( +clone -threshold -1 -negate -fill white -draw "circle 200,200 200,0" \) \
                -alpha off -compose copy_opacity -composite \
                \-auto-orient \
    ${1%.*}.png
