#----------------------------------------------------------------
# インスタンス変数の設定
# テーマ「base」や「default」にインスタンス変数が存在する場合は、
#   ・インスタンス変数の設定
#   ・defaultテーマの読み込み
# とすることで、インスタンス変数の内容がスライドに反映される
#----------------------------------------------------------------

# スライド全体のフォントを「やさしさゴシックボールド」へと変更
@font_family = find_font_family("07YasashisaGothicBold")


# スライドタイトルのフォントサイズを変更
@title_slide_title_font_size = screen_size(1 * Pango::SCALE)
@title_slide_subtitle_font_size = screen_size(2 * Pango::SCALE)
@title_slide_author_font_size = screen_size(3 * Pango::SCALE)
@title_slide_date_font_size = screen_size(4 * Pango::SCALE)


# 通常スライドのフォントサイズを変更
# ヘッドラインなど
@large_font_size = screen_size(1 * Pango::SCALE)
# スライド内で一般的に使われるサイズ(リストの1段目とか)
@normal_font_size = screen_size(2 * Pango::SCALE)
# リストの2段目など
@small_font_size = screen_size(3 * Pango::SCALE)
# リストの3段目など
@x_small_font_size = screen_size(4 * Pango::SCALE)
# 旗に書かれている数字の大きさ
@xx_small_font_size = screen_size(5 * Pango::SCALE)


# ヘッドライン下部の罫線について、色と太さを変更
# 色
@default_headline_line_color = "#0066FF"
# 太さ
@default_headline_line_width = 10


# 箇条書きリストのビュレット形
@default_item1_mark_type = "rectangle"  # 四角
@default_item2_mark_type = "circle"     # 円
@default_item3_mark_type = "dash"       # 直線


# 箇条書きリストのビュレット色
# 16進数表記のほか、以下のような色名も使える
# http://noz.day-break.net/webcolor/colorname.html
@default_item1_mark_color = "#FF0000"   # red
@default_item2_mark_color = "#009900"   # green
@default_item3_mark_color = "green"



#----------------------------------------------------------------
# デフォルトテーマのinclude
#----------------------------------------------------------------
include_theme("default")


#----------------------------------------------------------------
# インスタンス変数で制御するもの以外の設定
# include後にprop_set()することで、スライドに反映される
#----------------------------------------------------------------

# 字体の変更
# Dateはイタリック体になっているので、通常にする
match(TitleSlide, Date) do |dates|
  dates.prop_set("style", "normal")
end


# 配置の変更
# Authorを右づめにし、マージンも変更する
match(TitleSlide, Author) do |authors|
  # horizontal_centeringを解除しないと、alignが反映されない
  authors.horizontal_centering = false
  authors.align = :right
  # 上のマージンを設定
  authors.margin_top = @space * 15
end


# ヘッドラインのセンタリング
match(Slide, HeadLine) do |headlines|
  headlines.each do |headline|
    # trueはセンタリング、falseは左詰め
    headline.horizontal_centering = true
  end
end


# 画像ファイルのあるパスを追加
# 指定したディレクトリを画像ディレクトリとして認識する
# (ルートはカレントディレクトリ)
# 今回の場合、defaultテーマをincludeした後に呼ばないと正常に動作しない
add_image_path('images')
