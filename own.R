library(dplyr)
library(ggplot2)
# Datatest ####
# Prices from vieux camp
## Friends ####

d <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(14, 16, 20, 24, 29, 38, 50, 68, NA, NA),
    max = c(21, 25, 33, 41, 50, 64, 85, 114, NA, NA),
    weight = c(75, 85, 97, 108, 130, 160, 180, 197, NA, NA),
    kn = c(9, 9, 14, 14, 14, 14, 14, 14, 14, 14),
    number = 0,
    type = "dragon"
)


df <- data.frame(
    couleur = c("green", "red", "gold", "blue", "gray", "violet"),
    min = c(7.8, 8.7, 10.2, 12.1, 15.1, 19),
    max = c(11, 12.9, 15.2, 17.9, 22.5, 28.3),
    weight = c(55, 55, 65, 67, 70, 73),
    kn = c(6, 6, 8, 8, 9, 9),
    number = 0,
    type = "dragonfly"
)

al <- data.frame(
    couleur = c("green", "red", "gold", "blue", "gray", "violet"), # df colors
    # couleur = c("black", "blue", "green", "gold", "gray", "red"), # true colors
    min = c(8, 10, 13, 15, 17, 20),
    max = c(14, 17, 22, 25, 30, 33),
    weight = c(46, 48, 52, 58, 59, 61),
    kn = c(5, 6, 7, 10, 10, 10),
    number = 0,
    type = "alien revo short"
)

ax <- data.frame(
    couleur = c("green", "red", "gold", "blue", "gray", "violet"), # df colors
    # couleur = c("black", "blue", "green", "gold", "gray", "red"), # true colors
    min = c(9.3, 10.8, 13.8, 16.1, 18.6, 20.3),
    max = c(14, 16.1, 20.8, 25.7, 28, 33.4),
    weight = c(55, 56, 64, 64, 66, 70),
    kn = c(5, 6, 7, 9.5, 9.5, 9.5),
    number = 0,
    type = "alien x"
)

wc <- data.frame(
    couleur = c("hotpink", "green", "red", "gold", "blue", "gray"),
    min = c(20.6, 25.8, 31.7, 41.5, 52.7, 66.8),
    max = c(34.5, 43, 53.6, 69.3, 88, 112.1),
    weight = c(98, 115, 134, 159, 202, 283),
    kn = 10,
    number = 0,
    type = "wildcountry"
)

wc0 <- data.frame(
    couleur = c("red", "gold", "blue", "gray", "violet", "green"),
    min = c(8.5, 10.4, 13.8, 15.8, 20.2, 25.4),
    max = c(13.2, 15.7, 22.3, 25.9, 32.9, 40.1),
    weight = c(51, 58.1, 68.6, 70.6, 76.9, 82.6),
    kn = c(5, 6, 9, 9, 9, 9),
    number = 0,
    type = "wildcountry zero"
)

c4 <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(13.8, 15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66, 85.4, 114.1),
    max = c(23.4, 26.7, 33.5, 41.2, 52.1, 64.9, 87.9, 114.7, 148.5, 195),
    weight = c(69.8, 77.5, 93, 107.5, 123.9, 140.3, 181.1, 257.8, 348.1, 529.9),
    kn = c(9, 9, 12, 14, 14, 14, 14, 14, 14, 14),
    number = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
    type = "camalot c4"
)

oc4 <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(13.8, 15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66, 85.4, 114.1),
    max = c(23.4, 26.7, 33.5, 41.2, 52.1, 64.9, 87.9, 114.7, 148.5, 195),
    weight = NA,
    kn = c(9, 9, 12, 14, 14, 14, 14, 14, 14, 14),
    number = c(0, 0, 0, 0, 1, 1, 0, 0, 0, 0),
    type = "old camalot c4"
)


hl <- data.frame(
    couleur = c("gray", "violet", "green", "red", "gold", "blue", "gray"),
    min = c(15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66),
    max = c(26.7, 33.5, 41.2, 53.1, 64.9, 87.9, 114.7),
    weight = c(61, 74, 89, 101, 126, 167, 225),
    kn = c(8, 10, 12, 12, 12, 12, 12),
    number = 0,
    type = "camalot hl"
)

z4 <- data.frame(
    couleur = c("green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(7.5, 8.8, 10.4, 12.4, 15.3, 18.8, 23.1),
    max = c(11.8, 13.8, 16.3, 22.6, 27.7, 33.9, 42.1),
    weight = c(43, 45, 48, 53, 61, 77, 93),
    kn = c(5, 5, 6, 8, 9, 10, 10),
    number = c(0, 0, 0, 0, 0, 0, 1),
    type = "camalot z4"
)


to <- data.frame(
    # couleur = c("black", "blue", "gray", "violet", "green", "red", "gold")
    couleur = c("gold", "blue", "gray", "violet", "green", "red", "gold"),
    min = c(11.7, 13.8, 17, 20.9, 25.7, 31.6, 39.7),
    max = c(18.9, 22.5, 27.7, 34.2, 42.3, 52.2, 64.2),
    weight = c(69, 75, 83, 95, 109, 132, 144),
    kn = c(6, 8, 9, 10, 13, 13, 13),
    number = c(1, 1, 1, 1, 1, 1, 0),
    type = "totem"
)

bn <- data.frame(
    couleur = c("blue", "red", "gold", "green", "violet"),
    min = c(3.7, 4.8, 6.1, 7.9, 10.3),
    max = c(6.4, 9, 11.6, 13.8, 17.5),
    weight = c(31, 39, 49, 58, 73),
    kn = c(7, 8, 8, 8, 8),
    number = c(1, 1, 1, 0, 0),
    type = "ballnut"
)


coinceurs <- rbind(d, df, wc, wc0, oc4, c4, hl, z4, to, bn) %>% as_tibble() %>%
    filter(number > 0) %>%
    mutate(
        type = as.factor(type), mid = (min + max)/2,
        couleur = factor(couleur,
                         levels = c("blue", "gray", "violet", "hotpink", "green", "red", "gold" ))) %>%
    mutate()




coinceurs %>%
    ggplot(aes(x = type, size = kn/10, color = couleur)) +
    geom_linerange(aes(ymin = min, ymax = max),
                   position = position_dodge2(width = 0.6)) +
    # geom_point(aes(y = weight),
               # position = position_dodge2(width= 0.6), shape = 4) +
    scale_colour_identity() +
    scale_y_continuous(
        name = "Size (mm)",
        sec.axis = sec_axis(trans=~.*1, name="Weight")
    ) +
    NULL



## Nuts ####

wn <- data.frame(
    couleur = c("violet", "green", "gray", "gold", "blue", "red", "black", "lightblue", "gray", "green"),
    min = c(7, 8, 9, 11, 13, 16, 18, 21, 24, 28),
    max = c(15, 15, 16, 16, 18, 23, 26, 27, 33, 34),
    weight = c(16, 26, 28, 30, 34, 40, 42, 48, 62, 76),
    kn =    c(7.5, 13, 13, 13, 13, 13, 13, 13, 13, 13),
    price = c(11.5, 11.5, 11.5, 11.5, 11.5, 11.5, 11.5, 11.95, 11.95, 12.5),
    type = "wallnuts",
    reduc = TRUE
)
