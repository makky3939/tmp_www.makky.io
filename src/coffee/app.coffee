$ ->
  $.ajax {
    dataType: 'xml',
    url: 'http://blog.makky.io/feed',
    success: (data) ->
      $(data).find('item').each ->
        item = $(this)
        date = new Date item.find('pubDate').text()

        post_date =
          date.getFullYear() + '/' +
          (date.getMonth() + 1) + '/' +
          date.getDay() + '/' +
          ' ' +
          date.getHours() + ':' +
          date.getMinutes() + ':' +
          date.getSeconds()
        link = item
          .find('link').text()
        title = item
          .find('title').text()
        description = item
          .find('description')
          .text()
          .replace('[&#8230;]', '')

        $post = """
          <div class='post'>
            <p class='post-date'>
              #{post_date}
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

        $($post).appendTo('.js-post-list').hide().fadeIn(300)
        return 0
      return 0
    error: (data) ->
      $error = """
        <div class='post error texe-center'>
          <i class='fa fa-warning' />
          <h3>記事の取得に失敗しました</h3>
        </div>
      """
      $('.js-post-list').append $error
      return 0
  }
