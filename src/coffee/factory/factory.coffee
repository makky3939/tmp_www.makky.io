'use strict'
angular.module('makkyio')
  .factory('ToolModel', () ->
    tools =
      [
        {
          name: "pon_de_matcha"
          title: "ポン・デ・抹茶チョコ"
          link_path: "#/tool/pon_de_matcha"
          image_path: [
            "image/tool/pon_de_matcha.png"
          ]
          app_path: "app/pon_de_matcha.html"
          live_path: "#/tool/pon_de_matcha/live"
          tags: [""]
          description: "SVGでポン・デ・抹茶チョコを描画してみました。"
          updated_at: "2014/06/22"
          created_at: "2014/06/22"
        }
        {
          name: "microphone_visualizer"
          title: "Microphone Visualizer"
          link_path: "#/tool/microphone_visualizer"
          image_path: [
            "image/tool/microphone_visualizer.png"
          ]
          app_path: "app/microphone_visualizer.html"
          live_path: "#/tool/microphone_visualizer/live"
          tags: [""]
          description:
            "Web Audio APIで取得したマイクの音を用いて、Canvasのアニメーションを描画します。
            Web Audio APIをサポートしているブラウザからご利用下さい。"
          updated_at: "2014/03/29"
          created_at: "2014/03/15"
        }
        {
          name: "hexadecimal_generator"
          title: "Hexadecimal Generator"
          link_path: "#/tool/hexadecimal_generator"
          image_path: [
            "image/tool/hexadecimal_generator.png"
          ]
          app_path: ""
          live_path: ""
          tags: [""]
          description: "This is how to become a Hacker."
          updated_at: ""
          created_at: ""
        }
        {
          name: "amenimo_webfont"
          title: "雨にも負けず(WebFont)"
          link_path: "#/tool/amenimo_webfont"
          image_path: [
            "image/tool/amenimo_webfont.png"
          ]
          app_path: ""
          live_path: ""
          tags: [""]
          description: "WebFontのお試し"
          updated_at: ""
          created_at: ""
        }
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
          image_path: [
            "image/portfolio/beef_clicker_1.png",
            "image/portfolio/beef_clicker_2.png",
            "image/portfolio/beef_clicker_3.png",
            "image/portfolio/beef_clicker_4.png"
          ]
          description:
            "第39回 筑波大学 雙峰祭において、春日地区クラス代表者会議が出店したお店の売り上げカウンターアプリです。
            Ruby on Rails4を用いて開発しました。
            売り上げデータはSQLite3で扱い、WebSocketを用いて閲覧中の他のユーザにもリアルタイムに売上個数を共有することが出来ます。
            GoogleChartsを用いてグラフを作成することも出来ます。"
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
          detail_path: "#/portfolio/website/kasuga14_freshman"
          blog_path: ""
          live_path: "http://www.stb.tsukuba.ac.jp/~kasuga-campus/shinkan/"
          git_path: "https://github.com/kuradai/kasuga14_freshman"
          image_path: [
            "image/portfolio/kasuga14_freshman.png"
          ]
          description: "2014年度の筑波大学 春日地区新入生歓迎会のWebサイトです。"
          updated_at: "2014/04/13"
          created_at: "2014/03/24"
        },
        {
          name: "shinsai_kangaeru"
          title: "震災について考えるサイト"
          tags: [""]
          detail_path: "#/portfolio/website/shinsai_kangaeru"
          blog_path: ""
          live_path: "http://sinsai-kangaeru.jp/"
          git_path: ""
          image_path: [
            "image/portfolio/shinsai_kangaeru_1.png",
            "image/portfolio/shinsai_kangaeru_2.png",
            "image/portfolio/shinsai_kangaeru_3.png"
          ]
          description:
            "地震や放射線に関する調査や活動についてまとめたWebサイトです。
            第15回 全日本中学高校Webコンテスト ThinkQuest JAPANにおいて、プラチナ賞とYahoo!基金特別賞を受賞しました。"
          updated_at: "2013/01/11"
          created_at: "2012/04/01"
        },
        {
          name: "zishinn_kangaeru"
          title: "震災について考えるサイト"
          tags: [""]
          detail_path: "#/portfolio/website/zishinn_kangaeru"
          blog_path: ""
          live_path: "http://zisinn-kangaeru.makkysnote.org"
          git_path: ""
          image_path: [
            "image/portfolio/zishinn_kangaeru_1.png",
            "image/portfolio/zishinn_kangaeru_2.png",
            "image/portfolio/zishinn_kangaeru_3.png"
          ]
          description:
            "地震に関する調査や活動についてまとめたWebサイトです。
            第11回高校生ホームページコンテストにおいて、準グランプリを受賞しました。"
          updated_at: "2013/01/20"
          created_at: "2012/07/01"
        },
        {
          name: "mth"
          title: "水戸工業高等学校Webサイト"
          tags: [""]
          detail_path: "#/portfolio/website/mth"
          blog_path: ""
          live_path: "http://www.mito-th.ed.jp"
          git_path: ""
          image_path: [
            "image/portfolio/mth_1.png",
            "image/portfolio/mth_2.png",
            "image/portfolio/mth_3.png"
          ]
          description:
            "茨城県立水戸工業高等学校のWebサイトです。
            既存の機能の改善や新機能の実装、Webサイト全体のHTML5化に貢献しました。"
          updated_at: "2011/010/1"
          created_at: "2013/03/01"
        }
      ]
    return {webapp: _webapp, website: _website}
  )