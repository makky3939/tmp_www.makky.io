'use strict'
angular.module('makkyio')
  .factory('ToolModel', () ->
    tools = 
      [
        {
          name: "microphone_visualizer"
          title: "Microphone Visualizer"
          link_path: "#/tool/microphone_visualizer"
          image_path: "image/tool/microphone_visualizer.png"
          app_path: "app/microphone_visualizer.html"
          live_path: "#/tool/microphone_visualizer/live"
          tags: [""]
          description: "Web Audio APIで取得したマイクの音を用いて、Canvasのアニメーションを描画します。Web Audio APIをサポートしているブラウザからご利用下さい。"
          updated_at: "2014/03/29"
          created_at: "2014/03/15"
        }
        # {
        #   name: "hexadecimal_generator"
        #   title: "Hexadecimal Generator"
        #   link_path: "#/tool/hexadecimal_generator"
        #   image_path: "image/tool/hexadecimal_generator.png"
        #   tags: [""]
        #   description: ""
        #   updated_at: ""
        #   created_at: ""
        # }
      ]
    return tools
  )

  .factory('PortfolioModel', () ->
    _webapp = 
      [
        {
          name: "beef_clicker"
          title: "BeefClicker"
          tags: [""]
          detail_path: "#/portfolio/webapp/beef_clicker"
          blog_path: "http://blog.makkysnote.org/archives/430"
          live_path: ""
          git_path: "https://github.com/kuradai/BeefClicker"
          image_path: "image/portfolio/beef_clicker_1.png"
          images_path: ["image/portfolio/beef_clicker_2.png", "image/portfolio/beef_clicker_3.png", "image/portfolio/beef_clicker_4.png"]
          description: "第39回 筑波大学 雙峰祭において、春日地区クラス代表者会議が出店したお店の売り上げカウンターアプリです。Ruby on Rails4を用いて開発しました。売り上げデータはSQLite3で扱い、WebSocketを用いて閲覧中の他のユーザにもリアルタイムに売上個数を共有することが出来ます。GoogleChartsを用いてグラフを作成することも出来ます。"
          updated_at: "2013/08/23"
          created_at: "2013/11/01"
        }
      ]
    _website =
      [
        {
          name: "kasuga14_freshman"
          title: "春日地区新入生歓迎会2014"
          tags: [""]
          detail_path: "#/portfolio/webapp/kasuga14_freshman"
          blog_path: ""
          live_path: ""
          git_path: "https://github.com/kuradai/kasuga14_freshman"
          image_path: "image/portfolio/kasuga14_freshman.png"
          images_path: ""
          description: "2014年度の筑波大学 春日地区新入生歓迎会のWebサイトです。"
          updated_at: "2014/04/13"
          created_at: "2014/03/24"
        }
      ]
    return {webapp: _webapp, website: _website}
  )