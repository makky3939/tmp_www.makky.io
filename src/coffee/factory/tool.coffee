app.factory 'ToolModel', () ->
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
        live_path: "http://app.makky.io/pon_de_matcha"
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
        live_path: "http://app.makky.io/microphone_visualizer"
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
        live_path: "http://app.makky.io/amenimomakezu"
        tags: [""]
        description: "WebFontのお試し"
        updated_at: ""
        created_at: ""
      }
    ]
  return tools