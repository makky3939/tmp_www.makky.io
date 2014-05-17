angular.module('makkyio')
  .factory('ToolModel', () ->
    tools = 
      [
        {
          name: "hexadecimal_generator"
          title: "Hexadecimal Generator"
          link_path: "#/tool/hexadecimal_generator"
          image_path: "image/tool/hexadecimal_generator.png"
          tags: [""]
          discription: ""
          updated_at: ""
          created_at: ""
        }
        {
          name: "canvas_wave"
          title: "Canvas Wave"
          link_path: "#/tool/canvas_wave"
          image_path: "image/tool/canvas_wave.png"
          tags: [""]
          discription: ""
          updated_at: ""
          created_at: ""
        }
        {
          name: "canvas_clock"
          title: "Canvas Clock"
          link_path: "#/tool/canvas_clock"
          image_path: "image/tool/canvas_clock.png"
          tags: [""]
          discription: ""
          updated_at: ""
          created_at: ""
        }
      ]
    return tools
  )