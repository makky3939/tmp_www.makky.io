$ ->
  $.ajax {
    dataType: 'xml',
    url: 'http://blog.makky.io/feed',
    success: (data) ->
      $(data).find('item').each ->
        date = new Date $(this).find('pubDate').text()
        link = $(this).find('link').text()
        title = $(this).find('title').text()
        description = $(this).find('description').text().replace('[&#8230;]', '')

        $post = """
          <div class='post'>
            <p class='post-date'>
              #{date.getFullYear()}/#{date.getMonth()}/#{date.getDay()} #{date.getHours()}:#{date.getMinutes()}:#{date.getSeconds()}
            </p>
            <h3>
              <a href='#{link}' target='_blank'>#{title}</a>
            </h3>
            <p>
              #{description}
              <a href='#{link}' target='_blank'>続きを読む</a>
            </p>
          </div>
        """

        $('.js-post-list').append $post
        return 0
      return 0
  }
