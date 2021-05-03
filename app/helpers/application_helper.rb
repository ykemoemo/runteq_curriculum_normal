module ApplicationHelper
     # 引数が渡されなかった場合は空文字をデフォルト値とする
  def page_title(page_title = '')
    base_title = 'RUNTEQ BOARD APP'

    # 三項演算子
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
