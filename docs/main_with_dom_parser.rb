state = {
  url_name: '',
}

actions = {
  update_url_name: ->(state, value) { state[:url_name] = value }
}

view = ->(state, actions) {
  isvalid = state[:url_name].length >= 4

  eval DomParser.parse(<<-DOM)
    <form class='w-full max-w-sm'>
      <label class="block mb-2 text-sm font-medium text-700 dark:text-500">
        ユーザー名
      </label>
      <input
        type='text'
        class='{isvalid ? "bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" : "bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 dark:bg-red-100 dark:border-red-400"}'
        oninput='{->(e) { actions[:update_url_name].call(state, e[:target][:value].to_s) }}'
      >
      <p class='{isvalid ? "mt-2 text-sm text-green-600 dark:text-green-500" : "mt-2 text-sm text-red-600 dark:text-red-500"}'>
        {isvalid ? "有効です" : "ユーザー名は4文字以上にしてください"}
      </p>
    </form>
  DOM
}

App.new(
  el: "#app",
  state:,
  view:,
  actions:
)
