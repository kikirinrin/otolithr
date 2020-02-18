# otolithr
[![Travis build status](https://travis-ci.org/kikirinrin/otolithr.svg?branch=master)](https://travis-ci.org/kikirinrin/otolithr)
[![codecov](https://codecov.io/gh/kikirinrin/otolithr/branch/master/graph/badge.svg)](https://codecov.io/gh/kikirinrin/otolithr)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

![example](https://gist.githubusercontent.com/akikirinrin/1949f96742cbd8ba4396cf57657888d0/raw/9bccbc1e775c5fa16fbe4d5ecfb79a00fe551a52/example.png)

![plot](https://gist.githubusercontent.com/akikirinrin/1949f96742cbd8ba4396cf57657888d0/raw/9bccbc1e775c5fa16fbe4d5ecfb79a00fe551a52/plot.png)

## 目的
成長解析の手順を属人化させないためのパッケージです。

## 機能
現時点では`.hdr`ファイルを直接読み込んでデータフレームを作るだけの機能しかありません。

こまごました機能は、みなさんと作っていきたいと思います。

挙動や生成されるデータフレームの列名などの様式は、現時点でのたたき台です。

使いにくいところ、気に食わないところなど、どんどんお寄せ下さい。

## 使い方

### インストール
以下をRのコンソールに打ち込んでください
```
# install.packages("devtools")   # If package 'devtools' is not installed to your machine
devtools::install_github("akikirinrin/otolithr")
library(otolithr)
```
### 使ってみる
```
path <- "YOUR_PATH_TO_HDR_FILES"                  # .hdr ファイルが入ったNASのフォルダなど
dat  <- hdr2df_in_dir(path, species = "maiwashi") # 現時点ではマイワシのみに対応
plot(dat)                                         # 日齢--耳石径をプロットします
```
