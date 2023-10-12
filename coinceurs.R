
# Datatest ####
## Friends ####

d <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(14, 16, 20, 24, 29, 38, 50, 68, NA, NA),
    max = c(21, 25, 33, 41, 50, 64, 85, 114, NA, NA),
    weight = c(75, 85, 97, 108, 130, 160, 180, 197, NA, NA),
    kn = c(9, 9, 14, 14, 14, 14, 14, 14, 14, 14),
    price = c(69.9, 69.9, 69.9, 72.9, 72.9, 76.9, 79.9, 83.9, 91.9, 103.9),
    type = "dragon",
    reduc = TRUE
)


df <- data.frame(
    couleur = c("green", "red", "gold", "blue", "gray", "violet"),
    min = c(7.8, 8.7, 10.2, 12.1, 15.1, 19),
    max = c(11, 12.9, 15.2, 17.9, 22.5, 28.3),
    weight = c(55, 55, 65, 67, 70, 73),
    kn = c(6, 6, 8, 8, 9, 9),
    price = c(74.9, 74.9, 74.9, 78.9, 78.9, 78.9),
    type = "dragonfly",
    reduc = TRUE
)

wc <- data.frame(
    couleur = c("hotpink", "green", "red", "gold", "blue", "gray"),
    min = c(20.6, 25.8, 31.7, 41.5, 52.7, 66.8),
    max = c(34.5, 43, 53.6, 69.3, 88, 112.1),
    weight = c(98, 115, 134, 159, 202, 283),
    kn = 10,
    price = c(74.9, 74.9, 79.9, 84.9, 84.9, 89.9),
    type = "wildcountry",
    reduc = TRUE
)

c4 <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(13.8, 15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66, 85.4, 114.1),
    max = c(23.4, 26.7, 33.5, 41.2, 52.1, 64.9, 87.9, 114.7, 148.5, 195),
    weight = c(69.8, 77.5, 93, 107.5, 123.9, 140.3, 181.1, 257.8, 348.1, 529.9),
    kn = c(9, 9, 12, 14, 14, 14, 14, 14, 14, 14),
    price = c(73.9, 73.9, 73.9, 73.9, 78.9, 87.9, 92.9, 99.9, 119.9, 136.9),
    type = "camalot c4",
    reduc = FALSE
)


hl <- data.frame(
    couleur = c("gray", "violet", "green", "red", "gold", "blue", "gray"),
    min = c(15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66),
    max = c(26.7, 33.5, 41.2, 53.1, 64.9, 87.9, 114.7),
    weight = c(61, 74, 89, 101, 126, 167, 225),
    kn = c(8, 10, 12, 12, 12, 12, 12),
    price = c(96.9, 96.9, 96.9, 99.9, 109.9, 119.9, 129.9),
    type = "camalot hl",
    reduc = FALSE
)


coinceurs <- rbind(d, df, hl, wc, c4) %>% as_tibble() %>%
    mutate(
        type = as.factor(type), mid = (min + max)/2,
        couleur = factor(couleur,
                         levels = c("blue", "gray", "violet", "hotpink", "green", "red", "gold" )))


library(dplyr)
library(ggplot2)


coinceurs %>%
    ggplot(aes(x = type, size = kn/10, color = couleur)) +
    geom_linerange(aes(ymin = min, ymax = max),
                   position = position_dodge2(width = 0.6)) +
    geom_point(aes(y = price*ifelse(reduc, 0.82, 1)),
               position = position_dodge2(width= 0.6), shape = 4) +
    scale_colour_identity() +
    scale_y_continuous(
        name = "Size (mm)",
        sec.axis = sec_axis(trans=~.*1, name="Price")
    ) +
    NULL


# Wanted
coinceurs %>%
    filter(type %in% c("dragon", "dragonfly")) %>%
    group_by(type) %>%
    filter(min < 60) %>%
    mutate(price = price * 0.82) %>% summarise(total = sum(price))
