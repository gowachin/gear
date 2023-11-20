c4 <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(13.8, 15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66, 85.4, 114.1),
    max = c(23.4, 26.7, 33.5, 41.2, 52.1, 64.9, 87.9, 114.7, 148.5, 195),
    weight = c(69.8, 77.5, 93, 107.5, 123.9, 140.3, 181.1, 257.8, 348.1, 529.9),
    kn = c(9, 9, 12, 14, 14, 14, 14, 14, 14, 14),
    price = c(70.4, 70.4, 70.4, 70.4, 74.8, 83.6, 88, 96.8, 114.4, 132),
    type = "camalot c4",
    reduc = FALSE
)

c4_2 <- data.frame(
    couleur = c("blue", "gray", "violet", "green", "red", "gold", "blue", "gray", "violet", "green"),
    min = c(13.8, 15.5, 19.6, 23.9, 30.2, 37.2, 50.7, 66, 85.4, 114.1),
    max = c(23.4, 26.7, 33.5, 41.2, 52.1, 64.9, 87.9, 114.7, 148.5, 195),
    weight = c(75, 83, 99, 119, 136, 155, 201, 289, 380, 557),
    kn = c(9, 9, 12, 14, 14, 14, 14, 14, 14, 14),
    price = c(58.5, 58.5, 58.5, 58.5, 63, 63, 72, 81, 90, 108),
    type = "camalot c4 2018",
    reduc = FALSE
)


library(dplyr)
c4_2 %>%
    filter(max < 90) %>%
    summarise(total = sum(price))

528 * 0.9

rbind(c4, c4_2) %>%
    filter(max < 90) %>%
    group_by(type) %>%
    summarise(total = sum(price), wei = sum(weight))
